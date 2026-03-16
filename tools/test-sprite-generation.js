import fs from 'fs';
import path from 'path';
import { NES, Controller } from 'jsnes';
import sharp from 'sharp';
import { fal } from '@fal-ai/client';

fal.config({ credentials: process.env.FAL_KEY });

const ROM_PATH = path.join(process.env.HOME, 'nes-roms', 'Super Mario Bros. (World).nes');
const OUTPUT_DIR = path.join(process.cwd(), 'experiment-output');
fs.mkdirSync(OUTPUT_DIR, { recursive: true });

const results = [];  // { label, outFile, prompt, elapsed, error }

// ── Helpers ──────────────────────────────────────────────────────────────────

async function uploadToFal(filePath) {
  const buf = fs.readFileSync(filePath);
  const blob = new Blob([buf], { type: 'image/png' });
  const url = await fal.storage.upload(blob);
  console.log(`  Uploaded ${path.basename(filePath)} → ${url}`);
  return url;
}

async function downloadImage(url, outPath) {
  const resp = await fetch(url);
  if (!resp.ok) throw new Error(`Download failed: ${resp.status} ${resp.statusText}`);
  const buf = Buffer.from(await resp.arrayBuffer());
  fs.writeFileSync(outPath, buf);
}

async function runKontext(label, input, outPath) {
  // Pick endpoint based on whether we're sending multiple images
  const isMulti = Array.isArray(input.image_urls);
  const endpoint = isMulti
    ? 'fal-ai/flux-pro/kontext/multi'
    : 'fal-ai/flux-pro/kontext';

  console.log(`\n[${label}]`);
  console.log(`  endpoint: ${endpoint}`);
  if (input.image_url) console.log(`  image_url: ${input.image_url.slice(0, 70)}...`);
  if (isMulti)         console.log(`  image_urls: [${input.image_urls.length} images]`);
  console.log(`  prompt: "${input.prompt.slice(0, 90)}..."`);

  const t0 = Date.now();
  try {
    const result = await fal.subscribe(endpoint, {
      input,
      logs: false,
      onQueueUpdate: (update) => {
        if (update.status === 'IN_PROGRESS') {
          process.stdout.write(`  [${((Date.now() - t0) / 1000).toFixed(0)}s] in progress...\r`);
        }
      }
    });
    const elapsed = ((Date.now() - t0) / 1000).toFixed(1);
    process.stdout.write('\n');

    const imageUrl = result.data.images[0].url;
    await downloadImage(imageUrl, outPath);
    const size = fs.statSync(outPath).size;
    console.log(`  ✓ ${elapsed}s → ${path.basename(outPath)} (${(size / 1024).toFixed(1)}KB)`);
    results.push({ label, outFile: path.basename(outPath), prompt: input.prompt, elapsed: parseFloat(elapsed), error: null });
  } catch (err) {
    const elapsed = ((Date.now() - t0) / 1000).toFixed(1);
    process.stdout.write('\n');
    console.error(`  ✗ FAILED after ${elapsed}s: ${err.message}`);
    results.push({ label, outFile: path.basename(outPath), prompt: input.prompt, elapsed: parseFloat(elapsed), error: err.message });
  }
}

// ── Step 0: Boot SMB and capture gameplay frame ───────────────────────────────

async function captureGameplayFrame() {
  console.log('\n=== Booting SMB — capturing gameplay frame ===');

  let capturedFrame = null;

  const nes = new NES({
    onFrame: (frameBuffer) => {
      // jsnes reuses the buffer; must copy before it changes
      const copy = new Int32Array(frameBuffer.length);
      for (let i = 0; i < frameBuffer.length; i++) copy[i] = frameBuffer[i];
      capturedFrame = copy;
    },
    onAudioSample: () => {}
  });

  const romData = fs.readFileSync(ROM_PATH);
  nes.loadROM(romData.toString('binary'));
  console.log('  ROM loaded');

  // Press Start every 30 frames until gameplay is confirmed
  let frames = 0;
  let gameplay = false;
  while (frames < 600) {
    if (frames % 30 === 0) nes.buttonDown(1, Controller.BUTTON_START);
    if (frames % 30 === 3)  nes.buttonUp(1, Controller.BUTTON_START);
    nes.frame();
    frames++;

    const gameMode  = nes.cpu.mem[0x0770];
    const playerX   = nes.cpu.mem[0x0086];
    const playerState = nes.cpu.mem[0x0756];

    if (gameMode !== 0 && playerX >= 20 && playerX <= 100 && playerState === 0) {
      console.log(`  Gameplay confirmed at frame ${frames}: mode=$${gameMode.toString(16)} playerX=${playerX}`);
      gameplay = true;
      break;
    }
  }
  if (!gameplay) console.log('  WARNING: could not confirm gameplay, proceeding anyway');

  // Run 200 more frames: ~120f to clear the level-intro cutsceen ("WORLD 1-1 × 3")
  // then ~80f into actual gameplay so Mario is standing on the ground with scenery visible
  for (let i = 0; i < 200; i++) nes.frame();

  if (!capturedFrame) throw new Error('No frame captured');

  // Convert NES pixel format 0xXXRRGGBB → RGB
  const W = 256, H = 240;
  const rgb = Buffer.alloc(W * H * 3);
  for (let i = 0; i < W * H; i++) {
    const p = capturedFrame[i];
    rgb[i * 3 + 0] = (p >> 16) & 0xFF;
    rgb[i * 3 + 1] = (p >>  8) & 0xFF;
    rgb[i * 3 + 2] =  p        & 0xFF;
  }

  // 3x nearest-neighbor upscale: 256×240 → 768×720
  // Keeps pixel art sharp; gives the API more pixels to reason about
  const outPath = path.join(OUTPUT_DIR, 'smb-gameplay-frame.png');
  await sharp(rgb, { raw: { width: W, height: H, channels: 3 } })
    .resize(W * 3, H * 3, { kernel: 'nearest' })
    .png()
    .toFile(outPath);

  const size = fs.statSync(outPath).size;
  console.log(`  Saved: ${outPath} (${(size / 1024).toFixed(1)}KB, 768×720)`);
  return outPath;
}

// ── Main ──────────────────────────────────────────────────────────────────────

async function main() {
  if (!process.env.FAL_KEY) {
    console.error('ERROR: FAL_KEY environment variable not set.\nRun: export FAL_KEY=your_key_here');
    process.exit(1);
  }

  // ── Frame capture ─────────────────────────────────────────────────────────
  const gameplayFramePath = await captureGameplayFrame();

  // Upload once; reuse URL across all experiments
  console.log('\n=== Uploading reference to fal storage ===');
  const gameplayFrameUrl = await uploadToFal(gameplayFramePath);

  // ── Experiment A: Image-to-image transformation ───────────────────────────
  console.log('\n=== EXPERIMENT A: Image-to-image character transformation ===');

  await runKontext(
    'A1: Knight scene',
    {
      prompt: 'Transform the main character in this retro game screenshot into a medieval knight in armor. Keep the retro pixel art style. Keep the same scene layout and background.',
      image_url: gameplayFrameUrl
    },
    path.join(OUTPUT_DIR, 'test1a-knight-scene.png')
  );

  await runKontext(
    'A2: Resistance scene',
    {
      prompt: 'Transform the main character in this retro game screenshot into a 1940s resistance fighter in a trench coat and beret. Keep the retro pixel art style and scene layout.',
      image_url: gameplayFrameUrl
    },
    path.join(OUTPUT_DIR, 'test1a-resistance-scene.png')
  );

  // ── Experiment B: Text-to-image sprite sheet generation ───────────────────
  console.log('\n=== EXPERIMENT B: Text-to-image sprite sheet generation ===');

  await runKontext(
    'B1: Knight sprite sheet',
    {
      prompt: 'A retro pixel art sprite sheet for a medieval knight character. The sheet shows a 16x32 pixel character in 6 poses arranged in a horizontal row: standing, walking frame 1, walking frame 2, walking frame 3, jumping, and attacking with sword. NES-style limited color palette: silver armor, dark blue, brown boots, skin tone. Each pose separated by clear gaps. Transparent magenta background. Clean pixel art, no anti-aliasing.'
    },
    path.join(OUTPUT_DIR, 'test1b-knight-spritesheet.png')
  );

  await runKontext(
    'B2: Resistance fighter sprite sheet',
    {
      prompt: 'A retro pixel art sprite sheet for a 1940s French resistance fighter. The sheet shows a 16x32 pixel character in 6 poses arranged in a horizontal row: standing, walking frame 1, walking frame 2, walking frame 3, jumping, and crouching. NES-style limited color palette: brown trench coat, dark green beret, khaki pants, skin tone. Each pose separated by clear gaps. Transparent magenta background. Clean pixel art, no anti-aliasing.'
    },
    path.join(OUTPUT_DIR, 'test1b-resistance-spritesheet.png')
  );

  // ── Experiment C: Multi-reference style transfer ──────────────────────────
  console.log('\n=== EXPERIMENT C: Multi-reference style transfer ===');

  await runKontext(
    'C1: Styled sprite sheet',
    {
      prompt: 'Generate a sprite sheet in the exact pixel art style of the reference game screenshot. Show a knight character in 4 poses: standing, walking, jumping, attacking. Same pixel density and color palette constraints as the reference game. Arrange poses in a horizontal strip.',
      image_urls: [gameplayFrameUrl]
    },
    path.join(OUTPUT_DIR, 'test1c-styled-spritesheet.png')
  );

  // ── Summary ───────────────────────────────────────────────────────────────
  const succeeded = results.filter(r => !r.error).length;
  const totalTime  = results.reduce((s, r) => s + r.elapsed, 0).toFixed(1);
  console.log(`\n=== Results: ${succeeded}/${results.length} succeeded, ${totalTime}s total ===`);
  for (const r of results) {
    const status = r.error ? `✗ ${r.error}` : `✓ ${r.elapsed}s`;
    console.log(`  ${r.label}: ${status}`);
  }

  await generateReport(gameplayFramePath);
}

// ── HTML Report ───────────────────────────────────────────────────────────────

async function generateReport(gameplayFramePath) {
  console.log('\n=== Generating report ===');

  const succeeded = results.filter(r => !r.error).length;
  const totalTime  = results.reduce((s, r) => s + r.elapsed, 0).toFixed(1);
  const estCost    = `~$${(succeeded * 0.04).toFixed(2)}`;

  const tableRows = results.map(r => `
      <tr class="${r.error ? 'err' : 'ok'}">
        <td>${r.label}</td>
        <td>${r.elapsed}s</td>
        <td>${r.error ? '✗ ' + escHtml(r.error) : '✓ Success'}</td>
      </tr>`).join('');

  function card(label, file, prompt, elapsed) {
    const filePath = path.join(OUTPUT_DIR, file);
    const exists   = fs.existsSync(filePath);
    const timing   = elapsed != null ? ` <span class="timing">(${elapsed}s)</span>` : '';
    const imgHtml  = exists
      ? `<img src="${file}" alt="${label}">`
      : `<div class="missing">No output</div>`;
    const promptHtml = prompt
      ? `<div class="prompt">"${escHtml(prompt)}"</div>`
      : '';
    return `<div class="card">
        <div class="card-label">${escHtml(label)}${timing}</div>
        ${imgHtml}${promptHtml}
      </div>`;
  }

  const refCard = card('Reference: SMB gameplay capture (3× scale)', 'smb-gameplay-frame.png', null, null);

  const expA = results.filter(r => r.label.startsWith('A'));
  const expB = results.filter(r => r.label.startsWith('B'));
  const expC = results.filter(r => r.label.startsWith('C'));

  function sectionCards(rows) {
    return rows.map(r => card(r.label, r.outFile, r.prompt, r.elapsed)).join('\n      ');
  }

  const html = `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Test 1: Sprite Generation — Results</title>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    body  { font-family: system-ui, -apple-system, sans-serif; background: #111; color: #ddd; padding: 24px; }
    h1    { font-size: 1.4rem; margin-bottom: 6px; }
    .meta { color: #777; font-size: .82rem; margin-bottom: 20px; }
    h2    { font-size: 1rem; color: #aaa; border-bottom: 1px solid #2a2a2a; padding-bottom: 5px; margin: 28px 0 4px; }
    .subtitle { color: #666; font-size: .82rem; font-style: italic; margin-bottom: 12px; }
    .cards { display: flex; flex-wrap: wrap; gap: 16px; margin-top: 10px; }
    .card  { background: #1c1c1c; border-radius: 6px; overflow: hidden; max-width: 500px; flex: 1 1 300px; }
    .card-label { padding: 7px 10px; font-size: .82rem; font-weight: 600; background: #252525; }
    .timing { font-weight: 400; color: #777; }
    .card img   { display: block; width: 100%; image-rendering: pixelated; }
    .missing    { padding: 40px; text-align: center; color: #555; font-size: .85rem; }
    .prompt     { padding: 7px 10px; font-size: .76rem; color: #777; line-height: 1.45; border-top: 1px solid #222; }
    table { border-collapse: collapse; width: 100%; max-width: 700px; margin-bottom: 20px; font-size: .85rem; }
    th, td { text-align: left; padding: 5px 12px; border-bottom: 1px solid #222; }
    th   { background: #222; color: #999; }
    .ok  td:last-child { color: #6f6; }
    .err td:last-child { color: #f66; }
  </style>
</head>
<body>
  <h1>Test 1: Sprite Generation via Kontext (FLUX Pro)</h1>
  <p class="meta">Generated: ${new Date().toISOString()} &nbsp;·&nbsp; ${succeeded}/${results.length} succeeded
     &nbsp;·&nbsp; ${totalTime}s total &nbsp;·&nbsp; est. cost: ${estCost}</p>

  <table>
    <thead><tr><th>Experiment</th><th>Time</th><th>Status</th></tr></thead>
    <tbody>${tableRows}</tbody>
  </table>

  <h2>Reference Image</h2>
  <p class="subtitle">SMB gameplay screenshot captured via jsnes (256×240 upscaled 3× with nearest-neighbor)</p>
  <div class="cards">${refCard}</div>

  <h2>Experiment A — Image-to-Image Character Transformation</h2>
  <p class="subtitle">Can Kontext restyle a pixel art character while preserving scene layout?</p>
  <div class="cards">
    ${sectionCards(expA)}
  </div>

  <h2>Experiment B — Text-to-Image Sprite Sheet Generation</h2>
  <p class="subtitle">Can Kontext generate a usable sprite sheet from a text prompt alone (no reference image)?</p>
  <div class="cards">
    ${sectionCards(expB)}
  </div>

  <h2>Experiment C — Multi-Reference Style Transfer</h2>
  <p class="subtitle">Can Kontext use the gameplay screenshot as a pixel-art style reference for new sprite generation?</p>
  <div class="cards">
    ${sectionCards(expC)}
  </div>
</body>
</html>`;

  const reportPath = path.join(OUTPUT_DIR, 'test1-results.html');
  fs.writeFileSync(reportPath, html);
  console.log(`Report: ${reportPath}`);
}

function escHtml(str) {
  return String(str)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
}

main().catch(err => { console.error('Fatal:', err); process.exit(1); });

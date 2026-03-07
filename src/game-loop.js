import { state, MAP_W, MAP_H, TILE } from './state.js';
import { initInput } from './input.js';
import { buildEntities, updateEntities } from './entities.js';
import { updatePlayer } from './physics.js';
import { updateCamera } from './camera.js';
import { render, offscreen } from './renderer.js';

const NATIVE_H   = 240;   // level height fixed at 15 tiles × 16px
const MIN_NATIVE_W = 256; // minimum native viewport width (16 tiles)
const MAX_SCALE  = 3;     // cap: tiles never larger than 48px on screen

const displayCanvas = document.getElementById('c');
const displayCtx = displayCanvas.getContext('2d');
displayCtx.imageSmoothingEnabled = false;

let scale = 1;

function updateScale() {
  // Largest integer scale that still keeps tiles ≤ MAX_SCALE × 16px on screen
  scale = Math.max(1, Math.min(MAX_SCALE,
    Math.floor(Math.min(window.innerWidth / MIN_NATIVE_W, window.innerHeight / NATIVE_H))
  ));
  // Use remaining screen space for a wider native viewport (show more level)
  const nativeW = Math.floor(window.innerWidth / scale);
  state.nativeW = nativeW;
  offscreen.width  = nativeW;
  offscreen.height = NATIVE_H;
  displayCanvas.width  = nativeW * scale;
  displayCanvas.height = NATIVE_H * scale;
}

window.addEventListener('resize', updateScale);

function loop() {
  if (state.episode) {
    updatePlayer();
    updateEntities();
    updateCamera();
    render();
    // Blit offscreen → display at integer scale (crisp pixels)
    displayCtx.imageSmoothingEnabled = false;
    displayCtx.drawImage(offscreen, 0, 0, state.nativeW * scale, NATIVE_H * scale);
    // HUD drawn on display canvas AFTER blit — renders at screen resolution, no blur
    const s = scale;
    displayCtx.fillStyle = 'rgba(0,0,0,0.55)';
    displayCtx.fillRect(0, 0, 210 * s, 22 * s);
    displayCtx.fillStyle = '#fff';
    displayCtx.font = `${11 * s}px monospace`;
    displayCtx.fillText('← → move   SPACE / ↑ jump', 8 * s, 15 * s);
  }
  requestAnimationFrame(loop);
}

async function init() {
  updateScale();
  initInput();

  const res = await fetch('data/test-fixtures/episode1.json');
  if (!res.ok) throw new Error(`HTTP ${res.status} loading episode1.json`);
  state.episode = await res.json();

  // Tileset
  const rawTiles = state.episode.episode.spatial.layers[0].tileset_spec.tiles;
  state.tileset = {};
  for (const [k, v] of Object.entries(rawTiles)) {
    state.tileset[parseInt(k)] = { color: v.color, collision: v.collision === true };
  }

  // Tilemap from base64_uint8
  const b64 = state.episode.episode.spatial.layers[0].data;
  const binary = atob(b64);
  state.tilemap = new Uint8Array(binary.length);
  for (let i = 0; i < binary.length; i++) state.tilemap[i] = binary.charCodeAt(i);

  // Player
  const ps = state.episode.player.position;
  state.player = {
    x: ps.x, y: ps.y,
    vx: 0, vy: 0,
    w: 16, h: 24,
    onGround: false,
    coyote: 0,
    prevJumpHeld: false,
  };

  buildEntities();
  requestAnimationFrame(loop);
}

init().catch(err => {
  displayCtx.fillStyle = '#5C94FC';
  displayCtx.fillRect(0, 0, displayCanvas.width, displayCanvas.height);
  displayCtx.fillStyle = '#fff';
  displayCtx.font = '16px monospace';
  displayCtx.textAlign = 'center';
  displayCtx.fillText('Failed to load episode1.json', displayCanvas.width / 2, displayCanvas.height / 2 - 12);
  displayCtx.font = '13px monospace';
  displayCtx.fillText(err.message, displayCanvas.width / 2, displayCanvas.height / 2 + 12);
  console.error(err);
});

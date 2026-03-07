import { state, H } from './state.js';
import { initInput } from './input.js';
import { buildEntities, updateEntities } from './entities.js';
import { updatePlayer } from './physics.js';
import { updateCamera } from './camera.js';
import { render, offscreen } from './renderer.js';

const DEFAULT_LEVEL   = 'data/test-fixtures/episode1.json';
const NATIVE_H        = 240;   // level height fixed at 15 tiles × 16px
const MIN_NATIVE_W    = 256;   // minimum native viewport width (16 tiles)
const MAX_SCALE       = 3;     // cap: tiles never larger than 48px on screen

const displayCanvas = document.getElementById('c');
const displayCtx = displayCanvas.getContext('2d');
displayCtx.imageSmoothingEnabled = false;

let scale = 1;

function updateScale() {
  scale = Math.max(1, Math.min(MAX_SCALE,
    Math.floor(Math.min(window.innerWidth / MIN_NATIVE_W, window.innerHeight / NATIVE_H))
  ));
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
    displayCtx.fillRect(0, 0, state.nativeW * s, 22 * s);
    displayCtx.fillStyle = '#fff';
    displayCtx.font = `${11 * s}px monospace`;
    displayCtx.fillText('← → move   SPACE / ↑ jump   ` level select', 8 * s, 15 * s);
  }
  requestAnimationFrame(loop);
}

// ─── Level loader ─────────────────────────────────────────────────────────────

export async function loadLevel(url) {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`HTTP ${res.status} loading ${url}`);
  const data = await res.json();
  state.episode = data;

  // Spatial dimensions — read from JSON with defaults
  const spatial = data.episode.spatial;
  state.mapW     = spatial?.width     ?? 210;
  state.mapH     = spatial?.height    ?? 15;
  state.tileSize = spatial?.tile_size ?? 16;

  // Tileset — read collision + color from tileset_spec
  const rawTiles = spatial?.layers?.[0]?.tileset_spec?.tiles ?? {};
  state.tileset = {};
  for (const [k, v] of Object.entries(rawTiles)) {
    state.tileset[parseInt(k)] = {
      color:     v.color     ?? '#888888',
      collision: v.collision === true,
    };
  }

  // Tilemap — decode base64_uint8
  const b64 = spatial?.layers?.[0]?.data ?? '';
  if (b64) {
    const binary = atob(b64);
    state.tilemap = new Uint8Array(binary.length);
    for (let i = 0; i < binary.length; i++) state.tilemap[i] = binary.charCodeAt(i);
  } else {
    // Minimal fallback: all sky tiles (0)
    state.tilemap = new Uint8Array(state.mapW * state.mapH);
  }

  // Player — read position and dimensions with fallbacks
  const ps   = data.player?.position ?? {};
  const dims = data.player?.asset_spec?.visual?.dimensions ?? [16, 24];
  state.player = {
    x: ps.x ?? 48,
    y: ps.y ?? (state.mapH - 4) * state.tileSize,
    vx: 0, vy: 0,
    w: dims[0] ?? 16,
    h: dims[1] ?? 24,
    onGround: false,
    coyote: 0,
    prevJumpHeld: false,
  };

  state.cameraX = 0;
  buildEntities();
}

// ─── Level select UI ──────────────────────────────────────────────────────────

function showLevelSelect() {
  document.getElementById('level-select').style.display = 'flex';
}

function hideLevelSelect() {
  document.getElementById('level-select').style.display = 'none';
}

// Backtick toggles level select while playing
window.addEventListener('keydown', e => {
  if (e.code === 'Backquote') {
    const sel = document.getElementById('level-select');
    if (sel.style.display === 'none') {
      showLevelSelect();
    } else {
      hideLevelSelect();
    }
  }
});

function showError(err) {
  displayCtx.fillStyle = '#0A0A2A';
  displayCtx.fillRect(0, 0, displayCanvas.width, displayCanvas.height);
  displayCtx.fillStyle = '#fff';
  displayCtx.font = '16px monospace';
  displayCtx.textAlign = 'center';
  displayCtx.fillText('Failed to load level', displayCanvas.width / 2, displayCanvas.height / 2 - 12);
  displayCtx.font = '13px monospace';
  displayCtx.fillText(err.message, displayCanvas.width / 2, displayCanvas.height / 2 + 12);
  console.error(err);
}

// Wire up level-select buttons
document.querySelectorAll('#level-select button[data-level]').forEach(btn => {
  btn.addEventListener('click', async () => {
    hideLevelSelect();
    try {
      await loadLevel(btn.dataset.level);
      // Do NOT call requestAnimationFrame(loop) here — the loop is already
      // running from init. Starting a second loop doubles the physics update
      // rate and makes everything move at 2× speed.
    } catch (err) {
      showError(err);
    }
  });
});

// ─── Init ─────────────────────────────────────────────────────────────────────

async function init() {
  updateScale();
  initInput();

  // Start the loop exactly once. It runs perpetually; state.episode being
  // null just means physics/render are skipped until a level is loaded.
  requestAnimationFrame(loop);

  const params     = new URLSearchParams(window.location.search);
  const levelParam = params.get('level');

  if (levelParam) {
    try {
      await loadLevel(levelParam);
    } catch (err) {
      showError(err);
    }
  } else {
    showLevelSelect();
  }
}

init();

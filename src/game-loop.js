import { state, MAP_W, MAP_H, TILE } from './state.js';
import { initInput } from './input.js';
import { buildEntities, updateEntities } from './entities.js';
import { updatePlayer } from './physics.js';
import { updateCamera } from './camera.js';
import { render, offscreen } from './renderer.js';

// Display canvas — sized dynamically to integer multiple of 256×240
const displayCanvas = document.getElementById('c');
const displayCtx = displayCanvas.getContext('2d');
displayCtx.imageSmoothingEnabled = false;

let scale = 1;

function updateScale() {
  scale = Math.max(1, Math.floor(Math.min(window.innerWidth / 256, window.innerHeight / 240)));
  displayCanvas.width = 256 * scale;
  displayCanvas.height = 240 * scale;
}

window.addEventListener('resize', updateScale);

function loop() {
  if (state.episode) {
    updatePlayer();
    updateEntities();
    updateCamera();
    render();
    // Blit offscreen to display canvas at integer scale (crisp pixels)
    displayCtx.imageSmoothingEnabled = false;
    displayCtx.drawImage(offscreen, 0, 0, 256 * scale, 240 * scale);
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

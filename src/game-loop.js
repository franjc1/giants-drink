import { state, MAP_W, MAP_H, TILE } from './state.js';
import { initInput } from './input.js';
import { buildEntities, updateEntities } from './entities.js';
import { updatePlayer } from './physics.js';
import { updateCamera } from './camera.js';
import { render } from './renderer.js';

function loop() {
  if (state.episode) {
    updatePlayer();
    updateEntities();
    updateCamera();
    render();
  }
  requestAnimationFrame(loop);
}

async function init() {
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
    holdFrames: 0,
    prevJumpHeld: false,
  };

  buildEntities();
  requestAnimationFrame(loop);
}

const canvas = document.getElementById('c');
const ctx = canvas.getContext('2d');

init().catch(err => {
  const W = 800, H = 480;
  ctx.fillStyle = '#5C94FC';
  ctx.fillRect(0, 0, W, H);
  ctx.fillStyle = '#fff';
  ctx.font = '16px monospace';
  ctx.textAlign = 'center';
  ctx.fillText('Failed to load episode1.json', W / 2, H / 2 - 12);
  ctx.font = '13px monospace';
  ctx.fillText(err.message, W / 2, H / 2 + 12);
  console.error(err);
});

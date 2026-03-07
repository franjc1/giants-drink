import { state, W, H, MAP_W, MAP_H, TILE } from './state.js';

export const offscreen = document.createElement('canvas');
offscreen.width = W;
offscreen.height = H;
const ctx = offscreen.getContext('2d');

export function render() {
  const cameraX = Math.round(state.cameraX);  // integer snap — prevents 1px jitter from float lerp
  const nativeW = state.nativeW;
  const player = state.player;

  // Sky
  ctx.fillStyle = '#5C94FC';
  ctx.fillRect(0, 0, nativeW, H);

  // Tilemap
  const c0 = Math.max(0, Math.floor(cameraX / TILE));
  const c1 = Math.min(MAP_W - 1, Math.ceil((cameraX + nativeW) / TILE));

  for (let row = 0; row < MAP_H; row++) {
    const sy = row * TILE;
    for (let col = c0; col <= c1; col++) {
      const id = state.tilemap[row * MAP_W + col];
      if (id === 0) continue;
      const t = state.tileset[id];
      if (!t) continue;
      const sx = Math.round(col * TILE - cameraX);
      ctx.fillStyle = t.color;
      ctx.fillRect(sx, sy, TILE, TILE);
      if (t.collision) {
        ctx.strokeStyle = 'rgba(0,0,0,0.2)';
        ctx.lineWidth = 0.5;
        ctx.strokeRect(sx + 0.5, sy + 0.5, TILE - 1, TILE - 1);
      }
    }
  }

  // Entities
  for (const e of state.entities) {
    if (!e.alive) continue;
    const ex = Math.floor(e.x - cameraX);
    const ey = Math.floor(e.y);
    ctx.fillStyle = e.color;
    ctx.fillRect(ex, ey, e.w, e.h);
    ctx.fillStyle = '#fff';
    ctx.fillRect(ex + 2, ey + 3, 3, 3);
    ctx.fillRect(ex + e.w - 5, ey + 3, 3, 3);
    ctx.fillStyle = '#000';
    ctx.fillRect(ex + 3, ey + 4, 2, 2);
    ctx.fillRect(ex + e.w - 4, ey + 4, 2, 2);
  }

  // Player (red figure)
  const px = Math.floor(player.x - cameraX);
  const py = Math.floor(player.y);
  ctx.fillStyle = '#CC2200';
  ctx.fillRect(px, py + 10, player.w, player.h - 10);
  ctx.fillStyle = '#FFAA80';
  ctx.fillRect(px + 2, py + 4, player.w - 4, 8);
  ctx.fillStyle = '#CC2200';
  ctx.fillRect(px, py, player.w, 6);
  ctx.fillRect(px - 1, py + 4, player.w + 2, 3);
  ctx.fillStyle = '#000';
  ctx.fillRect(px + player.w - 5, py + 6, 2, 2);

}

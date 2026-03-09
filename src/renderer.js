import { state, W, H } from './state.js';

export const offscreen = document.createElement('canvas');
offscreen.width = W;
offscreen.height = H;
const ctx = offscreen.getContext('2d');

// ─── Image cache ──────────────────────────────────────────────────────────────

const imageCache = new Map(); // url → HTMLImageElement

function getImage(url) {
  if (!imageCache.has(url)) {
    const img = new Image();
    img.src = url;
    imageCache.set(url, img);
  }
  return imageCache.get(url);
}

// Draw from a resolved asset. Returns true if sprite was drawn, false if image not ready.
function drawSprite(resolvedAsset, dx, dy, dw, dh) {
  if (!resolvedAsset?.sheetUrl) return false;
  const img = getImage(resolvedAsset.sheetUrl);
  if (!img.complete || img.naturalWidth === 0) return false;
  const r = resolvedAsset.region;
  ctx.imageSmoothingEnabled = false;
  ctx.drawImage(img, r.x, r.y, r.w, r.h, dx, dy, dw, dh);
  return true;
}

// ─── Main render ─────────────────────────────────────────────────────────────

export function render() {
  const cameraX = Math.round(state.cameraX);  // integer snap — prevents 1px jitter from float lerp
  const nativeW = state.nativeW;
  const player = state.player;
  const TILE = state.tileSize;
  const MAP_W = state.mapW;
  const MAP_H = state.mapH;

  // Sky / background — read from episode palette if available
  const skyColor = state.episode?.meta?.aesthetic?.palette_colors?.[0] ?? '#5C94FC';
  ctx.fillStyle = skyColor;
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

    // Try Track A sprite first
    const spriteDrawn = drawSprite(e.resolvedAsset, ex, ey, e.w, e.h);

    if (!spriteDrawn) {
      // Track B / fallback: colored rectangle with eye dots
      ctx.fillStyle = e.color;
      ctx.fillRect(ex, ey, e.w, e.h);
      ctx.fillStyle = '#fff';
      ctx.fillRect(ex + 2, ey + 3, 3, 3);
      ctx.fillRect(ex + e.w - 5, ey + 3, 3, 3);
      ctx.fillStyle = '#000';
      ctx.fillRect(ex + 3, ey + 4, 2, 2);
      ctx.fillRect(ex + e.w - 4, ey + 4, 2, 2);
    }
  }

  // Player
  const px = Math.floor(player.x - cameraX);
  const py = Math.floor(player.y);

  const playerSpriteDrawn = drawSprite(player.resolvedAsset, px, py, player.w, player.h);

  if (!playerSpriteDrawn) {
    // Track B / fallback: red figure
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
}

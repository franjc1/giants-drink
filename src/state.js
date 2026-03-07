// Shared mutable game state. Imported by all modules.
export const state = {
  episode: null,
  tilemap: null,   // Uint8Array, row-major
  tileset: null,   // int id → { color, collision }
  player: null,
  entities: [],
  cameraX: 0,
  nativeW: 256,    // dynamic viewport width, updated on resize
};

export const MAP_W = 210;
export const MAP_H = 15;
export const TILE = 16;
export const W = 256;   // SNES native width
export const H = 240;   // SNES native height

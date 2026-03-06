// Shared mutable game state. Imported by all modules.
export const state = {
  episode: null,
  tilemap: null,   // Uint8Array, row-major
  tileset: null,   // int id → { color, collision }
  player: null,
  entities: [],
  cameraX: 0,
};

export const MAP_W = 210;
export const MAP_H = 15;
export const TILE = 16;
export const W = 800;
export const H = 480;

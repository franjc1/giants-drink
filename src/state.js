// Shared mutable game state. Imported by all modules.
export const state = {
  episode: null,
  tilemap: null,   // Uint8Array, row-major
  tileset: null,   // int id → { color, collision }
  player: null,
  entities: [],
  cameraX: 0,
  nativeW: 256,    // dynamic viewport width, updated on resize
  mapW: 210,       // level width in tiles, updated from JSON at load time
  mapH: 15,        // level height in tiles, updated from JSON at load time
  tileSize: 16,    // pixels per tile, updated from JSON at load time
};

export const W = 256;   // SNES native display width (fixed)
export const H = 240;   // SNES native display height (fixed)

import { state, MAP_W, TILE } from './state.js';

export function updateCamera() {
  const w = state.nativeW;
  const target = state.player.x - w * 0.35;
  state.cameraX += (target - state.cameraX) * 0.15;
  state.cameraX = Math.max(0, Math.min(state.cameraX, MAP_W * TILE - w));
}

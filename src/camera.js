import { state } from './state.js';

export function updateCamera() {
  const w = state.nativeW;
  const levelW = state.mapW * state.tileSize;
  const target = state.player.x - w * 0.35;
  state.cameraX += (target - state.cameraX) * 0.15;
  state.cameraX = Math.max(0, Math.min(state.cameraX, levelW - w));
}

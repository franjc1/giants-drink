import { state } from './state.js';
import { keys } from './input.js';
import { moveAndCollide } from './collision.js';

const COYOTE_FRAMES = 5;

export function respawnPlayer() {
  const ps = state.episode.player.position;
  const p = state.player;
  p.x = ps.x; p.y = ps.y;
  p.vx = 0;   p.vy = 0;
  p.coyote = 0;
}

export function updatePlayer() {
  const ph = state.episode.episode.physics;
  const p = state.player;

  const leftHeld  = keys['ArrowLeft']  || keys['KeyA'];
  const rightHeld = keys['ArrowRight'] || keys['KeyD'];
  const jumpHeld  = keys['Space'] || keys['ArrowUp'];

  // Horizontal
  const accel = ph.run_acceleration * (p.onGround ? 1.0 : ph.air_control);
  if (rightHeld) {
    p.vx = Math.min(p.vx + accel, ph.run_speed);
  } else if (leftHeld) {
    p.vx = Math.max(p.vx - accel, -ph.run_speed);
  } else {
    const fric = p.onGround ? ph.friction_ground : ph.friction_air;
    p.vx *= fric;
    if (Math.abs(p.vx) < 0.05) p.vx = 0;
  }

  // Jump: trigger on fresh press only
  const jumpPressed = jumpHeld && !p.prevJumpHeld;
  if (jumpPressed && (p.onGround || p.coyote > 0)) {
    p.vy = ph.jump_velocity;
    p.onGround = false;
    p.coyote = 0;
  }
  p.prevJumpHeld = jumpHeld;

  // Two-phase gravity (SMW-accurate):
  // ascending + held  → low gravity (long hang time)
  // ascending + released → high gravity (quick cut)
  // falling → high gravity
  const ascending = p.vy < 0;
  const gravity = (ascending && jumpHeld) ? ph.gravity_ascending : ph.gravity_falling;
  p.vy = Math.min(p.vy + gravity, ph.max_fall_speed);

  // Coyote
  if (p.onGround) p.coyote = COYOTE_FRAMES;
  else if (p.coyote > 0) p.coyote--;

  // Left world boundary
  p.x = Math.max(0, p.x);

  moveAndCollide(p);

  if (p.y > state.mapH * state.tileSize + 32) respawnPlayer();
}

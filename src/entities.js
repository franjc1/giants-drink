import { state } from './state.js';
import { moveAndCollide } from './collision.js';
import { respawnPlayer } from './physics.js';
import { resolveAsset } from './asset-resolver.js';

export function buildEntities() {
  const assetContext = state.episode.asset_context || {};

  state.entities = state.episode.episode.entity_placements
    .filter(p => p.active)
    .map(p => {
      const ent = state.episode.world.entities[p.entity_id];
      const dims = ent?.asset_spec?.visual?.dimensions ?? [16, 16];
      const [ew, eh] = dims;
      const speed = ent?.behavioral_params?.patrol_speed ?? 0.5;
      const range = ent?.behavioral_params?.patrol_range ?? 48;

      // Build semantic spec for asset resolver
      const placementSpec = p.asset_spec || {};
      const entRef = ent?.asset_spec?.reference || {};
      const semanticSpec = {
        style_reference: placementSpec.style_reference || normStyleRef(entRef.style_reference),
        category:        placementSpec.category        || guessCategory(ent),
        game:            placementSpec.game            || assetContext.game            || null,
        platform:        placementSpec.platform        || assetContext.platform        || null,
        style_era:       placementSpec.style_era       || ent?.asset_spec?.visual?.style_era || null,
        dimensions:      dims,
      };

      return {
        id: p.entity_id,
        x: p.position.x, y: p.position.y,
        vx: -speed, vy: 0,
        w: ew, h: eh,
        speed,
        patrolMin: p.position.x - range,
        patrolMax: p.position.x + range,
        onGround: false,
        onWall: false,
        alive: true,
        color: (ent?.faction_id === 'goomba_union') ? '#7B4A1E' : '#2D6A2D',
        resolvedAsset: resolveAsset(semanticSpec),
      };
    });
}

export function updateEntities() {
  const ph = state.episode.episode.physics;
  const player = state.player;
  const fallLimit = state.mapH * state.tileSize + 32;

  for (const e of state.entities) {
    if (!e.alive) continue;

    e.vy = Math.min((e.vy || 0) + ph.gravity_falling, ph.max_fall_speed);
    e.onWall = false;
    moveAndCollide(e);

    // Reverse at patrol limits or walls
    if (e.onWall || e.x <= e.patrolMin) e.vx =  e.speed;
    if (e.x + e.w >= e.patrolMax)       e.vx = -e.speed;

    if (e.y > fallLimit) { e.alive = false; continue; }

    // Player AABB
    if (player.x < e.x + e.w && player.x + player.w > e.x &&
        player.y < e.y + e.h && player.y + player.h > e.y) {
      // Stomp: player falling, feet above enemy midpoint
      if (player.vy > 0 && player.y + player.h < e.y + e.h * 0.6) {
        e.alive = false;
        player.vy = -7;
      } else {
        respawnPlayer();
      }
    }
  }
}

// Strip game suffix from a style reference: "goomba_smb3" → "goomba"
function normStyleRef(ref) {
  if (!ref) return null;
  return ref.replace(/_(smb\d*|smw|mm\d*|smb\d_\w+)$/i, '');
}

// Guess asset category from entity data
function guessCategory(ent) {
  if (!ent) return 'enemy';
  if (ent.type === 'player') return 'player';
  const role = ent.asset_spec?.narrative?.role;
  if (role === 'protagonist') return 'player';
  return 'enemy';
}

// Asset Resolver — Track A/B sprite lookup
//
// Track A (reference): real sprite sheets from asset-catalog.json
//   Layer 1: vision_tags named_character match (game + style_reference)
//   Layer 2: vision_tags semantic match (game + category + visual descriptors)
//   Layer 3: platform + category fallback (best programmatic tag match)
//   No vision_tags on matched sheet → returns null (colored rect fallback)
//
// Track B (generated): always returns null → renderer draws colored rectangles

const CATALOG_URL = 'data/assets/asset-catalog.json';

// Normalize a style reference string for comparison.
// "goomba_smb3" → "goomba", "Mario (Small)" → "mario small", etc.
function normRef(s) {
  if (!s) return '';
  return s.toLowerCase()
    .replace(/_smb\d*/g, '')   // strip _smb1/_smb2/_smb3
    .replace(/_smw/g, '')      // strip _smw
    .replace(/_mm\d*/g, '')    // strip _mm1/_mm2 etc.
    .replace(/[^a-z0-9 ]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

// Map fixture style_era values to catalog platform values
const ERA_TO_PLATFORM = {
  'nes_early': 'nes',
  'nes_mid': 'nes',
  'nes_late': 'nes',
  'snes': 'snes',
  'genesis': 'genesis',
  'gameboy': 'gameboy-gbc',
  'gba': 'gba',
};

function eraToPlatform(era) {
  return ERA_TO_PLATFORM[era] || null;
}

// Score how well a vision_tags entity matches the spec's style_reference
function entityNameScore(entity, styleRef) {
  const name = normRef(entity.named_character || entity.name || '');
  const ref = normRef(styleRef);
  if (!name || !ref) return 0;
  if (name === ref) return 10;
  if (name.includes(ref) || ref.includes(name)) return 5;
  // Check individual words
  const nameWords = new Set(name.split(' '));
  const refWords = ref.split(' ').filter(w => w.length > 2);
  const matches = refWords.filter(w => nameWords.has(w)).length;
  return matches > 0 ? matches : 0;
}

// Score how well a vision_tags entity matches the spec's category type
function entityTypeScore(entity, category) {
  if (!entity.type || !category) return 0;
  if (entity.type === category) return 3;
  // Rough equivalences
  if (category === 'enemy' && (entity.type === 'enemy' || entity.type === 'boss')) return 2;
  if (category === 'player' && entity.type === 'player') return 3;
  if (category === 'item' && entity.type === 'collectible') return 2;
  return 0;
}

// Given a sheet with vision_tags, find the best matching entity for this spec
function findBestEntity(entry, spec) {
  if (!entry.vision_tags?.entities?.length) return null;
  let best = null;
  let bestScore = 0;
  for (const entity of entry.vision_tags.entities) {
    let score = 0;
    if (spec.style_reference) score += entityNameScore(entity, spec.style_reference);
    if (spec.category)        score += entityTypeScore(entity, spec.category);
    // Prefer entities with actual bounding boxes
    if (entity.bounding_box?.w > 0 && entity.bounding_box?.h > 0) score += 1;
    if (score > bestScore) { best = entity; bestScore = score; }
  }
  return bestScore > 0 ? best : null;
}

// Build result from catalog entry + vision entity
function makeResult(entry, entity) {
  const bb = entity.bounding_box || { x: 0, y: 0, w: entry.width, h: entry.height };
  const region = { x: bb.x, y: bb.y, w: bb.w, h: bb.h };
  return {
    sheetUrl: entry.file,
    region,
    animationFrames: [region],   // single frame for now; expanded when per-frame data arrives
    entityName: entity.named_character || entity.name || null,
  };
}

// Programmatic tag match score (Layer 3)
function programmaticScore(entry, spec) {
  let score = 0;
  const pt = entry.programmatic_tags || {};
  // Prefer sheets with estimated grid (likely sprite sheets, not stage maps)
  if (pt.estimated_grid) score += 2;
  if (pt.estimated_sprite_count > 1) score += 1;
  // Not stage maps
  if (!pt.is_stage_map) score += 2;
  // Has transparency (sprites usually do)
  if (pt.has_transparency) score += 1;
  // Category match
  const cat = entry.category || 'misc';
  if (spec.category && cat === spec.category) score += 3;
  if (spec.category === 'player' && cat === 'player') score += 5;
  if (spec.category === 'enemy' && cat === 'enemy') score += 5;
  return score;
}

// ─── Resolver class ───────────────────────────────────────────────────────────

class AssetResolver {
  constructor(track) {
    this.track    = track;  // 'a' or 'b'
    this.catalog  = null;
    this.bySlug   = new Map();   // game_slug → entry[]
    this.byPlatCat = new Map();  // "platform:category" → entry[]
    this.ready    = false;
  }

  async init() {
    if (this.track === 'b') { this.ready = true; return; }
    try {
      const res = await fetch(CATALOG_URL);
      if (!res.ok) { console.warn('[AssetResolver] catalog not found — Track A disabled'); this.ready = true; return; }
      this.catalog = await res.json();
      this._buildIndexes();
      this.ready = true;
      console.log(`[AssetResolver] Track A loaded: ${this.catalog.entries.length} entries`);
    } catch (e) {
      console.warn('[AssetResolver] catalog load failed:', e.message, '— Track A disabled');
      this.track = 'b'; // fall back gracefully
      this.ready = true;
    }
  }

  _buildIndexes() {
    for (const entry of this.catalog.entries) {
      // Index by game slug
      const slug = entry.game_slug || '';
      if (!this.bySlug.has(slug)) this.bySlug.set(slug, []);
      this.bySlug.get(slug).push(entry);

      // Index by platform:category
      const pk = `${entry.platform}:${entry.category}`;
      if (!this.byPlatCat.has(pk)) this.byPlatCat.set(pk, []);
      this.byPlatCat.get(pk).push(entry);
    }
  }

  // Resolve a semantic asset spec to { sheetUrl, region, animationFrames, entityName } or null.
  // spec: { style_reference, category, game, platform, style_era, dimensions }
  //   - game: game slug (e.g. "super-mario-world", "mega-man-2")
  //   - platform: explicit platform override (or derived from style_era)
  //   - style_reference: named entity (e.g. "goomba", "mario", "mega-man")
  //   - category: "player" | "enemy" | "item" | "misc"
  resolveAsset(spec) {
    if (this.track === 'b' || !this.ready || !this.catalog) return null;

    const platform = spec.platform || eraToPlatform(spec.style_era) || null;
    const gameSlug = spec.game || null;

    // ── Layer 1: Direct named_character match in the specified game ──────────
    if (gameSlug && spec.style_reference) {
      const entries = this.bySlug.get(gameSlug) || [];
      for (const entry of entries) {
        if (!entry.vision_tags?.entities?.length) continue;
        for (const entity of entry.vision_tags.entities) {
          if (entity.named_character &&
              normRef(entity.named_character) === normRef(spec.style_reference)) {
            return makeResult(entry, entity);
          }
        }
      }
    }

    // ── Layer 2: Semantic match within same game ─────────────────────────────
    if (gameSlug && spec.style_reference) {
      const entries = this.bySlug.get(gameSlug) || [];
      let best = null; let bestScore = -1;
      for (const entry of entries) {
        if (!entry.vision_tags?.entities?.length) continue;
        const entity = findBestEntity(entry, spec);
        if (!entity) continue;
        const score = entityNameScore(entity, spec.style_reference)
                    + entityTypeScore(entity, spec.category);
        if (score > bestScore) { best = { entry, entity }; bestScore = score; }
      }
      if (best) return makeResult(best.entry, best.entity);
    }

    // ── Layer 3: Platform + category fallback ────────────────────────────────
    if (platform) {
      const cat = spec.category || 'misc';
      const pk = `${platform}:${cat}`;
      const entries = this.byPlatCat.get(pk) || [];

      // Score candidates; prefer sheets WITH vision_tags
      let withVision = entries.filter(e => e.vision_tags?.entities?.length);
      let pool = withVision.length ? withVision : entries;

      let best = null; let bestScore = -1;
      for (const entry of pool) {
        const score = programmaticScore(entry, spec);
        if (score > bestScore) { best = entry; bestScore = score; }
      }
      if (best?.vision_tags?.entities?.length) {
        const entity = findBestEntity(best, spec) || best.vision_tags.entities[0];
        if (entity) return makeResult(best, entity);
      }
      // No vision_tags on best match → return null (renderer uses colored rect)
    }

    return null;
  }
}

// ─── Module-level singleton (initialized by game-loop) ────────────────────────

let _resolver = null;

export async function initResolver(track) {
  _resolver = new AssetResolver(track || 'a');
  await _resolver.init();
  return _resolver;
}

export function resolveAsset(spec) {
  if (!_resolver) return null;
  return _resolver.resolveAsset(spec);
}

export function getTrack() {
  return _resolver?.track ?? 'b';
}

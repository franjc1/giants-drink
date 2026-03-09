#!/usr/bin/env node
'use strict';
const fs = require('fs');

function normalizeCategory(rawCategory) {
  // Normalize: strip diacritics (é→e), lowercase, replace punctuation with space, collapse whitespace
  const lower = rawCategory.toLowerCase()
    .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9\s]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();

  // --- NPCs first — must come before player/playable checks ---
  if (/non.?playable|non.?player/.test(lower)) return 'npc';
  if (/\bnpc\b/.test(lower)) return 'npc';
  if (/friendly/.test(lower)) return 'npc';

  // --- Player / playable ---
  if (/playable/.test(lower)) return 'player';
  if (/\bplayers?\b/.test(lower)) return 'player';
  if (/^main characters?$/.test(lower)) return 'player';

  // --- Named boss types (before generic enemy check) ---
  if (/robot master/.test(lower)) return 'boss';
  if (/\bnetnavis?\b/.test(lower)) return 'boss';
  if (/\bmavericks?\b/.test(lower)) return 'boss';

  // --- Enemies (broad — "Enemies & Bosses" counts as enemy for asset retrieval) ---
  if (/\benemies?\b/.test(lower)) return 'enemy';
  if (/\bmonsters?\b/.test(lower)) return 'enemy';
  if (/\bviruses?\b/.test(lower)) return 'enemy';
  if (/\bcreatures?\b/.test(lower)) return 'enemy';
  if (/^mobs?$/.test(lower)) return 'enemy';

  // --- Bosses (remaining, after enemy check so "Enemies & Bosses" stays enemy) ---
  if (/\bboss(es)?\b/.test(lower)) return 'boss';

  // --- NPCs / friendly (additional patterns after boss/enemy checks) ---
  if (/^animals?$/.test(lower)) return 'npc';
  if (/\bhumans?\b/.test(lower)) return 'npc';

  // --- Generic characters (fighters, units, robots, etc.) ---
  if (/\bcharacters?\b/.test(lower)) return 'character';
  if (/kombatant|fighter|\bunits?\b|\brobots?\b|\bpilots?\b/.test(lower)) return 'character';
  if (/\bracers?\b|\bcars?\b|\bvehicles?\b/.test(lower)) return 'character';
  if (/\bpokemon\b|\bcaptains?\b|\bboxers?\b/.test(lower)) return 'character';

  // --- Tilesets ---
  if (/tileset/.test(lower)) return 'tileset';

  // --- Backgrounds ---
  if (/background|foreground/.test(lower)) return 'background';

  // --- Stage / map / level content (plurals included) ---
  if (/\bstages?\b|\blevels?\b|\bworlds?\b|\bmaps?\b|\bareas?\b|\bzones?\b/.test(lower)) return 'stage_map';
  if (/overworld|castle|fortress|dungeon|forest|cave|island|plains|dome|arena/.test(lower)) return 'stage_map';
  if (/^courses?$|^tracks?$|^locations?$|^missions?$/.test(lower)) return 'stage_map';

  // --- UI / HUD ---
  if (/\bhud\b|\bmenus?\b|\bui\b|\btitle\b|interface|\bfonts?\b/.test(lower)) return 'ui';

  // --- Items / weapons / power-ups ---
  if (/\bitems?\b|\bobjects?\b|\bweapons?\b|power.?up|collectible/.test(lower)) return 'item';

  // --- Visual effects ---
  if (/\beffects?\b/.test(lower)) return 'effect';

  // --- Cutscenes / endings ---
  if (/cutscene|ending|intro|cinema/.test(lower)) return 'cutscene';

  // --- Portraits ---
  if (/portrait|\bface\b|mugshot/.test(lower)) return 'portrait';

  return 'misc';
}

console.log('Loading catalog...');
const catalog = JSON.parse(fs.readFileSync('data/assets/asset-catalog.json'));
console.log('Entries:', catalog.entries.length);

let changed = 0;
for (const e of catalog.entries) {
  const newCat = normalizeCategory(e.category_raw);
  if (newCat !== e.category) changed++;
  e.category = newCat;
}
console.log('Changed:', changed);

// Distribution
const dist = {};
for (const e of catalog.entries) dist[e.category] = (dist[e.category] || 0) + 1;
console.log('\n=== Category Distribution ===');
Object.entries(dist).sort((a, b) => b[1] - a[1]).forEach(([k, v]) =>
  console.log(v.toString().padStart(7), k)
);

// Remaining misc breakdown (top 20)
console.log('\n=== Top 20 remaining misc raw categories ===');
const m = {};
catalog.entries.filter(e => e.category === 'misc').forEach(e => {
  m[e.category_raw] = (m[e.category_raw] || 0) + 1;
});
Object.entries(m).sort((a, b) => b[1] - a[1]).slice(0, 20).forEach(([k, v]) =>
  console.log(v.toString().padStart(7), k)
);

// Specific games
for (const slug of ['mega-man-2', 'super-mario-world', 'sonic-the-hedgehog']) {
  const entries = catalog.entries.filter(e => e.game_slug === slug);
  if (!entries.length) { console.log('\n' + slug + ': NOT FOUND'); continue; }
  const d = {};
  entries.forEach(e => { d[e.category] = (d[e.category] || 0) + 1; });
  console.log('\n=== ' + entries[0].game_name + ' (' + slug + ') — ' + entries.length + ' sheets ===');
  Object.entries(d).sort((a, b) => b[1] - a[1]).forEach(([k, v]) =>
    console.log('  ' + v.toString().padStart(4), k)
  );
  // Show sample sheet names per category
  const cats = Object.keys(d).sort((a, b) => d[b] - d[a]);
  for (const cat of cats) {
    const samples = entries.filter(e => e.category === cat).slice(0, 3)
      .map(e => e.sheet_name || e.category_raw).join(' | ');
    console.log('    ' + cat + ': ' + samples);
  }
}

catalog.generated_at = new Date().toISOString();
fs.writeFileSync('data/assets/asset-catalog.json', JSON.stringify(catalog, null, 2));
console.log('\nWrote updated catalog.');

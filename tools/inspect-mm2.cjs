#!/usr/bin/env node
'use strict';
const fs = require('fs');

// ── 1. asset-catalog.json ──────────────────────────────────────────────
console.log('=== asset-catalog.json — MM2 entries ===');
const cat = JSON.parse(fs.readFileSync('data/assets/asset-catalog.json'));
const mm2cat = cat.entries.filter(e => e.game_slug === 'mega-man-2');
console.log('Count:', mm2cat.length);
mm2cat.forEach(e => {
  const tagged = e.vision_tags ? 'TAGGED' : 'untagged';
  console.log(
    String(e.category).padEnd(12),
    String(e.category_raw).padEnd(30),
    String(e.sheet_name || '(none)').padEnd(35),
    tagged,
    '\n  ', e.file
  );
});

// ── 2. asset-index.json ───────────────────────────────────────────────
console.log('\n=== asset-index.json — MM2 entries ===');
let idx;
try {
  idx = JSON.parse(fs.readFileSync('data/assets/asset-index.json'));
} catch (e) {
  console.log('ERROR reading asset-index.json:', e.message);
  process.exit(0);
}

// asset-index might be keyed by file path or by game — probe structure first
const keys = Object.keys(idx);
console.log('Total keys in index:', keys.length);
console.log('Sample key:', keys[0]);
console.log('Sample value:', JSON.stringify(idx[keys[0]]).slice(0, 200));

const mm2idx = keys.filter(k =>
  k.toLowerCase().includes('mega-man-2') ||
  (idx[k] && idx[k].game_slug && idx[k].game_slug.toLowerCase().includes('mega-man-2'))
);
console.log('\nMM2 entries in index:', mm2idx.length);
mm2idx.slice(0, 10).forEach(k => {
  console.log(' ', k, '->', JSON.stringify(idx[k]).slice(0, 120));
});

// ── 3. Dimensions of MM2 PNGs ─────────────────────────────────────────
console.log('\n=== PNG dimensions ===');
function readPngDims(p) {
  try {
    const b = fs.readFileSync(p);
    if (b[0] !== 0x89 || b[1] !== 0x50) return null;
    return { w: b.readUInt32BE(16), h: b.readUInt32BE(20) };
  } catch { return null; }
}

mm2cat.forEach(e => {
  const d = readPngDims(e.file);
  const size = fs.existsSync(e.file) ? fs.statSync(e.file).size : 0;
  console.log(
    String(e.category).padEnd(12),
    d ? (String(d.w).padStart(4) + 'x' + String(d.h).padEnd(5)) : '  ???      ',
    (Math.round(size / 1024) + 'KB').padStart(6),
    e.sheet_name || e.category_raw
  );
});

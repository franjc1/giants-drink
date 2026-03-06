#!/usr/bin/env node
// Converts episode1.json sparse_tiles → base64 tilemap, updates the file in-place.
// Usage: node tools/build-tilemap-base64.js

const fs = require('fs');
const path = require('path');

const fixturePath = path.join(__dirname, '../data/test-fixtures/episode1.json');
const episode = JSON.parse(fs.readFileSync(fixturePath, 'utf8'));

const layer = episode.episode.spatial.layers[0];
const MAP_W = episode.episode.spatial.width;   // 210
const MAP_H = episode.episode.spatial.height;  // 15

const buf = Buffer.alloc(MAP_W * MAP_H, 0);

for (const entry of layer.sparse_tiles) {
  if (entry._comment !== undefined) continue;
  if (entry.range === 'row') {
    for (let c = entry.col_start; c <= entry.col_end; c++) {
      buf[entry.row * MAP_W + c] = entry.tile;
    }
  } else if (entry.col !== undefined) {
    buf[entry.row * MAP_W + entry.col] = entry.tile;
  }
}

const b64 = buf.toString('base64');

// Replace the layer data
delete layer.sparse_tiles;
delete layer.data_comment;
layer.data_format = 'base64_uint8';
layer.data = b64;

fs.writeFileSync(fixturePath, JSON.stringify(episode, null, 2));
console.log(`Done. Tilemap ${MAP_W}×${MAP_H} = ${buf.length} bytes → ${b64.length} chars base64`);
console.log(`Written to ${fixturePath}`);

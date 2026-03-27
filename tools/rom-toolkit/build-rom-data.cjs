/**
 * Reads the SMB ROM and generates rom-data.js with the base64-encoded ROM.
 * Run: node tools/rom-toolkit/build-rom-data.cjs
 */
const fs = require('fs');
const path = require('path');

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const OUT_PATH = path.join(__dirname, 'rom-data.js');

const romBuf = fs.readFileSync(ROM_PATH);
const b64 = romBuf.toString('base64');

fs.writeFileSync(OUT_PATH, `// Auto-generated — do not commit\nwindow.ROM_BASE64 = "${b64}";\n`);
console.log(`Wrote ${OUT_PATH} (${(b64.length / 1024).toFixed(1)} KB base64 from ${romBuf.length} byte ROM)`);

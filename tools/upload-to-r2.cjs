const { execSync } = require('child_process');
const { readdirSync, statSync } = require('fs');
const { join } = require('path');

const BUCKET = 'two-fires-assets';
const LOCAL_BASE = process.argv[2];
const R2_PREFIX = process.argv[3] || '';
const PLATFORM_FILTER = process.argv[4] || null;

let count = 0;
let errors = 0;

function walk(dir, prefix) {
  for (const entry of readdirSync(dir)) {
    const full = join(dir, entry);
    const key = prefix ? prefix + '/' + entry : entry;
    if (statSync(full).isDirectory()) {
      walk(full, key);
    } else if (entry.endsWith('.png')) {
      count++;
      try {
        execSync('wrangler r2 object put "' + BUCKET + '/' + key + '" --file "' + full + '" --remote', { stdio: 'pipe' });
        if (count % 50 === 0) console.log('Uploaded ' + count + ' files (' + errors + ' errors)');
      } catch (err) {
        errors++;
        if (errors <= 10) console.log('Error: ' + key);
      }
    }
  }
}

if (PLATFORM_FILTER) {
  const platformDir = join(LOCAL_BASE, PLATFORM_FILTER);
  console.log('Uploading ' + PLATFORM_FILTER + ' sprites to R2...');
  walk(platformDir, R2_PREFIX + '/' + PLATFORM_FILTER);
} else {
  console.log('Uploading all sprites to R2...');
  walk(LOCAL_BASE, R2_PREFIX);
}
console.log('Done. ' + count + ' files, ' + errors + ' errors.');

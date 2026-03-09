const { exec } = require('child_process');
const { readdirSync, statSync } = require('fs');
const { join } = require('path');

const BUCKET = 'two-fires-assets';
const LOCAL_BASE = process.argv[2];
const R2_PREFIX = process.argv[3] || '';
const MAX_PARALLEL = parseInt(process.argv[4]) || 15;

let queued = [];
let inFlight = 0;
let done = 0;
let errors = 0;
const startTime = Date.now();

function walk(dir, prefix) {
  for (const entry of readdirSync(dir)) {
    const full = join(dir, entry);
    const key = prefix ? prefix + '/' + entry : entry;
    if (statSync(full).isDirectory()) {
      walk(full, key);
    } else {
      queued.push({ full, key });
    }
  }
}

function uploadNext() {
  while (inFlight < MAX_PARALLEL && queued.length > 0) {
    const item = queued.shift();
    inFlight++;
    exec('wrangler r2 object put "' + BUCKET + '/' + item.key + '" --file "' + item.full + '" --remote', { timeout: 30000 }, (err) => {
      inFlight--;
      if (err) {
        errors++;
      }
      done++;
      if (done % 200 === 0) {
        const elapsed = (Date.now() - startTime) / 1000;
        const rate = (done / elapsed).toFixed(1);
        const remaining = queued.length;
        const eta = remaining > 0 ? (remaining / parseFloat(rate) / 60).toFixed(0) : 0;
        console.log('Uploaded ' + done + '/' + (done + remaining) + ' (' + rate + '/s, ~' + eta + 'min left, ' + errors + ' errors)');
      }
      uploadNext();
      if (inFlight === 0 && queued.length === 0) {
        console.log('DONE. ' + done + ' files, ' + errors + ' errors, ' + ((Date.now() - startTime) / 1000).toFixed(0) + 's');
      }
    });
  }
}

console.log('Scanning ' + LOCAL_BASE + '...');
walk(LOCAL_BASE, R2_PREFIX);
console.log('Found ' + queued.length + ' files. Uploading with ' + MAX_PARALLEL + ' parallel workers...');
uploadNext();

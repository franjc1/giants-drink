const fs = require('fs');
const path = require('path');

const ACCOUNT_ID = 'ecf4e311bd274041bb08e03235ca660e';
const BUCKET = 'two-fires-assets';
const API_TOKEN = '16pYo6qj816YJD5dXd5vf97ZHw6nt7SgymIlFW9m';
const MAX_CONCURRENT = parseInt(process.argv[4]) || 30;
const LOCAL_BASE = process.argv[2];
const R2_PREFIX = process.argv[3] || '';

const BASE_URL = `https://api.cloudflare.com/client/v4/accounts/${ACCOUNT_ID}/r2/buckets/${BUCKET}/objects`;

let queue = [];
let inFlight = 0;
let done = 0;
let errors = 0;
let totalBytes = 0;
const startTime = Date.now();

function walk(dir, prefix) {
  for (const entry of fs.readdirSync(dir)) {
    const full = path.join(dir, entry);
    if (fs.statSync(full).isDirectory()) {
      walk(full, prefix ? prefix + '/' + entry : entry);
    } else {
      queue.push({ full, key: prefix ? prefix + '/' + entry : entry });
    }
  }
}

async function upload(item) {
  const body = fs.readFileSync(item.full);
  totalBytes += body.length;
  try {
    const resp = await fetch(`${BASE_URL}/${encodeURIComponent(item.key)}`, {
      method: 'PUT',
      headers: {
        'Authorization': `Bearer ${API_TOKEN}`,
        'Content-Type': 'application/octet-stream',
      },
      body,
    });
    if (resp.ok || resp.status === 200) {
      return true;
    }
    const text = await resp.text();
    if (errors < 5) console.log('HTTP ' + resp.status + ': ' + item.key + ' - ' + text.slice(0, 100));
    return false;
  } catch (err) {
    if (errors < 5) console.log('Error: ' + item.key + ' - ' + err.message);
    return false;
  }
}

async function run() {
  console.log('Scanning ' + LOCAL_BASE + '...');
  walk(LOCAL_BASE, R2_PREFIX);
  console.log('Found ' + queue.length + ' files. Uploading with ' + MAX_CONCURRENT + ' concurrent...');

  let idx = 0;

  function report() {
    const elapsed = (Date.now() - startTime) / 1000;
    const rate = (done / elapsed).toFixed(1);
    const mbDone = (totalBytes / 1024 / 1024).toFixed(0);
    const remaining = queue.length - idx + inFlight;
    const eta = remaining > 0 && parseFloat(rate) > 0 ? (remaining / parseFloat(rate) / 60).toFixed(0) : '?';
    console.log('Done ' + done + '/' + queue.length + ' (' + rate + '/s, ' + mbDone + 'MB, ~' + eta + 'min left, ' + errors + ' errors)');
  }

  await new Promise((resolve) => {
    function launchNext() {
      while (inFlight < MAX_CONCURRENT && idx < queue.length) {
        const item = queue[idx++];
        inFlight++;
        upload(item).then((ok) => {
          inFlight--;
          done++;
          if (ok === false) errors++;
          if (done % 200 === 0) report();
          if (inFlight === 0 && idx >= queue.length) {
            report();
            resolve();
          } else {
            launchNext();
          }
        });
      }
    }
    launchNext();
  });

  console.log('COMPLETE. ' + done + ' files, ' + errors + ' errors, ' + ((Date.now() - startTime) / 1000).toFixed(0) + 's');
}

run();

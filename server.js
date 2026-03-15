import http from "http";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const PORT = 3001;

const MIME = {
  ".html": "text/html",
  ".js":   "application/javascript",
  ".css":  "text/css",
  ".png":  "image/png",
  ".json": "application/json",
  ".chr":  "application/octet-stream",
  ".txt":  "text/plain",
  ".nes":  "application/octet-stream",
};

// Route prefixes → filesystem directories
const ROUTES = [
  { prefix: "/experiment-output/", dir: path.join(__dirname, "experiment-output") },
  { prefix: "/",                   dir: path.join(__dirname, "public") },
];

const server = http.createServer((req, res) => {
  const url = new URL(req.url, `http://localhost:${PORT}`);
  const urlPath = decodeURIComponent(url.pathname);

  for (const { prefix, dir } of ROUTES) {
    if (!urlPath.startsWith(prefix)) continue;
    const rel = urlPath.slice(prefix.length) || "index.html";
    const filePath = path.join(dir, rel);

    // Security: don't escape the root dir
    if (!filePath.startsWith(dir)) continue;

    if (fs.existsSync(filePath) && fs.statSync(filePath).isFile()) {
      const ext = path.extname(filePath).toLowerCase();
      const mime = MIME[ext] || "application/octet-stream";
      res.writeHead(200, {
        "Content-Type": mime,
        "Access-Control-Allow-Origin": "*",
        "Cache-Control": "no-cache",
      });
      fs.createReadStream(filePath).pipe(res);
      console.log(`  ${req.method} ${urlPath} → ${path.relative(__dirname, filePath)}`);
      return;
    }
  }

  res.writeHead(404, { "Content-Type": "text/plain" });
  res.end(`Not found: ${urlPath}`);
  console.log(`  404 ${urlPath}`);
});

server.listen(PORT, () => {
  console.log(`Static server running at http://localhost:${PORT}`);
  console.log(`  Serving public/ at /`);
  console.log(`  Serving experiment-output/ at /experiment-output/`);
  console.log(`  Open: http://localhost:${PORT}/flux-sprite-test.html`);
});

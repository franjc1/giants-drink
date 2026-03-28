#!/bin/bash
# Play the SMB Sprite Replace Demo — one command does everything
cd "$(dirname "$0")"
[ ! -f rom-data.js ] && node build-rom-data.cjs
echo "Opening http://localhost:8080/play-demo.html"
open "http://localhost:8080/play-demo.html" 2>/dev/null || echo "Open http://localhost:8080/play-demo.html in your browser"
python3 -m http.server 8080

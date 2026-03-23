#!/bin/bash
# Run this once the PixelLab ZIP is ready.
# It downloads the ZIP and extracts animation frames into sprites/

TOKEN="c38ccce7-ac16-4f79-b759-3e48778b4954"
AID="edfa579e-37ce-46f1-90d2-42f6617a3896"
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Attempting ZIP download..."
curl -L --fail -s \
  -H "Authorization: Bearer $TOKEN" \
  -o "$DIR/fighter.zip" \
  "https://api.pixellab.ai/mcp/characters/$AID/download"

if [ $? -ne 0 ]; then
  echo "❌ Download failed (HTTP 423 = still processing). Try again later."
  rm -f "$DIR/fighter.zip"
  exit 1
fi

SIZE=$(du -k "$DIR/fighter.zip" | cut -f1)
if [ "$SIZE" -lt 5 ]; then
  echo "❌ ZIP too small (${SIZE}K) — probably an error response."
  exit 1
fi

echo "✓ ZIP downloaded (${SIZE}K). Extracting..."
mkdir -p "$DIR/sprites"
unzip -o "$DIR/fighter.zip" -d "$DIR/sprites_raw" > /dev/null

# Flatten animation frames to sprites/{template}/{dir}/frame_NNN.png
find "$DIR/sprites_raw/animations" -name "frame_*.png" | while read f; do
  # path: .../animations/{template}/{dir}/frame_NNN.png
  template=$(echo "$f" | sed 's|.*/animations/||' | cut -d'/' -f1)
  direction=$(echo "$f" | sed 's|.*/animations/||' | cut -d'/' -f2)
  fname=$(basename "$f")
  mkdir -p "$DIR/sprites/$template/$direction"
  cp "$f" "$DIR/sprites/$template/$direction/$fname"
done

echo "✓ Extracted. Animation directories:"
find "$DIR/sprites" -mindepth 2 -maxdepth 2 -type d | sort

echo ""
echo "Open index.html in browser to view results."

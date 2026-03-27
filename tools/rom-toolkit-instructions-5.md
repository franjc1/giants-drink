# Claude Code Instructions: Playable Sprite Replacement Demo

## YOUR MISSION

Build a playable browser demo of the sprite suppress-and-replace
system. The player opens an HTML page, plays Super Mario Bros with
keyboard controls, and sees the custom knight character instead of
Mario. The game plays exactly like normal SMB — same physics, same
enemies, same levels — but Mario's sprite is completely replaced.

This must run locally in a browser. No server required beyond a
simple file serve.

## WHAT YOU ALREADY HAVE

From previous sessions in tools/rom-toolkit/:
- smb-api.cjs — SMB transformation toolkit
- sprite-replace-test.cjs — the suppress-and-replace system (Node.js)
- png-to-nes-tiles.cjs — PNG to NES tile converter
- The knight character tile data and palette

The challenge: the existing code runs in Node.js with jsnes in headless
mode. You need to adapt it for the browser where jsnes renders to a
canvas and accepts keyboard input.

## BUILD THIS

### tools/rom-toolkit/play-demo.html

A single HTML file (or HTML + JS, your call on structure) that:

1. Loads jsnes in the browser
   - jsnes has a browser build. Check if there's a pre-built bundle
     in node_modules/jsnes/. If not, you may need to use a bundler
     (esbuild is fast: npm install esbuild) to bundle jsnes for browser use.
   - Alternative: jsnes might work with a simple script tag if you
     build it. Check the jsnes README/package.json for browser usage.

2. Loads the SMB ROM
   - Embed it as a base64 string in the JS, OR
   - Load it via file input (let user select the .nes file), OR
   - Fetch it from a local path
   - The file input approach is cleanest — no ROM embedded in code.
   - If using file input, show a simple "Select ROM" button on load.

3. Runs the game with keyboard controls:
   - Arrow keys = D-pad
   - Z or X = A button (jump)
   - A or S = B button (run/fire) 
   - Enter = Start
   - Shift = Select
   - Map these to jsnes controller buttons

4. Renders to a canvas element, scaled up (at least 2x or 3x the
   native 256x240 so it's visible)

5. Runs the suppress-and-replace system every frame:
   - Write knight tile data into CHR memory
   - Read Mario's position and state from RAM
   - Suppress Mario's OAM entries
   - Inject knight OAM entries at Mario's position
   - All the logic from sprite-replace-test.cjs, adapted for browser

6. Includes a toggle button or key (press T) to switch between
   original Mario and the knight character. This lets the player
   see the replacement is real-time — press T and Mario appears,
   press T again and the knight returns.

### Audio (nice to have, not critical)

jsnes can output audio via the onAudioSample callback. If it's easy
to hook up to a Web Audio API context, do it. If it's complex, skip
it — visual proof is what matters.

## TECHNICAL NOTES

### jsnes in the browser

jsnes was originally built for the browser. Check:
```
ls node_modules/jsnes/
cat node_modules/jsnes/package.json
```

Look for a "browser" or "main" field. There might be a pre-built
dist file. If the package exposes ES modules or CommonJS, you may
need esbuild to bundle:

```
npx esbuild tools/rom-toolkit/play-demo.js --bundle --outfile=tools/rom-toolkit/play-bundle.js --platform=browser
```

### The frame loop

In the browser, use requestAnimationFrame for the game loop.
jsnes's nes.frame() advances one frame. Call it once per
requestAnimationFrame callback for 60fps gameplay.

```javascript
function gameLoop() {
  // Run one NES frame
  nes.frame();
  
  // Suppress and replace sprites
  doSpriteReplace(nes);
  
  // The onFrame callback already drew to canvas
  requestAnimationFrame(gameLoop);
}
```

Wait — the onFrame callback fires DURING nes.frame(). That means
sprite replacement needs to happen BEFORE nes.frame() is called,
or the rendered frame won't include our changes.

Actually, think about the timing carefully:
1. nes.frame() runs one full frame (CPU + PPU)
2. During that frame, PPU renders and calls onFrame with the pixel buffer
3. onFrame draws to canvas

So our sprite modifications need to be in place BEFORE nes.frame().
But the game's logic also runs during nes.frame() and overwrites OAM.

The solution from the Node.js test was to modify spriteMem AFTER
nes.frame() and it persisted to the NEXT frame's render. Verify
this works in the browser version. The sequence should be:

```javascript
function gameLoop() {
  nes.frame();                // game runs, PPU renders with our PREVIOUS frame's OAM mods
  doSpriteReplace(nes);       // modify OAM for NEXT frame
  requestAnimationFrame(gameLoop);
}
```

This means there's a 1-frame delay on the first frame only. That's
fine — imperceptible.

### OAM modification

From the previous test, the key operations:
- Read Mario position: nes.cpu.mem[0x0086] (X), nes.cpu.mem[0x00CE] (Y)
- Read Mario state: check what address the previous test used
- Suppress: set spriteMem[n*4 + 0] = 0xFF for Mario's sprites
- Inject: write our tile indices, positions, attributes to free OAM slots

Adapt the exact logic from sprite-replace-test.cjs.

### CHR tile injection

From the previous test, the method was writing to ptTile[].pix.
Verify this works in the browser jsnes build. The CHR tiles only
need to be written once at startup (or once when they're loaded),
not every frame.

## FILE STRUCTURE

```
tools/rom-toolkit/
  play-demo.html          ← the playable page
  play-demo.js            ← game logic (if separate from HTML)
  play-bundle.js          ← esbuild output (if bundling needed)
  knight-tiles.json       ← knight character data (from Part 2 output)
```

## TESTING

1. After building, start a simple local server:
   ```
   cd ~/giants-drink/tools/rom-toolkit
   python3 -m http.server 8080
   ```

2. Open http://localhost:8080/play-demo.html in a browser

3. Load the ROM (if using file input)

4. Play the game. Verify:
   - Knight character appears instead of Mario
   - Movement is responsive (no input lag)
   - Character position tracks correctly during all actions
   - Press T to toggle shows original Mario / knight swap
   - Game is fully playable (can complete World 1-1)

## STOP CONDITION

When you have a working playable demo that:
- Renders in the browser at playable framerate
- Accepts keyboard input for game controls
- Shows the knight character instead of Mario
- Includes toggle to show the replacement is working
- Can be played through at least World 1-1

STOP. Commit everything. Print:
- The URL to open (localhost path)
- The keyboard controls
- Any known issues
- The exact terminal commands to start the server

Do NOT try to deploy this anywhere. Local only.

## CRITICAL RULES

- This must be PLAYABLE. Not a recording, not frame captures. Real-time
  interactive gameplay.
- If jsnes browser setup is complex, spend the time to get it right.
  This is the most important deliverable.
- Test in the browser yourself if possible (check if tools allow it).
  If not, be very careful about the frame timing and OAM modification
  sequence.
- The ROM must NOT be embedded/committed to the repo. Use file input
  so the user loads their own ROM.
- jsnes loads ROMs as binary strings in Node.js. In the browser it
  may need an ArrayBuffer or different format. Check the jsnes browser
  API.
- Keep the HTML simple and clean. No framework needed. Vanilla JS.

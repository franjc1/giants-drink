# Claude Code Instructions: Sprite Replacement — Do It Right This Time

## THE PROBLEM

Previous attempts at sprite replacement reported success in headless
mode but failed when actually played in a browser. The "knight" 
character was a garbled mess of misaligned tiles. This happened because
validation was structural ("did bytes get written?") rather than visual
("does it look like a character?").

You need to figure this out YOURSELF. No human in the loop. You must
build, test, diagnose, fix, and re-test until the result is genuinely
correct. You are both the engineer AND the QA tester.

## YOUR VISUAL VALIDATION METHOD

You don't have eyes, but you CAN analyze pixel data. After every test,
you must:

1. Capture the frame buffer as a PNG
2. Extract the rectangular region where the replacement character
   should be (based on Mario's known RAM position)
3. Analyze that pixel region:
   - Is there a coherent character shape? (connected non-background
     pixels forming a humanoid or recognizable figure)
   - Are the colors correct? (should be the knight's palette, NOT
     Mario's palette)
   - Is the character the right size? (16x16 for small, 16x32 for big)
   - Are there stray pixels, gaps, or misaligned tile boundaries?
   - Is the original Mario COMPLETELY gone? (no Mario-colored pixels
     in the character region)
4. Also check the surrounding area:
   - Are other sprites (enemies, items) still rendering correctly?
   - Is the background intact? (no corruption from your modifications)
5. Compare a "replacement ON" frame to a "replacement OFF" frame
   from the same game state (use savestates). The ONLY difference
   should be the character sprite region.

Write a validation function that does all of this automatically and
reports PASS/FAIL with specific failure reasons. If it fails, diagnose
WHY and fix it before moving on.

## THE APPROACH: BUILD INCREMENTALLY WITH VALIDATION AT EACH STEP

Do NOT try to build the full replacement system and then test. Build
ONE piece at a time, validate it works, then add the next piece.

### STEP 1: Baseline capture
- Boot SMB to gameplay, run 120 frames
- Capture a PNG frame showing normal Mario
- Analyze: locate Mario's pixels in the frame (based on RAM position)
- Record exactly which pixels belong to Mario (the "Mario mask")
- This is your reference for "what to suppress"

### STEP 2: Suppress Mario's rendering
- From the same savestate, suppress ALL OAM entries near Mario's
  position (set Y to $FF for any sprite within 16px of Mario's
  RAM position)
- Run 1 frame, capture PNG
- Validate: the Mario mask region should now show ONLY background
  pixels (sky blue or whatever is behind Mario). If Mario's pixels
  are still there, your suppression isn't working. Debug and fix.
- DO NOT PROCEED until Mario is completely invisible.

### STEP 3: Inject ONE tile
- From the same savestate, suppress Mario AND place a single 8x8
  tile at Mario's position
- Use a SOLID COLOR tile (all pixels = palette color 1) so it's
  unmistakable — a bright red 8x8 square
- Write the tile data into a CHR slot (find a safe unused slot)
- Write one OAM entry: your tile index, Mario's X, Mario's Y, 
  palette 0
- Run 1 frame, capture PNG
- Validate: there should be an 8x8 solid colored square exactly
  at Mario's position. Check the actual pixel colors in that 8x8
  region. Every pixel should be the same color. If not, your tile
  data or OAM write is wrong. Debug and fix.
- DO NOT PROCEED until the solid square renders correctly.

### STEP 4: Inject 4 tiles in correct arrangement (2x2 = small Mario size)
- Same approach but now place 4 tiles in a 2x2 grid:
  - Top-left:     (X,   Y)    — solid red
  - Top-right:    (X+8, Y)    — solid green  
  - Bottom-left:  (X,   Y+8)  — solid blue
  - Bottom-right: (X+8, Y+8)  — solid white
- Each tile a different solid color so you can verify positioning
- Run 1 frame, capture PNG
- Validate: you should see a 16x16 square divided into 4 colored
  quadrants. Check pixel data in each quadrant. Top-left all red,
  top-right all green, etc. If any quadrant is wrong position or
  wrong color, your OAM offsets or tile indices are wrong.
- DO NOT PROCEED until the 4-quadrant test is pixel-perfect.

### STEP 5: Inject the actual knight tiles
- NOW replace the solid color tiles with the actual knight pixel
  data (from the previous session's knight design, or design a new
  simple character)
- Same 2x2 arrangement, same positions
- Run 1 frame, capture PNG
- Validate: the 16x16 region should show a recognizable character.
  Check that non-transparent pixels form a connected shape. Check
  that the colors match the intended palette. Check that it's not
  just noise or random pixels.
- If it looks wrong, compare the raw tile pixel data you wrote
  against what you read back from CHR memory. Are they the same?
  If not, your CHR write method is broken.

### STEP 6: Multi-frame movement test
- From a savestate, run 300 frames with Right held
- Suppress and replace EVERY frame
- Capture PNGs every 30 frames
- Validate EACH captured frame:
  - Knight is present at Mario's position
  - Mario's original tiles are absent
  - No corruption elsewhere
  - Knight position changes as Mario moves right
- If any frame fails, identify which frame and why

### STEP 7: Build the browser version
- ONLY after Steps 1-6 all pass in headless Node.js
- Port to browser with jsnes canvas rendering
- The key difference: figure out the EXACT timing of when to modify
  OAM relative to jsnes's frame() call and onFrame callback
- Test in headless first by simulating the browser's frame sequence:
  1. Modify OAM/CHR
  2. Call nes.frame() (which triggers onFrame with rendered pixels)
  3. Capture the onFrame output
  4. Validate: does the captured frame show the knight?
- If the knight doesn't appear in the onFrame output, the timing is
  wrong. Try: modify AFTER frame(), check if NEXT frame shows it.
- Document the exact working timing sequence.

### STEP 8: Browser integration
- Build play-demo.html with the PROVEN timing sequence
- Include a self-test mode: on page load, before showing the game,
  run Steps 2-5 internally and check results. If any step fails,
  display an error message instead of a broken game.
- The ROM should auto-load (embed as base64 via build script, see
  previous session's rom-data.js approach)
- Include keyboard controls and the T toggle

## CRITICAL RULES

- VALIDATE EVERY STEP by analyzing actual pixel data. Not "did bytes
  write successfully" — "do the pixels in the frame look correct."
- DO NOT skip steps. Do not proceed to step N+1 until step N passes.
- If a step fails, diagnose the root cause from pixel analysis before
  attempting a fix. Don't just randomly change things.
- The validation function should be reusable — call it after every
  modification to confirm nothing broke.
- Capture and save ALL validation PNGs to tools/rom-toolkit/validation/
  so we can review them if needed.
- When you find the correct OAM modification timing for the browser,
  document it explicitly in a comment. This is the #1 thing that
  broke in previous attempts.
- Commit after each step passes: git add -A && git commit -m "Step N: [description] — VALIDATED"
- The final deliverable is a PLAYABLE browser demo where the knight
  character is clearly visible and the game is interactive.

## ENVIRONMENT

Same jsnes setup as previous sessions. All previous tools in
tools/rom-toolkit/ are available. Reuse whatever is helpful.

ROM location: ~/nes-roms/Super Mario Bros. (World).nes
Output: ~/giants-drink/tools/rom-toolkit/
Validation frames: ~/giants-drink/tools/rom-toolkit/validation/

npm packages available: jsnes, pngjs (install if needed)
For browser bundling: npx esbuild (install if needed)

## STOP CONDITION

When you have a PLAYABLE browser demo where:
- The knight is visually recognizable (not garbled)
- Mario's original sprite is completely suppressed
- Movement, jumping, and running all show the knight correctly
- The T key toggles between knight and Mario
- The game is fully interactive with keyboard controls

AND you have validation PNGs proving each step passed.

STOP. Commit. Report what worked and what was hardest to get right.

## WHAT TO DO FIRST

1. mkdir -p ~/giants-drink/tools/rom-toolkit/validation
2. Build the pixel-analysis validation function
3. Start Step 1 (baseline capture)
4. Work through each step sequentially, never skipping ahead

# Claude Code Instructions: Sprite Suppress-and-Replace Experiment

## YOUR MISSION

You are testing whether you can COMPLETELY replace a game character's
visual appearance by suppressing the game's own rendering and drawing
your own sprite instead. This sidesteps the composition-to-decomposition
tile mapping problem entirely.

THREE-PART experiment:

PART 1: Prove suppress-and-replace rendering works on SMB
PART 2: Build a PNG-to-NES-tile converter
PART 3: Feed a real sprite image through the full pipeline

## CONTEXT

Previous experiments proved:
- CHR tile data can be written via jsnes internals (ptTile[].pix)
- OAM sprite injection works (PPU retains injected data for the frame)
- Entity positions can be read from RAM every frame
- Per-frame suppression/override is stable

The approach:
1. Game runs normally — Mario's position updates in RAM
2. Before rendering, suppress Mario's OAM entries (set Y to $FF)
3. Write our custom tile data into commandeered CHR slots
4. Write our own OAM entries pointing to our tiles at Mario's position
5. PPU renders our character instead of Mario

The game's internal tile mapping for Mario is irrelevant. We never use
it. We render our own character using our own tiles in our own slots.

## PART 1: SUPPRESS AND REPLACE WITH TEST TILES

### Step 1: Understand Mario's OAM presence

Boot SMB to gameplay. For 60 frames, log ALL OAM entries that are
near Mario's known position (read from RAM $0086 for X, $00CE for Y).
"Near" = within 16 pixels in both axes.

Determine:
- How many OAM slots does Mario occupy? (Small Mario = ~4, Big = ~8)
- Do the slot numbers change frame to frame? (multiplexing)
- What tile indices does the game use for Mario?
- What's the spatial arrangement (offsets from Mario's position)?

Save this analysis — it validates that you know what to suppress.

### Step 2: Create test character tiles

Design a simple but VISUALLY DISTINCTIVE test character. Not Mario.
Something obviously different — a robot, an alien, a knight, whatever.
Make it recognizable so we can see at a glance that the replacement
worked.

For Small Mario (16x16 = 2x2 tiles):
- Design 4 tiles (8x8 each, 2 bits per pixel = 4 colors)
- Write them as raw pixel arrays

For Big Mario (16x32 = 2x4 tiles):
- Design 8 tiles
- Write them as raw pixel arrays

Each tile is 8x8 pixels. Each pixel is a 2-bit value (0-3) indexing
into the sprite palette. Value 0 is transparent.

### Step 3: Implement the suppress-and-replace loop

Write tools/rom-toolkit/sprite-replace-test.cjs that:

1. Boots SMB to gameplay
2. Writes test character tile data into CHR slots 240-247
   (or whatever range is safe — verify these aren't used on screen)
3. Every frame, AFTER the game's logic runs but BEFORE rendering:
   a. Read Mario's position from RAM ($0086, $00CE)
   b. Read Mario's current size state from RAM ($0754 or wherever
      the big/small flag is — verify this)
   c. Scan OAM for sprites near Mario's position
   d. Set those sprites' Y to $FF (suppress them)
   e. Write new OAM entries using our tile indices at Mario's position
      with correct spatial offsets for a 2x2 or 2x4 character

4. Run for 600 frames with input sequence:
   - 60 frames: stand still (verify static replacement)
   - 120 frames: walk right (verify replacement during movement)
   - 60 frames: jump (verify replacement during jump arc)
   - 120 frames: run right holding B (verify at run speed)
   - 60 frames: stand still again (verify return to idle)
   - 60 frames: walk left (verify horizontal flip)
   - 120 frames: jump while moving (verify complex motion)

5. Capture frame buffer as PNG every 30 frames throughout the test.
   Install pngjs if needed: npm install pngjs
   Save frames to tools/rom-toolkit/frames/replace-test-NNNN.png
   
   The frame buffer from jsnes onFrame callback is an array of 
   256*240*4 values (RGBA). Convert to PNG.

6. At the end, verify:
   - Mario's original tiles NEVER appeared (no frame shows original Mario)
   - Our replacement character appeared in every frame at the correct position
   - The game didn't crash
   - The character's position correctly tracks Mario's RAM position
   - Walking left shows the character flipped horizontally
     (set OAM attribute bit 6 for horizontal flip)

### Step 4: Handle edge cases

Test and handle:
- Power-up transition (small → big): does the replacement adapt?
- Star power (flashing): do we need to replicate the palette cycling?
- Pipe entry/exit: does the character still look correct?
- Death: do we suppress replacement during death animation?
- Screen transitions: does it survive level-start/flag-pole sequences?

For each edge case, either handle it correctly or document what 
happens and note it as a known limitation.

### Validation

The PNG frames are the primary validation. We should be able to look
at them and see:
- A character that is clearly NOT Mario
- Positioned exactly where Mario should be
- Tracking movement correctly
- No visual glitches, no leftover Mario tiles, no corruption

Report PASS/FAIL per test scenario.

## PART 2: PNG-TO-NES TILE CONVERTER

Build tools/rom-toolkit/png-to-nes-tiles.cjs that:

### Input
A PNG image of a character sprite. Expected format:
- Dimensions: width must be multiple of 8, height must be multiple of 8
- Small character: 16x16 (2x2 tiles)
- Big character: 16x32 (2x4 tiles)
- Sprite sheet: 16xN with multiple frames side by side or stacked
- Colors: up to 4 colors (including transparent background)
- Transparent pixels should be alpha=0 or a designated background color

### Processing
1. Read the PNG with pngjs
2. Identify the color palette:
   - Find all unique colors (ignoring alpha=0 as transparent)
   - If more than 3 non-transparent colors, quantize to 3
     (plus transparent = 4 total, which is the NES sprite limit)
   - Map colors to NES palette entries (find closest matches in the
     NES master palette of 54 colors)
3. Slice into 8x8 tiles, left-to-right, top-to-bottom
4. For each tile, convert to 2bpp format:
   - Each pixel becomes a 2-bit value (0=transparent, 1-3=colors)
5. Output: array of tile data ready for CHR injection, plus the
   NES palette entries to use

### Output
A JSON file with:
```json
{
  "tiles": [
    { "index": 0, "pixels": [0,0,1,1,1,1,0,0, ...] },  // 64 values per tile
    ...
  ],
  "palette": [0x0F, 0x16, 0x30, 0x27],  // NES color indices
  "layout": {
    "width": 2,   // tiles wide
    "height": 4,  // tiles tall
    "frames": 1   // number of animation frames
  }
}
```

### Test the converter

Create a test PNG image programmatically (draw a simple character
using pngjs — a 16x32 robot or knight with 3-4 colors). Run it
through the converter. Verify the output makes sense.

Then feed the converter output back into the Part 1 suppress-and-
replace system. Does the converted character display correctly in-game?

## PART 3: FULL PIPELINE TEST

Combine Parts 1 and 2:

1. Use the test PNG from Part 2 (or create a more interesting one)
2. Run it through the converter
3. Load the converter output into the suppress-and-replace system
4. Run SMB with the fully replaced character
5. Capture frames and verify

Write tools/rom-toolkit/full-pipeline-test.cjs that does all of this
end-to-end: takes a PNG path as input, converts it, injects it, runs
the game, captures verification frames.

This is the proof that the pipeline works from "image file" to
"character in running game."

## ENVIRONMENT

```javascript
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const nes = new NES({
  onFrame: function(frameBuffer) {
    // frameBuffer is array of length 256*240*4 (RGBA)
    // Use this to capture screenshots
  },
  onAudioSample: function(l, r) {}
});

const romData = fs.readFileSync(romPath);
nes.loadROM(romData.toString('binary'));

// Frame stepping
nes.frame();

// RAM access
nes.cpu.mem[addr]
nes.cpu.mem[addr] = value

// OAM (sprite memory)
nes.ppu.spriteMem[n*4 + 0]  // Y position  (set to $FF to hide)
nes.ppu.spriteMem[n*4 + 1]  // Tile index
nes.ppu.spriteMem[n*4 + 2]  // Attributes (bit 6 = H flip, bit 5 = V flip, bits 0-1 = palette)
nes.ppu.spriteMem[n*4 + 3]  // X position

// CHR tile access (from SMB toolkit findings)
// nes.ppu.ptTile[tileIndex].pix = array of 64 values (8x8 pixels)
// Verify this still works. If not, find the equivalent in jsnes internals.

// Savestates
const state = nes.toJSON();
nes.fromJSON(state);

// Controller
nes.buttonDown(1, Controller.BUTTON_RIGHT);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
```

ROM location: ~/nes-roms/ (use grep to find SMB)
Output directory: ~/giants-drink/tools/rom-toolkit/
Frame output: ~/giants-drink/tools/rom-toolkit/frames/

Install pngjs: cd ~/giants-drink && npm install pngjs

## CRITICAL RULES

- The suppress-and-replace must happen EVERY frame. Missing one frame
  means original Mario flickers through.
- OAM DMA in NES happens during VBlank. In jsnes, nes.frame() does
  the full cycle. Your modifications to spriteMem should persist if
  done after frame() returns. Test this assumption first.
- Capture ENOUGH frames to verify all movement states. 20 frames
  minimum, spread across the test scenarios.
- If ptTile[].pix doesn't work for CHR writes, probe jsnes for the
  right mechanism. Check nes.ppu.ptTile, nes.rom.vrom, or similar.
- Do NOT try to understand Mario's tile composition/animation system.
  The whole point is to BYPASS it.
- NES Y coordinates increase downward. Sprite Y in OAM is the top
  edge of the 8x8 tile.
- OAM can only hold 64 sprites. Mario uses 4-8. We replace those same
  slots or use high-numbered slots (56-63).
- jsnes loads ROMs as BINARY STRINGS: romData.toString('binary')

## WHAT TO DO FIRST

1. mkdir -p ~/giants-drink/tools/rom-toolkit/frames
2. npm install pngjs (in ~/giants-drink/)
3. Write a quick test: boot SMB, run 60 frames, log OAM entries near
   Mario's position. Understand what you need to suppress.
4. Build the replacement system incrementally:
   a. First just suppress Mario (blank the sprites). Verify Mario
      disappears from the frame captures.
   b. Then inject static test tiles at Mario's position. Verify they
      appear.
   c. Then make them track Mario's movement every frame.
   d. Then handle the edge cases.

## STOP CONDITION

When Part 3's full pipeline test produces verification frames showing
a custom character (loaded from PNG) correctly replacing Mario during
gameplay — STOP. Commit everything. Print a summary of:
- Does suppress-and-replace work reliably?
- Does the PNG-to-NES converter produce correct tiles?
- What edge cases remain unhandled?
- What would be needed to connect PixelLab into this pipeline?

Do NOT proceed to other games or other experiments. Wait for further
instructions.

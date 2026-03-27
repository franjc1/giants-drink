# Claude Code Instructions: Mega Man in Super Mario Bros — Full Animation

## YOUR MISSION

Replace Mario with a fully animated Mega Man in Super Mario Bros.
Not a static sprite — full walk cycle, jump pose, directional facing,
and a color change to red when Mario gets the fire flower. Mario's
fireballs should still work normally (they're separate game entities).

The end result is a playable browser demo where Mega Man runs, jumps,
and shoots fireballs through World 1-1.

## WHAT YOU ALREADY HAVE

From previous sessions in tools/rom-toolkit/:
- The sprite suppress-and-replace system (proven working with Link)
- SMB RAM knowledge: $0086=X, $00CE=Y, $0756=powerup state, etc.
- MM2 disassembly and PRG-ROM analysis (tools/rom-toolkit/mm2-analysis.md
  or mm2-disasm/ — check what exists)
- play-demo.html browser framework with jsnes, keyboard controls,
  rom-data.js auto-loading, toggle key
- The esbuild bundling setup

## STEP 1: EXTRACT MEGA MAN'S SPRITES FROM MM2

Mega Man 2 uses CHR-RAM — tile graphics are stored in PRG-ROM and
copied to PPU memory at runtime. You need to find Mega Man's sprite
tiles in the PRG-ROM data.

Approach:
1. Load MM2 ROM, boot to gameplay (navigate menus programmatically)
2. Once in a stage, capture the CHR-RAM contents from the PPU
   (nes.ppu.vramMem or the ptTile arrays)
3. Mega Man's sprites are in the sprite pattern table (typically
   $0000-$0FFF in PPU address space, which is ptTile[0-255])
4. Identify which tile indices make up Mega Man by reading OAM
   while Mega Man is in various poses:
   - Standing still (capture OAM, note tile indices and arrangement)
   - Walking right (capture across multiple frames to get walk cycle)
   - Jumping (capture mid-jump)
   - Walking/facing left (note: NES uses horizontal flip bit in OAM
     attributes, so left-facing may use same tiles as right with flip)
5. Extract the raw pixel data for each tile

Save the extracted tile data as JSON:
tools/rom-toolkit/megaman-sprites.json

Structure:
```json
{
  "poses": {
    "stand_right": {
      "tiles": [
        {"chrIndex": 42, "offsetX": 0, "offsetY": 0, "pixels": [...]},
        {"chrIndex": 43, "offsetX": 8, "offsetY": 0, "pixels": [...]},
        {"chrIndex": 44, "offsetX": 0, "offsetY": 8, "pixels": [...]},
        {"chrIndex": 45, "offsetX": 8, "offsetY": 8, "pixels": [...]}
      ],
      "width": 2, "height": 2
    },
    "walk_right_1": { ... },
    "walk_right_2": { ... },
    "walk_right_3": { ... },
    "jump_right": { ... },
    "stand_left": { "flipH": true, "base": "stand_right" },
    ...
  },
  "palette": {
    "normal": [0x0F, 0x11, 0x21, 0x30],  // black, blue, light blue, white
    "fire":   [0x0F, 0x16, 0x26, 0x30]   // black, red, light red, white
  }
}
```

IMPORTANT: Mega Man is a LARGE sprite character. In MM2, he may be
taller than 16x16. Check his actual OAM composition — he might be
16x24 or 16x32 (using 8x16 sprite mode or multiple rows of 8x8).

If Mega Man is taller than small Mario (16x16), you'll need to handle:
- Small Mario state: use a cropped or scaled-down version of Mega Man
  that fits 16x16, OR use the full Mega Man height and accept he's
  taller than original small Mario
- Big Mario state: use the full Mega Man sprite

Actually, the better approach: always use Mega Man at his natural
size regardless of Mario's powerup state. Just change the PALETTE
on fire flower, not the size. This is simpler and looks more natural.

## STEP 2: MAP MARIO'S STATE TO MEGA MAN'S POSES

Read these SMB RAM addresses each frame to determine which Mega Man
pose to display:

ANIMATION STATE:
- Player moving? Check if X position ($0086) changed from last frame
- Which direction? Check $0033 or similar (find the direction flag —
  you may need to probe for this. Alternative: check the OAM
  horizontal flip bit on Mario's original sprites before suppressing)
- Jumping? Check if player Y velocity ($009F) is non-zero, or check
  player state register
- Walking frame? SMB has an animation counter — find it, or implement
  your own frame counter that cycles every N frames while moving

Map:
- Not moving → stand_right or stand_left (based on last direction)
- Moving right → cycle walk_right_1/2/3 every 8 frames
- Moving left → cycle walk_left_1/2/3 every 8 frames (or flip right)
- In air (jumping/falling) → jump_right or jump_left
- Dying → could use a custom death pose or just freeze last pose

POWERUP STATE:
- $0756 = 0 (small): use normal blue palette
- $0756 = 1 (big): use normal blue palette
- $0756 = 2 (fire): switch to red palette
- Star power ($079E > 0): flash palette every 4 frames

## STEP 3: BUILD THE ANIMATED REPLACEMENT SYSTEM

Modify the suppress-and-replace loop to be state-aware:

```javascript
function doMegaManReplace(nes, megaManSprites) {
  // 1. Read Mario's state
  const x = nes.cpu.mem[0x0086];
  const y = nes.cpu.mem[0x00CE];
  const powerup = nes.cpu.mem[0x0756];
  const yVelocity = nes.cpu.mem[0x009F];
  // ... direction, animation counter, etc.
  
  // 2. Determine pose
  let pose = selectPose(direction, isMoving, isJumping, animFrame);
  
  // 3. Determine palette
  let palette = powerup === 2 ? megaManSprites.palette.fire 
                               : megaManSprites.palette.normal;
  
  // 4. Suppress Mario's OAM entries
  suppressMarioSprites(nes, x, y);
  
  // 5. Write Mega Man's tiles to CHR memory (if not already loaded)
  loadPoseTiles(nes, pose);
  
  // 6. Write Mega Man's OAM entries
  writeMegaManOAM(nes, pose, x, y, palette);
  
  // 7. Set sprite palette
  setSprPalette(nes, palette);
}
```

## STEP 4: VALIDATE WITH PIXEL ANALYSIS (LEARNED FROM LAST TIME)

Use the same incremental validation approach:

1. Verify Mega Man's extracted tiles look correct:
   - Write each pose's tiles to CHR, render a test frame, analyze
     the pixel region. Do the pixels form a recognizable Mega Man?
   - Compare tile pixel data against what you read from MM2's PPU.
     Are they identical?

2. Test each pose in isolation:
   - Stand: capture frame, verify Mega Man standing pose
   - Walk: capture across 30 frames with Right held, verify animation
     cycles (the pixel region should change between frames)
   - Jump: capture mid-jump, verify jump pose
   - Direction: walk left then right, verify facing changes

3. Test palette change:
   - Set $0756 = 2 (fire), verify Mega Man turns red
   - Set $0756 = 0 (small), verify blue returns

4. Test fireballs:
   - Set $0756 = 2, press B, verify fireball sprites appear
   - Fireballs should be UNAFFECTED by our replacement (we only
     suppress sprites near Mario's position, not fireball sprites)

For EACH validation, capture PNGs and analyze the pixels. Do not
declare success without pixel verification.

## STEP 5: BROWSER DEMO

Update play-demo.html (or create megaman-demo.html) with:
- Auto-loading SMB ROM (via rom-data.js)
- Full animated Mega Man replacement
- T key toggles Mega Man / Mario
- Status bar shows: current pose, current palette, powerup state
- Keyboard controls same as before

Remember the timing that worked for the Link demo — apply the same
OAM modification timing.

## IMPORTANT NOTES ON FIREBALLS

Mario's fireballs are separate sprite entities managed by SMB's code.
They have their own OAM entries at positions determined by their own
RAM state (not Mario's position). When you suppress sprites "near
Mario," make sure your proximity check doesn't accidentally suppress
fireballs that are near Mario at the moment of firing.

Use a tight suppression radius (within ~8 pixels of Mario's center)
to avoid catching fireballs. Or track which OAM slots Mario uses
(they tend to be consistent low-numbered slots) and only suppress
those specific slots.

## NOTES ON MEGA MAN'S SIZE

Mega Man in MM2 is 24 pixels tall (3 tiles high × 2 tiles wide = 6
tiles). This is taller than small Mario (16px) but shorter than big
Mario (32px). This is actually perfect — he'll look proportional in
the SMB world.

However, 6 tiles means 6 OAM entries to inject per frame (vs 4 for
the Link demo). Make sure you have enough free OAM slots. The game
uses slots 0-3 for Mario typically — check during runtime. Use slots
in the 56-63 range for safety if needed.

## ENVIRONMENT

Same jsnes setup. All previous tools available.
ROM locations: ~/nes-roms/ (grep for mario and mega)
Output: ~/giants-drink/tools/rom-toolkit/

## STOP CONDITION

When you have a playable browser demo where:
- Mega Man is clearly recognizable (not garbled)
- Walk animation cycles smoothly
- Direction changes when moving left vs right
- Jump has a distinct pose
- Fire flower changes Mega Man to red
- Fireballs work normally when fire-powered
- The game is fully playable through World 1-1

AND validation PNGs confirm each pose renders correctly.

STOP. Commit. Report:
- Total number of animation frames extracted from MM2
- Which Mario states map to which Mega Man poses
- Whether fireballs interact correctly
- Any edge cases or visual glitches
- The localhost URL and controls

## CRITICAL RULES

- Extract REAL tiles from MM2's ROM. Do not hand-draw Mega Man.
- Validate with pixel analysis at every step. No declaring success
  without checking the actual rendered pixels.
- Do not suppress fireball sprites — only suppress Mario's body sprites.
- The red palette for fire flower should be a real NES red, not just
  any arbitrary color. Use Mega Man's actual "Item 1" or "Crash Bomb"
  weapon palette from MM2 if you can find it, or a clean red variant.
- Test the browser demo yourself before declaring done — use the same
  headless frame capture technique to verify the browser build matches
  the headless validation.
- jsnes loads ROMs as BINARY STRINGS: romData.toString('binary')
- Commit after major milestones, not just at the end.

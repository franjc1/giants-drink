# Claude Code Instructions: Harry Potter in SMB — Definitive Proof of Concept

## THE GOAL

Replace Mario in Super Mario Bros with a fully animated Harry Potter
character. This must look GOOD and work PERFECTLY. This is the proof
of concept that determines whether the entire project moves forward.

Requirements:
- Harry Potter sprite replaces Mario completely
- Walking animation cycles smoothly
- Running animation (holding B) cycles faster or uses different frames
- Jumping has a distinct airborne pose
- Growing on mushroom pickup (small → big Harry)
- Color/style change on fire flower (e.g., red robes, wand glow)
- Fireballs still work when fire-powered
- All game interactions work seamlessly (stomping enemies, hitting
  blocks, entering pipes, flag pole)
- The character looks GOOD — recognizable as Harry Potter at retro
  pixel art resolution

## STRATEGY: CANVAS OVERLAY, NOT NES TILES

Do NOT convert PixelLab output to NES tile format. That produces ugly
degraded results. Instead:

1. NES emulator renders the game to a canvas (background, enemies, items)
2. Suppress Mario's OAM sprites (set Y to $FF)
3. Draw PixelLab sprites directly on the canvas at Mario's RAM position
4. Full resolution, full color — no NES palette/tile constraints

This means:
- PixelLab generates at 32x48 or larger — NOT 16x24
- The sprites render on the canvas as regular images scaled to match
  NES pixel proportions
- Colors are unrestricted by NES palette limitations
- The character can look genuinely beautiful

## PIXELLAB GENERATION PLAN

### API Setup
```python
import pixellab
import os

client = pixellab.Client(secret=os.environ.get('PIXELLAB_SECRET') or 
    open(os.path.expanduser('~/giants-drink/.env')).read().split('=')[1].strip())
```

### What to Generate

You need TWO sizes (small Harry and big Harry) and multiple poses.

SMALL HARRY (pre-mushroom, ~32x48 pixels):
1. Standing right (idle)
2. Walk frame 1 (right leg forward)
3. Walk frame 2 (left leg forward)  
4. Walk frame 3 (mid-stride or contact pose)
5. Jump pose (airborne, robes flowing up)

BIG HARRY (post-mushroom, ~32x64 pixels):
6. Standing right (idle, taller)
7. Walk frame 1
8. Walk frame 2
9. Walk frame 3
10. Jump pose

FIRE HARRY (red robes or special visual, ~32x64 pixels):
11. Standing right (with wand visible)
12. Walk frame 1
13. Walk frame 2
14. Walk frame 3
15. Jump pose

That's 15 images. Well within the 20 parallel limit.

### Generation Approach

Use generate_image_pixflux for the base standing pose, then use
init_image with that pose for all subsequent frames to maintain
character consistency.

KEY PROMPT ENGINEERING:
- Be specific: "side-view pixel art Harry Potter character, black 
  robes, round glasses, lightning bolt scar, messy black hair, 
  holding wand, facing right"
- For walk frames: same prompt + "walking, [specific leg position]"
- For jump: same prompt + "jumping, robes flowing upward"
- For fire variant: change "black robes" to "red and gold robes"
  or "glowing wand, magical aura"
- Always specify: "NES-era retro pixel art style, side-scrolling 
  platformer, transparent background"
- Use no_background=True for transparent backgrounds

### Parallel Generation

Generate up to 20 images in parallel to save time:

```python
import asyncio
import concurrent.futures

def generate_sprite(description, filename, size, init_img=None):
    kwargs = {
        "description": description,
        "image_size": {"width": size[0], "height": size[1]},
        "no_background": True,
    }
    if init_img:
        kwargs["init_image"] = init_img
        kwargs["init_image_strength"] = 0.65
    
    response = client.generate_image_pixflux(**kwargs)
    # Save the image - handle Base64Image response
    img = response.image
    if hasattr(img, 'pil_image'):
        img.pil_image().save(filename)
    elif hasattr(img, 'save'):
        img.save(filename)
    else:
        # It's a Base64Image - decode and save
        import base64
        from PIL import Image
        import io
        b64data = img.image if hasattr(img, 'image') else str(img)
        img_bytes = base64.b64decode(b64data)
        Image.open(io.BytesIO(img_bytes)).save(filename)
    print(f"Saved {filename}")
    return filename

# Generate base pose first (need this for init_image consistency)
base_desc = "side-view pixel art Harry Potter character, black wizard robes, round glasses, lightning bolt scar on forehead, messy black hair, small wand in hand, facing right, standing idle, NES retro 8-bit style, platformer character sprite"

generate_sprite(base_desc, "hp-stand-small.png", (32, 48))

# Then generate all variants in parallel using the base as init_image
# Use ThreadPoolExecutor since the API calls are I/O bound
```

IMPORTANT: The PixelLab API may not support true parallel requests.
If parallel calls fail, do sequential but batch similar requests.
The init_image parameter is critical for consistency — every frame
should use the standing pose as the reference.

### Quality Control

After generating, LOOK at the images. Use PIL to check:
1. Is the image mostly transparent background with a character in it?
2. Is the character roughly centered?
3. Are the dimensions correct?
4. Do multiple frames look like the same character?

```python
from PIL import Image
img = Image.open("hp-stand-small.png")
print(f"Size: {img.size}, Mode: {img.mode}")
# Count non-transparent pixels
if img.mode == 'RGBA':
    pixels = list(img.getdata())
    non_transparent = sum(1 for p in pixels if p[3] > 128)
    print(f"Non-transparent pixels: {non_transparent}/{len(pixels)}")
    # Should be roughly 20-40% of total pixels for a character sprite
```

If a generation looks bad (too few pixels, wrong proportions, not
recognizable), regenerate with adjusted prompt. You have budget.

Save all sprites to ~/giants-drink/tools/rom-toolkit/hp-sprites/

## BROWSER DEMO

### Architecture

```
┌─────────────────────────────────┐
│         Visible Canvas          │
│  ┌───────────────────────────┐  │
│  │  NES Frame (background,   │  │
│  │  enemies, items, HUD)     │  │
│  │  Mario's sprites HIDDEN   │  │
│  │                           │  │
│  │    [Harry Potter sprite   │  │
│  │     drawn on top at       │  │
│  │     Mario's position]     │  │
│  │                           │  │
│  └───────────────────────────┘  │
└─────────────────────────────────┘
```

### Implementation

Create tools/rom-toolkit/hp-demo.html:

1. Load jsnes, run SMB (auto-load via rom-data.js)
2. NES renders to canvas via onFrame callback
3. After each frame render:
   a. Read Mario's state from RAM:
      - Position: $0086 (X), $00CE (Y) 
      - Powerup: $0756 (0=small, 1=big, 2=fire)
      - Player state: $000E
      - Moving: compare X to previous frame
      - Direction: track which way X is changing
      - In air: Y velocity $009F != 0
      - Animation counter: implement your own (cycle every 6-8 frames while moving)
   b. Suppress Mario's sprites in OAM:
      - Scan spriteMem for sprites near Mario's position
      - Set their Y to 0xFF
   c. Select the correct Harry Potter sprite:
      - Small/big/fire based on powerup state
      - Stand/walk/jump based on movement state
      - Flip horizontally if facing left
   d. Draw the selected sprite on the canvas:
      - Scale to match NES pixel size (each NES pixel = canvas scale factor)
      - Position at Mario's screen coordinates
      - Use ctx.drawImage() with the pre-loaded sprite Image

### Sprite Scaling

NES native resolution is 256x240. The canvas is probably scaled 2-3x.
Your sprites are generated at 32x48 (small) / 32x64 (big).
NES Mario is 16x16 (small) / 16x32 (big).
So your sprites are 2x the NES character size in pixels.
When drawing on canvas, scale them to match: if canvas is 3x NES,
draw the 32x48 sprite at 48x72 canvas pixels (1.5x sprite size).

Actually — figure out the exact scaling math:
- Canvas pixel size / NES pixel size = scale factor
- Small NES Mario = 16x16 pixels → 16*scale x 16*scale on canvas
- Your small Harry = 32x48 pixels
- Draw Harry at: width = 16*scale, height = 24*scale (matching NES proportions)
- This means you're fitting the 32x48 image into a 16*scale x 24*scale box

The key: Harry should occupy the same visual space as Mario would.
Not bigger, not smaller. Same footprint in the game world.

### Pre-loading Sprites

Load all sprite images at startup before the game loop begins:

```javascript
const sprites = {};
const spriteFiles = {
  'small-stand': 'hp-sprites/hp-stand-small.png',
  'small-walk1': 'hp-sprites/hp-walk1-small.png',
  // ... etc
};

async function loadSprites() {
  for (const [key, path] of Object.entries(spriteFiles)) {
    const img = new Image();
    img.src = path;
    await new Promise(resolve => { img.onload = resolve; });
    sprites[key] = img;
  }
}
```

### Horizontal Flipping

When Harry faces left, flip the sprite:
```javascript
ctx.save();
ctx.scale(-1, 1);
ctx.drawImage(sprite, -(x + width), y, width, height);
ctx.restore();
```

### Frame Loop

```javascript
function gameLoop() {
  // 1. Run NES frame (renders to canvas via onFrame)
  nes.frame();
  
  // 2. Read Mario state
  const state = readMarioState(nes);
  
  // 3. Suppress Mario's OAM sprites
  suppressMarioSprites(nes, state.x, state.y);
  
  // NOTE: The above suppression takes effect NEXT frame.
  // So on this frame, Mario may briefly appear. To fix:
  // Draw Harry OVER Mario's position on the current canvas.
  // Since we're drawing on top, Harry covers Mario visually
  // even if OAM suppression is delayed by one frame.
  
  // 4. Select and draw Harry sprite
  const sprite = selectSprite(state);
  drawHarry(ctx, sprite, state);
  
  requestAnimationFrame(gameLoop);
}
```

IMPORTANT INSIGHT: Since we're drawing on the canvas AFTER the NES
frame renders, we can just draw Harry on top of Mario. We still
suppress OAM to prevent Mario from flickering through in edge cases,
but the canvas overdraw handles the visual immediately. This avoids
the 1-frame delay problem entirely.

### Mushroom Growth Transition

When Mario gets a mushroom ($0756 changes from 0 to 1), the game
plays a growing animation over ~30 frames. During this transition,
you could:
- Simple: just switch from small to big Harry sprites immediately
- Better: scale the small Harry sprite up over 15 frames as a
  simple growth animation

### Death Animation

When Mario dies ($000E becomes the death state value — check from
the SMB analysis, it was state 11 or similar), you could:
- Simple: freeze Harry's last pose
- Better: have Harry fall off screen following Mario's death physics
  (read Y position during death, keep drawing Harry there)

### Toggle

Press T to toggle between Harry and original Mario (same as previous
demos).

## FILE STRUCTURE

```
tools/rom-toolkit/
  hp-demo.html              ← the playable demo
  hp-demo-bundle.js          ← esbuild output
  rom-data.js                ← auto-generated ROM (from previous session)
  hp-sprites/                ← PixelLab generated sprites
    hp-stand-small.png
    hp-walk1-small.png
    hp-walk2-small.png
    hp-walk3-small.png
    hp-jump-small.png
    hp-stand-big.png
    hp-walk1-big.png
    hp-walk2-big.png
    hp-walk3-big.png
    hp-jump-big.png
    hp-stand-fire.png
    hp-walk1-fire.png
    hp-walk2-fire.png
    hp-walk3-fire.png
    hp-jump-fire.png
  generate-hp-sprites.py     ← the PixelLab generation script
```

## VALIDATION

Since we're drawing on canvas (not NES tiles), validation is simpler:
1. Check that the sprite images loaded correctly (non-zero dimensions)
2. Check that Harry's position tracks Mario's RAM position exactly
3. Check that walking animation cycles (frame changes over time)
4. Check that powerup state correctly switches sprite sets
5. Play the game for 30 seconds across different states

For headless validation: capture canvas content after drawing Harry,
verify the pixel region at Mario's position contains non-NES-palette
colors (proving the canvas overlay is working, not just NES rendering).

## ENVIRONMENT

Python: pixellab SDK (pip install pixellab --break-system-packages)
        PIL/Pillow for image inspection
Node.js: jsnes, esbuild for bundling
Browser: vanilla JS, canvas API

PixelLab API key: in ~/giants-drink/.env as PIXELLAB_SECRET

ROM auto-load: rom-data.js should exist from previous sessions.
If not, regenerate it:
```bash
node -e "
const fs = require('fs');
const rom = fs.readFileSync(process.env.HOME + '/nes-roms/Super Mario Bros. (World).nes');
fs.writeFileSync('rom-data.js', 'window.ROM_DATA=\"' + rom.toString('base64') + '\";');
"
```

## STOP CONDITION

When you have:
- All 15 PixelLab sprites generated and saved
- A playable browser demo at localhost
- Harry Potter visually replacing Mario across all states
- Walking, jumping, growing, fire-power all working
- The game fully playable through World 1-1

STOP. Commit. Report:
- Quality assessment of PixelLab sprites at this size
- Total PixelLab API cost
- Total CC session time
- Any visual glitches or edge cases
- The localhost URL and controls
- Screenshot descriptions of key moments (standing, walking, jumping,
  big Harry, fire Harry)

## CRITICAL RULES

- Do NOT convert to NES tile format. Draw sprites directly on canvas.
- Generate at 32x48 (small) and 32x64 (big), NOT 16x24.
- Use init_image for consistency across animation frames.
- If PixelLab generates bad results at 32x48, try 48x72 or 64x96
  and downscale. Bigger = more detail = better quality.
- Pre-load ALL sprite images before starting the game loop.
- Draw Harry OVER the NES frame on the canvas — don't try to
  modify the NES frame buffer before it renders.
- Suppress Mario's OAM entries to prevent him showing through,
  but rely on canvas overdraw for immediate visual coverage.
- Handle horizontal flipping via canvas transform, not separate images.
- The game must be PLAYABLE and ENJOYABLE. This is a demo that needs
  to impress. Take the extra time to get it right.

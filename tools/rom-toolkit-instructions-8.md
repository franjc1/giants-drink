# Claude Code Instructions: PixelLab → SMB Sprite Replacement Pipeline

## YOUR MISSION

Use the PixelLab API to generate a custom animated character, convert
it to NES format, and inject it into the SMB sprite replacement demo.
This is the end-to-end pipeline: AI-generated art → running NES game.

## STEP 1: SET UP PIXELLAB

Install the Python SDK:
```
pip install pixellab --break-system-packages
```

The API key should be in one of these locations (check in order):
- Environment variable: PIXELLAB_SECRET  
- File: ~/.env.development.secrets (contains PIXELLAB_SECRET=xxx)
- File: ~/giants-drink/.env (contains PIXELLAB_SECRET=xxx)

If none of these exist, ask Joe to provide his PixelLab API key.

Test connectivity:
```python
import pixellab
client = pixellab.Client(secret="THE_KEY")
# Quick test: generate a tiny image
response = client.generate_image_pixflux(
    description="cute knight character",
    image_size={"width": 32, "height": 32},
)
response.image.save("test.png")
```

## STEP 2: GENERATE THE CHARACTER

Generate a side-view platformer character at 16x24 pixels (small Mario
replacement size). Use generate_image_pixflux with transparent background.

```python
import pixellab

client = pixellab.Client(secret="THE_KEY")

# Standing pose - facing right
response = client.generate_image_pixflux(
    description="side-view pixel art knight character, facing right, standing idle pose, NES retro style, simple design, dark armor with bright helmet plume",
    image_size={"width": 16, "height": 24},
    no_background=True,  # transparent background
)
response.image.save("knight-stand.png")
```

The character should be:
- 16 pixels wide, 24 pixels tall
- Transparent background
- 3-4 colors max (NES sprite palette limit)
- Clear, recognizable silhouette at this tiny size
- Side-view, suitable for a platformer

NOTE: PixelLab may struggle at 16x24 (very small). If results are
poor, try generating at 32x48 and downscaling, OR generate at 32x32
and crop. Experiment to find what produces the best result.

If the description "knight" doesn't produce good results, try:
- "wizard character with pointy hat"
- "robot character with antenna"  
- "ninja character with headband"
Pick whatever looks best at NES resolution.

## STEP 3: GENERATE WALK CYCLE ANIMATION

Use the animate-with-skeleton or animate-with-text endpoint to create
walk frames from the standing pose.

Option A — Skeleton animation (preferred if it works):
```python
# First estimate the skeleton
skeleton_response = client.estimate_skeleton(
    image=pixellab.Image.from_filepath("knight-stand.png"),
    # Check API docs for exact parameters
)

# Then animate
anim_response = client.animate_skeleton(
    image=pixellab.Image.from_filepath("knight-stand.png"),
    skeleton=skeleton_response.skeleton,  # or however the API returns it
    # animation parameters — check docs
)
```

Option B — Text-based animation:
Check if PixelLab has a text-to-animation endpoint that takes an
init image and a text description like "walking right". The API docs
at https://api.pixellab.ai/v1/docs should have details.

Option C — Generate each frame separately:
If animation endpoints don't work well at 16x24, generate individual
frames:
```python
# Walk frame 1
r1 = client.generate_image_pixflux(
    description="side-view pixel art knight walking right, left foot forward, NES retro style",
    image_size={"width": 16, "height": 24},
    no_background=True,
    init_image=pixellab.Image.from_filepath("knight-stand.png"),
    init_image_strength=0.7,  # keep the character consistent
)
r1.image.save("knight-walk1.png")

# Walk frame 2
r2 = client.generate_image_pixflux(
    description="side-view pixel art knight walking right, right foot forward, NES retro style",
    image_size={"width": 16, "height": 24},
    no_background=True,
    init_image=pixellab.Image.from_filepath("knight-stand.png"),
    init_image_strength=0.7,
)
r2.image.save("knight-walk2.png")

# Jump pose
r3 = client.generate_image_pixflux(
    description="side-view pixel art knight jumping, arms up, NES retro style",
    image_size={"width": 16, "height": 24},
    no_background=True,
    init_image=pixellab.Image.from_filepath("knight-stand.png"),
    init_image_strength=0.7,
)
r3.image.save("knight-jump.png")
```

Generate at minimum:
- 1 standing frame
- 2-3 walking frames
- 1 jumping frame

Save all frames to ~/giants-drink/tools/rom-toolkit/pixellab-sprites/

## STEP 4: CONVERT TO NES TILES

Use the existing png-to-nes-tiles.cjs converter (from previous session)
to convert each frame:

```bash
node tools/rom-toolkit/png-to-nes-tiles.cjs pixellab-sprites/knight-stand.png
node tools/rom-toolkit/png-to-nes-tiles.cjs pixellab-sprites/knight-walk1.png
# etc.
```

If the converter doesn't exist or doesn't work, build one:
1. Read the PNG with pngjs (npm install pngjs)
2. Find unique colors, map to NES palette (find closest in NES master palette)
3. Quantize to 3 colors + transparent (4 total)
4. Slice into 8x8 tiles
5. Output as JSON with pixel arrays

IMPORTANT: All frames must use the SAME palette for consistency.
Extract the palette from the standing frame, then force all other
frames to use that same palette.

## STEP 5: INTEGRATE INTO SMB DEMO

Load the converted tile data into the existing sprite replacement
system. Update the megaman-demo.html (or create pixellab-demo.html):

1. Load all frame tile sets
2. Map Mario's state to poses:
   - Standing → stand frame
   - Moving → cycle walk frames
   - Jumping → jump frame
   - Direction → horizontal flip
3. Use the PROVEN suppress-and-replace timing from the Link demo
   (that one worked correctly)

CRITICAL: Base your browser code on the Link demo version, NOT the
broken Mega Man demo version. The Link demo had correct rendering.
Copy its OAM timing and modification approach.

## STEP 6: VALIDATE

Same approach as before:
1. Headless validation with pixel analysis (Steps 2-5 from the v2 prompt)
2. Verify each frame renders as a recognizable character
3. Verify animation cycles during movement
4. Build browser demo only after headless validation passes
5. Auto-load ROM via rom-data.js

## ENVIRONMENT

Python: pip install pixellab --break-system-packages
Node.js: jsnes, pngjs already available
Browser: esbuild for bundling

All previous tools in ~/giants-drink/tools/rom-toolkit/ are available.

## COST NOTES

PixelLab API calls cost ~$0.008-0.015 each at these small sizes.
Total for 5-6 images: ~$0.05-0.10. Very cheap.

## STOP CONDITION

When you have a playable browser demo with a PixelLab-generated
character replacing Mario, fully animated, STOP.

Report:
- Which PixelLab model/endpoint produced the best results at NES size
- How many API calls were needed
- Total PixelLab API cost
- Quality assessment: does the character look good at NES resolution?
- The localhost URL to play it
- Any known issues

## CRITICAL RULES

- The PixelLab-generated character must look GOOD. If a generation
  looks bad, regenerate with a different prompt. You have budget for
  20+ attempts at $0.01 each.
- Use the SAME palette across all animation frames.
- Base the browser rendering on the Link demo code, not the Mega Man
  demo code.
- Validate with pixel analysis before building the browser version.
- Do not hand-draw any pixel art. All character art comes from PixelLab.

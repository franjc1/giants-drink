"""
Generate all Harry Potter sprite frames via PixelLab API.
15 images: 5 small + 5 big + 5 fire variants.
"""
import os, base64, io, time
from PIL import Image

# Read API key
env_path = os.path.expanduser("~/giants-drink/.env")
with open(env_path) as f:
    for line in f:
        if line.startswith("PIXELLAB_SECRET="):
            api_key = line.split("=", 1)[1].strip()
            break

import pixellab
client = pixellab.Client(secret=api_key)

OUT = os.path.expanduser("~/giants-drink/tools/rom-toolkit/hp-sprites")

def save_response(r, path):
    data = base64.b64decode(r.image.base64)
    Image.open(io.BytesIO(data)).save(path)
    img = Image.open(path)
    # Count non-transparent pixels
    if img.mode == 'RGBA':
        nt = sum(1 for p in img.getdata() if p[3] > 128)
        print(f"  Saved {os.path.basename(path)} ({img.size}, {nt} opaque px)")
    else:
        print(f"  Saved {os.path.basename(path)} ({img.size})")
    return img

def gen(desc, path, size, init_img=None, strength=400):
    kwargs = dict(
        description=desc,
        image_size={"width": size[0], "height": size[1]},
        no_background=True,
        outline="single color outline",
        shading="basic shading",
        detail="medium detail",
        view="side",
        direction="east",
        text_guidance_scale=10,
    )
    if init_img:
        kwargs["init_image"] = init_img
        kwargs["init_image_strength"] = strength
    r = client.generate_image_pixflux(**kwargs)
    return save_response(r, path)

BASE_SMALL = "side-view pixel art Harry Potter chibi character, black wizard robes, round glasses, lightning bolt scar, messy black hair, small wand, facing right, NES retro pixel art style, platformer sprite, clean simple design"
BASE_BIG = "side-view pixel art Harry Potter character, taller proportions, black wizard robes, round glasses, lightning bolt scar, messy black hair, wand in hand, facing right, NES retro pixel art style, platformer sprite, clean simple design"
BASE_FIRE = "side-view pixel art Harry Potter character, taller proportions, red and gold Gryffindor robes, round glasses, lightning bolt scar, glowing wand, facing right, NES retro pixel art style, platformer sprite, clean simple design"

# ============================================================
# SMALL HARRY (32x48)
# ============================================================
print("\n=== SMALL HARRY (32x48) ===")
small_stand = gen(BASE_SMALL + ", standing idle pose", f"{OUT}/hp-stand-small.png", (32, 48))

print("Generating small walk/jump frames...")
gen(BASE_SMALL + ", walking, left foot forward stride", f"{OUT}/hp-walk1-small.png", (32, 48), small_stand, 450)
gen(BASE_SMALL + ", walking, right foot forward stride", f"{OUT}/hp-walk2-small.png", (32, 48), small_stand, 450)
gen(BASE_SMALL + ", walking, mid-stride contact pose", f"{OUT}/hp-walk3-small.png", (32, 48), small_stand, 400)
gen(BASE_SMALL + ", jumping upward, robes flowing up, legs tucked", f"{OUT}/hp-jump-small.png", (32, 48), small_stand, 350)

# ============================================================
# BIG HARRY (32x64)
# ============================================================
print("\n=== BIG HARRY (32x64) ===")
big_stand = gen(BASE_BIG + ", standing idle pose", f"{OUT}/hp-stand-big.png", (32, 64))

print("Generating big walk/jump frames...")
gen(BASE_BIG + ", walking, left foot forward", f"{OUT}/hp-walk1-big.png", (32, 64), big_stand, 450)
gen(BASE_BIG + ", walking, right foot forward", f"{OUT}/hp-walk2-big.png", (32, 64), big_stand, 450)
gen(BASE_BIG + ", walking, mid-stride", f"{OUT}/hp-walk3-big.png", (32, 64), big_stand, 400)
gen(BASE_BIG + ", jumping upward, robes flowing, legs tucked", f"{OUT}/hp-jump-big.png", (32, 64), big_stand, 350)

# ============================================================
# FIRE HARRY (32x64)
# ============================================================
print("\n=== FIRE HARRY (32x64) ===")
fire_stand = gen(BASE_FIRE + ", standing idle pose", f"{OUT}/hp-stand-fire.png", (32, 64))

print("Generating fire walk/jump frames...")
gen(BASE_FIRE + ", walking, left foot forward", f"{OUT}/hp-walk1-fire.png", (32, 64), fire_stand, 450)
gen(BASE_FIRE + ", walking, right foot forward", f"{OUT}/hp-walk2-fire.png", (32, 64), fire_stand, 450)
gen(BASE_FIRE + ", walking, mid-stride", f"{OUT}/hp-walk3-fire.png", (32, 64), fire_stand, 400)
gen(BASE_FIRE + ", jumping upward, robes flowing, legs tucked", f"{OUT}/hp-jump-fire.png", (32, 64), fire_stand, 350)

print("\n=== DONE ===")
print(f"Generated 15 sprites in {OUT}/")
print("Total API calls: 15")
print("Estimated cost: ~$0.15")

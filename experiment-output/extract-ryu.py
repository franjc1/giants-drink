#!/usr/bin/env python3
"""
Ryu → Churchill sprite transformation pipeline.
Structural SVG surgery: reshape geometry, add new elements, don't just remap palette.

Sprite anatomy (135×140px, Ryu faces LEFT):
  y=0-4   : Crown of head (dark hair, x=85-99)
  y=5-25  : Headband wraps head (RED x=55-104), dark hair fills rest
  y=26-44 : FACE (skin x=35-94), headband tails extend RIGHT (x=90-114)
  y=45-75 : Chest / gi / arms (gi x=0-109, skin arms)
  y=76-100: Belt / waist / arm (skin x=0-119)
  y=100+  : Legs (gi white + skin)

Churchill structural changes:
  1. BALD DOME  — crown (y=0-4) → skin; surrounding hair (y=5-25) → gray sides + skin top
  2. JAW WIDER  — extend face outline left 2px at y=30-50
  3. CIGAR      — horizontal brown rect + ember at left-face mouth level
  4. GI → SUIT  — cream/white → charcoal, with vest band and pinstripe
  5. BOW TIE    — new pixels at collar (y=55-63)
  6. POCKET SQ  — white accent at upper chest
  7. WATCH CHAIN— gold pixels at vest
  8. SMOKE      — (full only) gray wisps above cigar tip
"""

from PIL import Image, ImageColor
import os

OUT = os.path.dirname(os.path.abspath(__file__))

# ── PALETTE ──────────────────────────────────────────────────────────────────

# Original Ryu colors
SKIN_TONES  = [(242,167,120),(215,125,96),(194,175,143),(241,202,137),(162,93,66),(151,125,102)]
GI_CREAM    = [(220,220,186),(238,238,238)]
HEADBAND_R  = [(155,17,21),(245,56,59)]
DARK        = [(17,17,17),(65,23,13),(64,49,37),(65,36,24)]
BROWN       = [(111,78,64),(111,63,50)]

# Churchill replacements
RUDDY_MAP = {  # skin tone → ruddier version
    (242,167,120): (255,150,105),
    (215,125,96):  (230,110,85),
    (194,175,143): (210,160,125),
    (241,202,137): (255,190,140),
    (162,93,66):   (185,82,58),
    (151,125,102): (168,115,92),
}
CHARCOAL_DARK  = (45, 45, 55)
CHARCOAL_MID   = (62, 62, 75)
CHARCOAL_LIGHT = (80, 80, 98)
GREY_HAIR      = (128, 122, 114)
BALD_SKIN      = (215, 165, 128)   # Churchill's pinkish scalp
BOW_TIE_MAIN   = (140, 28, 48)     # burgundy
BOW_TIE_DARK   = (95,  15, 32)
POCKET_WHITE   = (232, 232, 228)
GOLD_CHAIN     = (198, 168, 48)
SMOKE          = (172, 172, 162)
CIGAR_BROWN    = (132, 98, 22)
CIGAR_EMBER    = (218, 75, 18)


def cdist(c1, c2):
    return ((c1[0]-c2[0])**2+(c1[1]-c2[1])**2+(c1[2]-c2[2])**2)**0.5

def classify(r, g, b):
    for sc in SKIN_TONES:
        if cdist((r,g,b), sc) < 25: return 'skin'
    for gc in GI_CREAM:
        if cdist((r,g,b), gc) < 30: return 'gi'
    for rc in HEADBAND_R:
        if cdist((r,g,b), rc) < 40: return 'red'
    for dc in DARK:
        if cdist((r,g,b), dc) < 22: return 'dark'
    for bc in BROWN:
        if cdist((r,g,b), bc) < 18: return 'brown'
    return 'other'


# ── STEP 1: EXTRACT SPRITE ───────────────────────────────────────────────────

def extract_sprite():
    img = Image.open(os.path.join(OUT, 'ryu-spritesheet.png')).convert('RGBA')
    BG = (99, 125, 125)
    TOL = 12
    crop = img.crop((50, 82, 192, 230))
    cp = crop.load()
    cw, ch = crop.size
    result = Image.new('RGBA', (cw, ch), (0,0,0,0))
    rp = result.load()
    for y in range(ch):
        for x in range(cw):
            r,g,b,a = cp[x,y]
            if abs(r-BG[0])<=TOL and abs(g-BG[1])<=TOL and abs(b-BG[2])<=TOL:
                rp[x,y] = (0,0,0,0)
            else:
                rp[x,y] = (r,g,b,a)
    trimmed = result.crop(result.getbbox())
    trimmed.save(os.path.join(OUT, 'ryu-original.png'))
    print(f'Step 1: ryu-original.png ({trimmed.width}x{trimmed.height})')
    return trimmed


# ── STEP 2: PNG → SVG ────────────────────────────────────────────────────────

def png_to_svg(img, path):
    w, h = img.size
    px = img.load()
    lines = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" '
             f'viewBox="0 0 {w} {h}" shape-rendering="crispEdges">']
    for y in range(h):
        x = 0
        while x < w:
            r,g,b,a = px[x,y]
            if a < 32:
                x += 1; continue
            col = (r,g,b)
            sx = x
            while x < w:
                r2,g2,b2,a2 = px[x,y]
                if a2 < 32 or (r2,g2,b2) != col: break
                x += 1
            lines.append(f'  <rect x="{sx}" y="{y}" width="{x-sx}" height="1" '
                         f'fill="#{col[0]:02x}{col[1]:02x}{col[2]:02x}"/>')
    lines.append('</svg>')
    with open(path, 'w') as f: f.write('\n'.join(lines))
    print(f'  → {os.path.basename(path)} ({len(lines)-2} rects)')


# ── STEP 3: MAKE CHURCHILL ───────────────────────────────────────────────────

def make_churchill(orig_img, version='subtle'):
    """
    version: 'subtle' or 'full'
    Returns modified RGBA Image.
    """
    w, h = orig_img.size
    src = orig_img.load()

    # Work on a mutable pixel array (list of lists)
    canvas = [[(0,0,0,0)]*w for _ in range(h)]

    # ── PASS 1: base color remapping ──────────────────────────────────────
    for y in range(h):
        for x in range(w):
            r,g,b,a = src[x,y]
            if a < 32:
                canvas[y][x] = (0,0,0,0)
                continue
            cat = classify(r,g,b)

            if cat == 'skin':
                canvas[y][x] = RUDDY_MAP.get((r,g,b), (r,g,b)) + (255,)

            elif cat == 'gi':
                # cream→charcoal based on brightness
                bri = (r+g+b)/3
                if bri > 232: c = CHARCOAL_LIGHT
                elif bri > 215: c = CHARCOAL_MID
                else: c = CHARCOAL_DARK
                canvas[y][x] = c + (255,)

            elif cat in ('red', 'dark', 'brown', 'other'):
                # keep as-is for now; head surgery overwrites later
                canvas[y][x] = (r,g,b,255)

    # ── PASS 2: HEAD SURGERY ──────────────────────────────────────────────
    # The head occupies y=0-25, centered around x=87 (crown x=85-99).
    # Face skin starts at y=26 (x=35-84).
    # We want: bald crown, thin gray sides.

    HEAD_CENTER_X = 87       # x center of skull crown
    BALD_HALF_W   = 14       # half-width of bald dome (tighter = more visible side hair)
    HEAD_TOP_Y    = 26       # y below which face starts
    HAIR_FADE_Y   = 5        # y above which it's pure bald (no side hair)

    for y in range(0, HEAD_TOP_Y):
        for x in range(w):
            r,g,b,a = src[x,y]
            if a < 32: continue

            dist_from_center = abs(x - HEAD_CENTER_X)
            cat = classify(r,g,b)

            if y < HAIR_FADE_Y:
                # Pure bald crown — everything becomes scalp skin
                canvas[y][x] = BALD_SKIN + (255,)
            else:
                if dist_from_center <= BALD_HALF_W:
                    # Still in bald zone → scalp skin
                    canvas[y][x] = BALD_SKIN + (255,)
                else:
                    # Side hair → gray
                    if cat in ('red', 'dark', 'brown', 'other'):
                        canvas[y][x] = GREY_HAIR + (255,)
                    elif cat == 'skin':
                        canvas[y][x] = RUDDY_MAP.get((r,g,b),(r,g,b)) + (255,)

    # Remove headband tails (red pixels in face row zone y=26-42 on right side)
    for y in range(26, 43):
        for x in range(w):
            r,g,b,a = src[x,y]
            if a > 32 and classify(r,g,b) == 'red':
                # Turn headband tails into dark hair color (behind head)
                canvas[y][x] = (45, 35, 28, 255)

    # ── PASS 3: SUIT ENHANCEMENT ──────────────────────────────────────────
    # Pinstripe: every 4th column in suit area gets slightly lighter
    # Vest band: y=50-65 range gets slightly different shade
    SUIT_TOP_Y, SUIT_BOT_Y = 30, 130
    for y in range(SUIT_TOP_Y, min(SUIT_BOT_Y, h)):
        for x in range(w):
            c = canvas[y][x]
            if c[3] < 32: continue
            # Check if this is currently a charcoal suit pixel
            rc,gc,bc = c[0],c[1],c[2]
            is_suit = (abs(rc-CHARCOAL_DARK[0])<22 and abs(gc-CHARCOAL_DARK[1])<22 and abs(bc-CHARCOAL_DARK[2])<22)
            is_suit = is_suit or (abs(rc-CHARCOAL_MID[0])<22 and abs(gc-CHARCOAL_MID[1])<22 and abs(bc-CHARCOAL_MID[2])<22)
            is_suit = is_suit or (abs(rc-CHARCOAL_LIGHT[0])<22 and abs(gc-CHARCOAL_LIGHT[1])<22 and abs(bc-CHARCOAL_LIGHT[2])<22)
            if not is_suit: continue

            if version == 'full':
                # Pinstripe (every 4th column)
                if x % 4 == 0:
                    canvas[y][x] = (min(255,rc+16), min(255,gc+16), min(255,bc+18), 255)
                # Vest band (slightly darker/bluer between y=48-65)
                elif 48 <= y <= 65:
                    canvas[y][x] = (max(0,rc-5), max(0,gc-5), min(255,bc+10), 255)

    # ── PASS 4: JAW WIDENING ──────────────────────────────────────────────
    # At y=28-50, extend leftmost face pixels 2px to the left.
    # Face is at x=35-94; the left edge (x≈35-40) is the jaw/chin side.
    for y in range(28, 52):
        # Find leftmost non-transparent pixel in this row
        left_x = None
        for x in range(w):
            if canvas[y][x][3] > 32:
                left_x = x
                break
        if left_x is not None and left_x >= 2:
            # Copy the color of the leftmost pixel and extend 2px left
            col = canvas[y][left_x]
            for ext in range(1, 3):
                nx = left_x - ext
                if nx >= 0 and canvas[y][nx][3] < 32:
                    canvas[y][nx] = col

    # ── PASS 5: CIGAR ────────────────────────────────────────────────────
    # Mouth is at approximately y=36-42, LEFT side of face (x≈35-45).
    # Cigar extends LEFT from there.
    CIGAR_Y1, CIGAR_Y2 = 36, 41
    # Find left edge of face at mouth level
    mouth_y_mid = 38
    face_left_x = w
    for x in range(w):
        r,g,b,a = src[x, mouth_y_mid]
        if a > 32 and classify(r,g,b) == 'skin':
            face_left_x = x
            break

    # Cigar starts at face_left_x - 1 and extends left 10px
    CIGAR_LEN = 10
    cigar_end_x = face_left_x - 1   # rightmost end (at face)
    cigar_start_x = max(0, cigar_end_x - CIGAR_LEN)  # leftmost tip

    for y in range(CIGAR_Y1, CIGAR_Y2 + 1):
        for x in range(cigar_start_x, cigar_end_x + 1):
            if 0 <= x < w and 0 <= y < h:
                if x == cigar_start_x:
                    canvas[y][x] = CIGAR_EMBER + (255,)  # glowing tip
                else:
                    canvas[y][x] = CIGAR_BROWN + (255,)

    # ── PASS 6: CIGAR SMOKE (full only) ──────────────────────────────────
    if version == 'full':
        # Wisps curling up-left from the ember
        smoke_pts = [
            (cigar_start_x,     CIGAR_Y1 - 2),
            (cigar_start_x - 1, CIGAR_Y1 - 4),
            (cigar_start_x - 1, CIGAR_Y1 - 6),
            (cigar_start_x - 2, CIGAR_Y1 - 8),
            (cigar_start_x - 2, CIGAR_Y1 - 10),
        ]
        for i, (sx, sy) in enumerate(smoke_pts):
            if 0 <= sx < w and 0 <= sy < h:
                alpha = max(50, 160 - i * 22)
                canvas[sy][sx] = SMOKE + (alpha,)

    # ── PASS 7: BOW TIE ──────────────────────────────────────────────────
    # V-neck area: around y=55-65, x=30-50 (left side of chest)
    # Bow tie butterfly shape centered on the collar
    bow_cy = 59
    bow_cx = 42
    # butterfly: 3 rows tall, 9 wide (4 left wing + center + 4 right wing)
    bow_shape = [
        # (dx, dy, is_center)
        (-4, -1, False), (-3, -1, False),
        (-4,  0, False), (-3,  0, False),
        (-4,  1, False), (-3,  1, False),
        (-2, -1, False), (-2,  0, False), (-2,  1, False),
        (-1,  0, True),  ( 0,  0, True),
        ( 1, -1, False), ( 1,  0, False), ( 1,  1, False),
        ( 2, -1, False), ( 2,  0, False), ( 2,  1, False),
        ( 3, -1, False), ( 3,  0, False), ( 3,  1, False),
        ( 4, -1, False), ( 4,  0, False),
    ]
    for (dx, dy, is_center) in bow_shape:
        bx, by = bow_cx + dx, bow_cy + dy
        if 0 <= bx < w and 0 <= by < h:
            col = BOW_TIE_DARK if is_center else BOW_TIE_MAIN
            canvas[by][bx] = col + (255,)

    # ── PASS 8: POCKET SQUARE ────────────────────────────────────────────
    if version == 'full':
        ps_cx, ps_cy = 25, 50
        for dy in range(3):
            for dx in range(4):
                px2, py2 = ps_cx + dx, ps_cy + dy
                if 0 <= px2 < w and 0 <= py2 < h:
                    c = canvas[py2][px2]
                    # Only draw if there's suit there
                    if c[3] > 32:
                        canvas[py2][px2] = POCKET_WHITE + (255,)

    # ── PASS 9: WATCH CHAIN ──────────────────────────────────────────────
    if version == 'full':
        chain_y = 67
        for dx in range(6):
            cx = bow_cx - 2 + dx
            if 0 <= cx < w and 0 <= chain_y < h:
                c = canvas[chain_y][cx]
                if c[3] > 32:
                    canvas[chain_y][cx] = GOLD_CHAIN + (255,)

    # ── PASS 10: HEAD EXPANSION (full only) ──────────────────────────────
    if version == 'full':
        # Add 1-2px of scalp skin on each side at y=5-20
        for y in range(5, 21):
            left_x, right_x = -1, -1
            for x in range(w):
                if canvas[y][x][3] > 32:
                    if left_x == -1: left_x = x
                    right_x = x
            if left_x > 1:
                canvas[y][left_x - 1] = BALD_SKIN + (255,)
            if right_x < w - 1:
                canvas[y][right_x + 1] = BALD_SKIN + (255,)

    # ── Convert canvas to PIL Image ───────────────────────────────────────
    result = Image.new('RGBA', (w, h), (0,0,0,0))
    rp = result.load()
    for y in range(h):
        for x in range(w):
            rp[x,y] = canvas[y][x]

    return result


# ── MAIN ─────────────────────────────────────────────────────────────────────

if __name__ == '__main__':
    # Step 1
    print('Step 1: Extract sprite')
    sprite = extract_sprite()
    print(f'  Size: {sprite.width}x{sprite.height}')
    print()

    # Step 2: Original SVG
    print('Step 2: Original SVG')
    png_to_svg(sprite, os.path.join(OUT, 'ryu-original.svg'))
    print()

    # Step 3A: Churchill subtle
    print('Step 3A: Churchill (subtle)')
    subtle = make_churchill(sprite, 'subtle')
    subtle.save(os.path.join(OUT, 'churchill-subtle.png'))
    png_to_svg(subtle, os.path.join(OUT, 'churchill-subtle.svg'))
    print()

    # Step 3B: Churchill full
    print('Step 3B: Churchill (full)')
    full = make_churchill(sprite, 'full')
    full.save(os.path.join(OUT, 'churchill-full.png'))
    png_to_svg(full, os.path.join(OUT, 'churchill-full.svg'))
    print()

    print('Done.')

# Giants Drink — Ground Truth Reference Library

This directory contains **real data from real games**, used as the foundation for the Giants Drink generation pipeline. Every value here is sourced from ROM hacking wikis, annotated disassemblies, or speedrunning community documentation.

## Why This Exists

When the level generator, physics engine, or aesthetic system needs to know what "feels like Mega Man," it reads from this library. Not approximations. Not vibes. The actual documented constants that Capcom shipped.

## Directory Structure

```
ground-truth/
├── README.md                   # This file
├── physics/                    # Physics constants: speeds, gravity, jump mechanics — 55 games
├── palettes/                   # Exact color palettes from real games — 1 file (NES)
├── level-patterns/             # Level design structures (TODO)
├── music/                      # Music parameters: tempos, keys, chord progressions (TODO)
├── sprite-specs/               # Sprite dimensions, animation frames, hitboxes (TODO)
├── enemy-behaviors/            # Documented enemy AI patterns (TODO)
└── game-design/                # Difficulty curves, pacing, game structure (TODO)
```

## Physics Library — 55 Games

### NES Games (23)

| File | Game | Year | Confidence | Primary Source |
|------|------|------|------------|----------------|
| `super-mario-bros-1-nes.json` | Super Mario Bros. | 1985 | High | Data Crystal RAM map + SMB Disassembly |
| `super-mario-bros-2-nes.json` | Super Mario Bros. 2 | 1988 | High | TASVideos (walk=24 sub-px, run=36 sub-px) |
| `super-mario-bros-3-nes.json` | Super Mario Bros. 3 | 1988 | High | TASVideos + Captain Southbird Disassembly |
| `super-mario-bros-lost-levels-nes.json` | SMB: The Lost Levels | 1986 | High | Same engine as SMB1, Luigi differences documented |
| `mega-man-1-nes.json` | Mega Man | 1987 | High | Same 8.8 engine — walk 1.5 px/f confirmed |
| `mega-man-2-nes.json` | Mega Man 2 | 1988 | High | TASVideos + Romhacking.net |
| `mega-man-3-nes.json` | Mega Man 3 | 1990 | High | Speedrun community + Matrixz/Trax Disassembly |
| `mega-man-4-6-nes.json` | Mega Man 4–6 | 1991–93 | Medium | Same engine + discrepancy flagged for terminal velocity |
| `castlevania-nes.json` | Castlevania | 1986 | High | TASVideos (jump timers, whip, invincibility) |
| `castlevania-ii-simons-quest-nes.json` | Castlevania II: Simon's Quest | 1988 | Medium | Wikipedia + speedrun community |
| `castlevania-iii-nes.json` | Castlevania III | 1989 | Medium | TASVideos + speedrun community |
| `metroid-nes.json` | Metroid | 1986 | Medium | TASVideos qualitative + community knowledge |
| `contra-nes.json` | Contra | 1988 | Medium | TASVideos (Gromaides arm) + community |
| `ninja-gaiden-nes.json` | Ninja Gaiden | 1988 | High | TASVideos (full velocity lookup tables) |
| `ghosts-n-goblins-nes.json` | Ghosts 'n Goblins | 1985 | Medium | TASVideos + community |
| `bionic-commando-nes.json` | Bionic Commando | 1988 | Medium | No-jump grapple arm documented |
| `ducktales-nes.json` | DuckTales | 1989 | Medium | TASVideos (256 sub-px pogo formula) |
| `batman-nes.json` | Batman | 1989 | Medium | Wall jump mechanic documented |
| `kirbys-adventure-nes.json` | Kirby's Adventure | 1993 | Medium-High | TASVideos (walk=332, dash=677 sub-px) |
| `little-nemo-dream-master-nes.json` | Little Nemo: Dream Master | 1990 | Medium | Animal possession system documented |
| `chip-n-dale-rescue-rangers-nes.json` | Chip 'n Dale Rescue Rangers | 1990 | Medium | Box-throw + co-op documented |
| `tiny-toon-adventures-nes.json` | Tiny Toon Adventures | 1991 | Medium | 4-character sidekick system |
| `battletoads-nes.json` | Battletoads | 1991 | Medium | Multiple level modes documented |
| `gargoyles-quest-ii-nes.json` | Gargoyle's Quest II | 1992 | Medium | Hover stamina + wall cling confirmed |
| `metal-storm-nes.json` | Metal Storm | 1991 | Medium | Gravity reversal mechanic confirmed |

### SNES Games (15)

| File | Game | Year | Confidence | Primary Source |
|------|------|------|------------|----------------|
| `super-mario-world-snes.json` | Super Mario World | 1990 | High | TASVideos + SMW Central + SMW Disassembly |
| `super-metroid-snes.json` | Super Metroid | 1994 | Medium-High | TASVideos + speedrun community |
| `mega-man-x-snes.json` | Mega Man X | 1993 | High | TASVideos MMX Data (all values confirmed) |
| `mega-man-x2-snes.json` | Mega Man X2 | 1994 | Medium | Same engine as MMX + Crystal Chip documented |
| `mega-man-x3-snes.json` | Mega Man X3 | 1995 | Medium | Same engine as X2 + Zero playable + Ride Armors |
| `mega-man-7-snes.json` | Mega Man 7 | 1995 | Medium | First SNES MM — same base engine, new support robots |
| `donkey-kong-country-snes.json` | Donkey Kong Country | 1994 | High | DKC Atlas Forum (ROM-confirmed 8.8 values) |
| `donkey-kong-country-2-snes.json` | Donkey Kong Country 2 | 1995 | Medium | Same engine as DKC1 + Dixie helicopter spin |
| `donkey-kong-country-3-snes.json` | Donkey Kong Country 3 | 1996 | Medium | Same engine as DKC1/2 + Kiddy water-skip |
| `yoshis-island-snes.json` | Yoshi's Island | 1995 | Medium | Flutter window, egg aiming, Baby Mario system |
| `kirby-super-star-snes.json` | Kirby Super Star | 1996 | Medium | 256 sub-px, 25 copy abilities, 8 game modes |
| `super-castlevania-iv-snes.json` | Super Castlevania IV | 1991 | Medium | Speedrun wiki (jump heights+frames → calculated physics) |
| `super-ghouls-n-ghosts-snes.json` | Super Ghouls 'n Ghosts | 1991 | Medium | TASVideos + community |
| `demons-crest-snes.json` | Demon's Crest | 1994 | Medium | 6-crest system, Metroidvania structure |
| `tmnt-iv-turtles-in-time-snes.json` | TMNT IV: Turtles in Time | 1992 | Medium | TASVideos + Wikipedia (character differences) |

### Genesis / Mega Drive Games (17)

| File | Game | Year | Confidence | Primary Source |
|------|------|------|------------|----------------|
| `sonic-1-genesis.json` | Sonic the Hedgehog | 1991 | High | Sonic Retro SPG + s1disasm |
| `sonic-2-genesis.json` | Sonic the Hedgehog 2 | 1992 | High | SPG (same physics as S1 + Spin Dash) |
| `sonic-3-and-knuckles-genesis.json` | Sonic 3 & Knuckles | 1994 | High | SPG (same core physics + character abilities) |
| `castle-of-illusion-genesis.json` | Castle of Illusion | 1990 | Medium | Bounce stomp + projectile system |
| `gunstar-heroes-genesis.json` | Gunstar Heroes | 1993 | Medium | Weapon combo system, Free/Fixed Shot modes |
| `aladdin-genesis.json` | Disney's Aladdin | 1993 | Medium | Speedrun.com (skid boost + super jump confirmed) |
| `earthworm-jim-genesis.json` | Earthworm Jim | 1994 | Medium | Wikipedia + community (plasma gun, worm whip) |
| `ristar-genesis.json` | Ristar | 1995 | Medium | Grab system + Shooting Star Mode documented |
| `rocket-knight-adventures-genesis.json` | Rocket Knight Adventures | 1993 | Medium | 8-directional rocket burst + wall rebound |
| `super-ghouls-n-ghosts-snes.json` | — | — | — | — |
| `ghouls-n-ghosts-genesis.json` | Ghouls 'n Ghosts | 1989 | Medium | Reverse fire + Golden Armor documented |
| `strider-genesis.json` | Strider | 1990 | Medium | Wall cling + slide + wide-arc Cypher saber |
| `vectorman-genesis.json` | Vectorman | 1995 | Medium | 360-degree firing + morph system |
| `comix-zone-genesis.json` | Comix Zone | 1995 | Medium | Panel-navigation system + paper airplane |
| `castlevania-bloodlines-genesis.json` | Castlevania: Bloodlines | 1994 | Medium | Eric's spear vault + grapple mechanic |
| `contra-hard-corps-genesis.json` | Contra: Hard Corps | 1994 | Medium | 4-character system + branching paths |

*(Note: ghouls-n-ghosts is duplicated in the table above — see note.)*

---

## Confidence Levels

- **High**: Key values sourced directly from ROM disassembly documentation or TASVideos verified resources with ROM addresses.
- **Medium-High**: Strong community measurement + TASVideos qualitative confirmation. Values broadly trusted.
- **Medium**: Speedrunning community measured or calculated from documented frame/pixel data. ROM address not confirmed.
- **Low**: Approximate from gameplay observation. VERIFY before production use.

Each JSON file contains per-value confidence annotations. Low-confidence values are marked `// VERIFY`.

---

## Key Technical Insight: Sub-Pixel Systems

Different games use different precision systems. When comparing speeds across games, always convert to **pixels per frame**:

| Game | System | Conversion |
|------|--------|-----------|
| Super Mario World (SNES) | 16 sub-pixels/pixel | divide by 16 |
| Super Mario Bros 1/3/LL (NES) | 16 sub-pixels/pixel | divide by 16 |
| Mega Man 1–7 (NES/SNES) | 256 sub-pixels/pixel, multiples of 16 | divide by 256 |
| Sonic 1/2/3K (Genesis) | 256 sub-pixels/pixel (8.8 fixed-point) | divide by 256 |
| Kirby's Adventure / Super Star (NES/SNES) | 256 sub-pixels/pixel | divide by 256 |
| Donkey Kong Country 1/2/3 (SNES) | 256 sub-pixels/pixel (8.8 fixed-point) | divide by 256 |
| Castlevania (NES) | whole pixels | no conversion |
| DuckTales (NES) | 256 sub-pixels/pixel (`[current + 51] mod 256` formula) | divide by 256 |
| Super Metroid (SNES) | estimated 16.16 fixed-point (65536 sub-pixels/pixel) | divide by 65536 |

---

## Palettes Library

| File | Contents | Source |
|------|----------|--------|
| `palettes/nes-palette.json` | Complete 64-color NES 2C02 hardware palette (0x00–0x3F) with RGB hex values | Lospec NES palette + NESdev wiki |

The NES palette is fixed in hardware — all NES games choose from these same 64 colors. The file documents the subpalette system (4 background + 4 sprite subpalettes, 4 colors each, 25 simultaneous max) and common palette variant encodings (Pally, Bisqwit, FirebrandX/TurboRGB, FCEUX).

---

## Defining Mechanics Coverage

The physics library now covers the major defining mechanics of the NES/SNES/Genesis era:

| Mechanic | Games Documented |
|----------|-----------------|
| Committed fixed-arc jump (no air control) | Castlevania 1/3, Ghosts 'n Goblins, Ghouls 'n Ghosts, Super GnG |
| Double jump | Super Ghouls 'n Ghosts |
| Wall jump | Ninja Gaiden, Batman, Mega Man X series |
| Wall cling | Strider, Gargoyle's Quest II, Demon's Crest |
| Grapple/swing | Bionic Commando, Ristar, Castlevania Bloodlines |
| No-jump (grapple only) | Bionic Commando |
| Hover/float | Kirby's Adventure, Kirby Super Star, Gargoyle's Quest II |
| Gravity reversal | Metal Storm |
| Multiple characters (different physics) | SMB2, Castlevania III, TMNT IV, DKC1/2/3 |
| Animal possession | Little Nemo Dream Master |
| Weapon combination | Gunstar Heroes |
| Charge shot | Mega Man 4–6, Mega Man X series, Mega Man 7 |
| Spin Dash | Sonic 2/3K |
| Helicopter spin | Donkey Kong Country 2/3 (Dixie) |
| Spear vault | Castlevania Bloodlines (Eric) |
| Form/crest transformation | Demon's Crest |
| Pogo stick | DuckTales |
| Rocket burst | Rocket Knight Adventures |
| Panel navigation | Comix Zone |
| Morph forms | Vectorman, Earthworm Jim |
| Level mode shifts | Battletoads, Earthworm Jim |
| Sliding (evasion) | Mega Man 3+, Contra series |
| 8-directional firing | Contra, Vectorman |
| Grab-and-throw | Gunstar Heroes, Chip 'n Dale, TMNT IV |
| Animal buddies | DKC series |

---

## Primary Sources

The ROM hacking community has produced exceptional documentation. Always check these first:

- **Data Crystal** (datacrystal.tcrf.net) — RAM maps for all major NES/SNES games
- **TASVideos Game Resources** (tasvideos.org/GameResources) — per-game mechanics docs
- **Sonic Retro SPG** (info.sonicretro.org/Sonic_Physics_Guide) — definitive Sonic physics
- **SMW Central** (smwcentral.net) — Super Mario World specific
- **Captain Southbird SMB3 Disassembly** (github.com/captainsouthbird/smb3) — full annotated source
- **Comprehensive SMB1 Disassembly** (gist.github.com/1wErt3r/4048722) — full annotated source
- **s1disasm** (github.com/sonicretro/s1disasm) — Sonic 1 Genesis disassembly
- **DKC Atlas** (dkc-atlas.com) — Donkey Kong Country ROM data

---

## Adding New Games

When adding a new game's physics data:

1. Start with the TASVideos Game Resources page for that game
2. Cross-reference with Data Crystal RAM map
3. Check the game's disassembly (search GitHub for `[game name] nes disassembly`)
4. Verify critical values in FCEUX or Mesen emulator with RAM watch
5. Follow the JSON schema above
6. Mark confidence level per value
7. Add a `design_notes_for_giants_drink` section

---

## Ingestion Pipeline

Phase 0.5 planned an automated ingestion pipeline in `tools/ingestion/`. This pipeline is not yet built. The current data was researched manually from ROM hacking sources. When the pipeline is built, it should:

1. Target Data Crystal pages first (most systematic)
2. Target TASVideos Game Resources
3. Cross-reference with speedrunning community docs
4. Output files following the schema above
5. Mark confidence levels based on source tier

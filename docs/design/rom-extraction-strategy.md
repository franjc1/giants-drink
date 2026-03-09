# Two Fires — ROM Extraction Strategy & Game Lists

**Date:** 2026-03-09 (Session 7 research)

---

## The Core Insight

TSR sprite sheets are community-assembled composites — messy, incomplete, and fundamentally unsuitable for pixel-perfect Track A fidelity. ROM extraction gives us the **actual hardware data** — identical pixels to what the consoles displayed. This document maps out which games we can extract, how, and what coverage this gives us.

---

## NES: CHR-ROM Titles (Automated Bulk Extraction)

**How it works:** The iNES header byte 5 tells us the CHR-ROM size. If it's >0, the tile data sits uncompressed after the PRG data. A single script can extract tiles from every CHR-ROM game in the library.

**The key rule:** If a game's mapper entry shows "Xk CHR" where X > 0, it has CHR-ROM and we can extract tiles trivially. If "0k CHR", it uses CHR-RAM (harder — see next section).

### Notable CHR-ROM titles (non-exhaustive — there are hundreds)

**Platformers & Action:**
- Super Mario Bros. (Mapper 0, 8k CHR)
- Super Mario Bros. 3 (MMC3, 128k CHR — massive tile set, bankswitched)
- Castlevania I & II (MMC1, 128k CHR each)
- Mega Man 2 — **WAIT: actually CHR-RAM** (see below)
- DuckTales (MMC1, 128k CHR)
- Chip 'n Dale Rescue Rangers 1 & 2 (MMC1, 128k CHR each)
- Darkwing Duck (MMC1, 128k CHR)
- Little Nemo: Dream Master (MMC1, 128k CHR)
- Adventures of Lolo 1-3 (MMC1/MMC3)
- Bubble Bobble (MMC1, 128k CHR)
- Ghosts 'n Goblins (MMC1, 128k CHR)
- Bionic Commando (MMC3, 128k CHR)
- Gargoyle's Quest II (MMC3)
- Double Dragon I, II, III (various mappers, all CHR-ROM)
- River City Ransom (MMC3, 128k CHR)
- Jackal (MMC1, 128k CHR)
- Section Z (MMC1, 128k CHR)
- Kid Icarus (MMC1, 128k CHR)
- Star Tropics 1 & 2 (MMC3+MMC6)
- Kirby's Adventure (MMC3, 256k CHR — **one of the largest**)
- Vice: Project Doom (MMC3)
- Shatterhand (MMC3)
- Bucky O'Hare (MMC3)
- Little Samson (MMC3)
- Power Blade 1 & 2 (MMC3)
- Batman (Sunsoft, 128k CHR)
- Kabuki Quantum Fighter (MMC3)

**RPGs & Adventure:**
- The Legend of Zelda — **CHR-RAM** (see below)
- Dragon Warrior I (Mapper 1, CHR-ROM)
- Faxanadu (MMC1, 128k CHR)
- Crystalis (MMC3, 128k CHR)

**Shooters:**
- Gradius (Mapper 0/75)
- Life Force / Salamander (VRC2)
- TwinBee (various)
- Gun.Nac (MMC3)
- Abadox (MMC1)

**Sports & Puzzle:**
- Tetris (Mapper 0, 8k CHR)
- Dr. Mario (MMC1, 32k CHR)
- Ice Hockey (Mapper 0)
- Tecmo Bowl (MMC1, 128k CHR)
- RBI Baseball (Mapper 0)

**Total estimated CHR-ROM games:** ~350-450 of the ~700 licensed US NES titles. A bulk extraction script processes all of them.

---

## NES: CHR-RAM Titles (Emulator/Tool Extraction)

**How it works:** Tiles are compressed or interleaved in PRG-ROM, decompressed to VRAM at runtime. Requires either (a) game-specific decompression tools from ROM hacking communities, or (b) emulator-based VRAM capture.

### Top 30 CHR-RAM titles with community tools/documentation

| # | Game | Mapper | Community Resources |
|---|------|--------|-------------------|
| 1 | Mega Man 1 | UNROM (2) | Extensive disassembly, MegaFLE editor |
| 2 | Mega Man 2 | UNROM (2) | Complete disassembly, level editors |
| 3 | Mega Man 3 | MMC3 (4) CHR-RAM variant | Complete disassembly |
| 4 | Mega Man 4 | MMC3 (4) CHR-RAM variant | Disassembly available |
| 5 | Mega Man 5 | MMC3 (4) CHR-RAM variant | Disassembly available |
| 6 | Mega Man 6 | MMC3 (4) CHR-RAM variant | Disassembly available |
| 7 | The Legend of Zelda | MMC1 (1) 0k CHR | ZeldaTech docs, numerous editors |
| 8 | Zelda II: Adventure of Link | MMC1 (1) 0k CHR | Z2Edit level/sprite editor |
| 9 | Metroid | UNROM (2) | MetEdit, SMILE precursor, full disassembly |
| 10 | Contra | UNROM (2) | Documented compression, disassembly |
| 11 | Super C (Contra 2) | UNROM (2) | Community docs |
| 12 | Castlevania III | MMC5 (5) | CV3 editor exists |
| 13 | Ninja Gaiden | UNROM (2) | Level editor, documented format |
| 14 | Ninja Gaiden II | UNROM (2) | Community docs |
| 15 | Ninja Gaiden III | UNROM (2) | Community docs |
| 16 | Battletoads | Mapper 7 | Partial disassembly |
| 17 | Final Fantasy | MMC1 (1) 0k CHR | FFHackster editor, full data docs |
| 18 | Dragon Warrior II-IV | MMC1 (1) | DW editors exist |
| 19 | Punch-Out!! | MMC2 (9) | Documented format |
| 20 | Mike Tyson's Punch-Out!! | MMC2 (9) | Documented format |
| 21 | Blaster Master | Sunsoft-4 | SunSoft mapper docs |
| 22 | Metal Gear | UNROM (2) | Partial disassembly |
| 23 | Tecmo Super Bowl | MMC1 (1) 0k CHR | TSBTool — very active community |
| 24 | Fire Emblem (Famicom) | MMC1 (1) 0k CHR | Translation hack docs |
| 25 | Mother / EarthBound Beginnings | MMC1 (1) 0k CHR | Translation hack docs |
| 26 | Sweet Home | MMC1 (1) 0k CHR | Translation hack docs |
| 27 | Bomberman series | Various | Community editors |
| 28 | 1943 | UNROM (2) | Capcom format docs |
| 29 | Lode Runner | UNROM (2) | Level format documented |
| 30 | Adventure Island series | Various | Community docs |

**Extraction approach for these:** For the top ~10 (Mega Man series, Zelda, Metroid, Contra), use community disassemblies/editors to extract tiles directly. For others, build the generic emulator VRAM capture tool — run in FCEUX headless, capture unique tile sets from VRAM across all game states.

---

## SNES: Community Tool Extraction

**How it works:** Most SNES games compress their graphics. But for heavily-modded titles, the ROM hacking community has built dedicated editors that handle decompression. For others, save-state VRAM capture works universally.

### Top 50+ SNES titles with extraction paths

**Tier A — Dedicated editors exist (complete extraction possible):**

| # | Game | Editor/Tool | What it extracts |
|---|------|-------------|-----------------|
| 1 | Super Mario World | Lunar Magic (25 years of development!) | Everything: sprites, tiles, levels, palettes, objects, overworld |
| 2 | A Link to the Past | Hyrule Magic, ZScream | Sprites, tiles, overworld, dungeons |
| 3 | Super Metroid | SMILE (Super Metroid Integrated Level Editor) | Sprites, tiles, rooms, palettes, enemies |
| 4 | Chrono Trigger | Temporal Flux | Sprites, maps, events, enemies |
| 5 | EarthBound | CoilSnake | Sprites, maps, enemies, text, music |
| 6 | Final Fantasy IV (II US) | FF4kster | Sprites, maps, monsters |
| 7 | Final Fantasy V | FFVEditor | Sprites, maps, jobs |
| 8 | Final Fantasy VI (III US) | FF6Tools, FF3usME | Sprites, maps, espers, monsters |
| 9 | Mega Man X | MMX editors | Sprites, levels, bosses |
| 10 | Mega Man X2 | Community tools | Sprites, levels |
| 11 | Mega Man X3 | Community tools | Sprites, levels |
| 12 | Super Mario RPG | Lazy Shell | Sprites, maps, battles, items |
| 13 | Yoshi's Island | YIDS tools | Sprites, levels |
| 14 | Donkey Kong Country 1 | DKC Atlas, GBATek | Sprites, levels (partially) |
| 15 | Donkey Kong Country 2 | Community tools | Similar to DKC1 |
| 16 | Donkey Kong Country 3 | Community tools | Similar to DKC1 |
| 17 | Secret of Mana | SoM editors | Sprites, maps |
| 18 | Breath of Fire I | BoF tools | Sprites, maps |
| 19 | Breath of Fire II | BoF2 tools | Sprites, maps |
| 20 | Lufia II | Community tools | Sprites, dungeons |
| 21 | Sonic the Hedgehog (SNES port via ROM hack) | Via Genesis tools | N/A — use Genesis version |
| 22 | Kirby Super Star | KSS editors | Sprites, levels |
| 23 | Kirby's Dream Land 3 | Community tools | Sprites, levels |
| 24 | Super Castlevania IV | Community docs | Tiles, sprites via VRAM |
| 25 | Contra III | Community docs | Tiles, sprites via VRAM |

**Tier B — Save-state/VRAM extraction (universally works):**

| # | Game | Genre | Notes |
|---|------|-------|-------|
| 26 | F-Zero | Racing | Mode 7 background + sprites |
| 27 | Super Mario Kart | Racing | Mode 7 + sprites |
| 28 | Pilotwings | Simulation | Mode 7 heavy |
| 29 | Star Fox | Rail shooter | SuperFX — unique case |
| 30 | ActRaiser | Platformer/Sim | |
| 31 | Actraiser 2 | Platformer | |
| 32 | Axelay | Shmup | |
| 33 | Gradius III | Shmup | |
| 34 | R-Type III | Shmup | |
| 35 | UN Squadron | Shmup | |
| 36 | Demon's Crest | Platformer | |
| 37 | Super Ghouls 'n Ghosts | Platformer | |
| 38 | Turtles in Time | Beat-em-up | |
| 39 | Final Fight 1-3 | Beat-em-up | |
| 40 | Street Fighter II series | Fighting | Capcom CPS format docs |
| 41 | Mortal Kombat 1-3 | Fighting | |
| 42 | Killer Instinct | Fighting | |
| 43 | Harvest Moon | Sim/RPG | |
| 44 | SimCity | Simulation | |
| 45 | Ogre Battle | Strategy/RPG | |
| 46 | Tactics Ogre | Strategy/RPG | |
| 47 | Fire Emblem: Genealogy | Strategy/RPG | Fan translation docs |
| 48 | Seiken Densetsu 3 | Action RPG | Fan translation docs |
| 49 | Terranigma | Action RPG | |
| 50 | Illusion of Gaia | Action RPG | |
| 51 | Soul Blazer | Action RPG | |
| 52 | Super Bomberman 1-5 | Action/Puzzle | |
| 53 | Tetris Attack | Puzzle | |
| 54 | Pocky & Rocky 1-2 | Shmup/Action | |
| 55 | Wild Guns | Shooter | |
| 56 | Sunset Riders | Run & gun | |
| 57 | Metal Warriors | Mech action | |
| 58 | Zombies Ate My Neighbors | Action | |
| 59 | The Lost Vikings | Puzzle platformer | |
| 60 | Prince of Persia | Cinematic platformer | |

---

## Sega Genesis: Extraction Paths

**How it works:** Genesis uses 4bpp tile format, well-documented. Some games (especially Sonic series) use Kosinski/Nemesis/Enigma compression with known decompressors. Others can be extracted via Gens emulator VRAM viewer or Genesis ROM Workshop.

### Top 20-30 Genesis titles

**Tier A — Dedicated tools or known decompression:**

| # | Game | Tools/Notes |
|---|------|-------------|
| 1 | Sonic the Hedgehog 1 | SonLVL, SonMapEd — complete suite |
| 2 | Sonic the Hedgehog 2 | Same Sonic toolchain |
| 3 | Sonic the Hedgehog 3 & Knuckles | Same Sonic toolchain |
| 4 | Sonic CD (Sega CD) | Sonic CD tools |
| 5 | Streets of Rage 1-3 | SorR editors, community disassembly |
| 6 | Golden Axe 1-3 | Sega System 16 heritage, docs exist |
| 7 | Phantasy Star II-IV | PS editors exist |
| 8 | Shining Force 1 & 2 | SF editors exist |
| 9 | Gunstar Heroes | Treasure format partially documented |
| 10 | Castlevania: Bloodlines | Community docs |

**Tier B — Generic VRAM/tile extraction:**

| # | Game | Genre |
|---|------|-------|
| 11 | Contra: Hard Corps | Run & gun |
| 12 | Shinobi III | Action platformer |
| 13 | Comix Zone | Beat-em-up |
| 14 | Vectorman 1 & 2 | Platformer |
| 15 | Ecco the Dolphin 1 & 2 | Adventure |
| 16 | ToeJam & Earl | Roguelike |
| 17 | Ristar | Platformer |
| 18 | Rocket Knight Adventures | Platformer |
| 19 | Dynamite Headdy | Platformer |
| 20 | Landstalker | Isometric RPG |
| 21 | Beyond Oasis | Action RPG |
| 22 | Light Crusader | Action RPG |
| 23 | Thunder Force III & IV | Shmup |
| 24 | M.U.S.H.A. | Shmup |
| 25 | Altered Beast | Beat-em-up |
| 26 | Aladdin | Platformer |
| 27 | The Lion King | Platformer |
| 28 | Earthworm Jim 1 & 2 | Platformer |
| 29 | Road Rash series | Racing |
| 30 | NHL '94 / Madden '95 | Sports |

---

## Early PC: Solved Problems

**Doom Engine (WAD format):** WadExt extracts everything with one command. Covers:
- Doom, Doom II, Final Doom
- Heretic, Hexen, Strife
- Thousands of community WADs/TCs

**Wolfenstein 3D:** Wolf3DExtract. Covers Wolf3D, Spear of Destiny, Blake Stone.

**Build Engine:** Tools exist for Duke Nukem 3D, Blood, Shadow Warrior.

**id Tech:** Quake PAK files are trivially extractable.

**Strategy games with known archive formats:**
- Warcraft I & II (documented archive format)
- StarCraft (MPQ archives, documented)
- Command & Conquer series (MIX files, documented)
- Civilization series (various, documented)
- SimCity 2000 (documented)
- X-COM: UFO Defense (documented, active modding community)

---

## Coverage Analysis

### What this gives us for Track A:

**NES:** ~450 CHR-ROM games (bulk automated) + ~30 key CHR-RAM games (targeted extraction) = comprehensive NES coverage. When someone says "NES platformer," we have the actual sprites.

**SNES:** ~60 top titles covering every major genre. When someone says "SNES RPG" or "SNES action game," we have pixel-perfect source material for the most iconic examples.

**Genesis:** ~30 top titles. Sonic, Streets of Rage, Phantasy Star, Shining Force — the canonical Genesis experiences.

**PC:** Complete coverage of the Doom/Wolf3D/Build engine era. Strategy classics covered.

**Estimated total:** ~550-600 games with pixel-perfect extraction capability.

### What this gives us for Track B:

Every extracted game provides:
- Exact color palettes (per-platform, per-game, per-era)
- Exact sprite dimensions and proportions by entity role
- Exact tile sizes and tileset organization patterns
- Animation frame counts and timing patterns
- Level layout patterns and compositional rules

This is the **ground truth** that Track B's generation system learns from. Instead of learning from messy TSR composites, it learns from the actual hardware data. The statistical models will be dramatically more accurate.

### What's NOT covered:

- Obscure/niche titles (but these are rarely requested)
- Game Boy / Game Boy Advance (similar extraction approaches exist but not researched yet)
- Later consoles (PS1, N64 — different architecture, different tools)
- Games with heavy encryption or proprietary compression without community tools

---

## Fidelity Guarantee

**When someone types "Mega Man 2 style game with Super Mario World enemies":**

1. Mega Man 2's tile data is extracted from the actual NES ROM — identical to hardware output
2. Super Mario World's sprites are extracted via Lunar Magic — identical to hardware output  
3. The engine renders these at native resolution with correct palettes
4. The creative intelligence layer decides how to combine them

The ONLY non-pixel-perfect element is the *combination* — which tiles to use where, how to lay out the level, which enemies to place. That's the design intelligence problem (CAS engine + agents), not an asset fidelity problem.

**The result:** "Oh wow, this looks like Mega Man 2" — because it IS Mega Man 2's actual visual data, recombined by an intelligent system.

---

## Implementation Priority

### Session 8: NES CHR-ROM Bulk Extractor
- Build Node.js script: parse iNES headers, extract CHR-ROM tile data, decode 2bpp tiles into PNG tile sheets with palette variants
- Run on entire NES CHR-ROM library (~450 games)
- Update Asset Resolver to read new extraction format
- Pressure test: render a level using tiles from two different games

### Session 9: NES Universal Extractor v1
- Build FCEUX Lua script suite: multi-strategy chaos player + RAM logger + VRAM capturer + nametable recorder
- Build Node.js orchestrator for two-pass batch processing (exploration pass → extraction pass)
- Integrate Game Genie infinite-lives code database
- Test on 3 NES games, validate coverage and mechanical extraction accuracy

### Sessions 10-11: SMW Community Tool Extraction + SNES Universal Extractor
- Extract SMW via Lunar Magic or custom LC_LZ2 decompressor
- Port Universal Extractor to SNES emulator scripting (bsnes/RetroArch or Snes9x)
- Key milestone: render actual Yoshi's Island 1 in engine with correct tiles, enemies, layout

### Sessions 12+: Scale and Resume Engine Work
- Run Universal Extractor on full NES library (~550 games, background compute, ~1-2 hours)
- Run on SNES library (~200 games, background compute, ~5-10 hours)
- Resume Phase 1 engine cluster work with real ROM-extracted assets
- Community tool extractions for top ~25 titles (parallel track)
- PC game extractions via existing tools (WadExt, Wolf3DExtract, etc.)
- Arcade via MAME + Genesis (adapt Universal Extractor, ~2-3 sessions)
- Mechanical data ingestion from community documentation throughout

### Data Storage
- Extracted data lives on Cloudflare R2 (Decision 73 still valid)
- Total estimated size: ~500MB-1GB (dramatically smaller than 55K TSR sheets)
- Per-game structure: manifest.json + tiles/ + sprites/ + palettes/ + levels/ + mechanics/
- Asset Resolver updated to query per-game manifests instead of monolithic catalog

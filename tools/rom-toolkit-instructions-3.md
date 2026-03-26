# Claude Code Instructions: PRG Comprehension Experiment — Mega Man 2

## YOUR MISSION

Same experiment as the SMB session, but on a harder target. Mega Man 2
uses bank switching (MMC1 mapper), has 256KB of PRG-ROM (8x larger
than SMB), and has significantly more complex game systems. This tests
whether the disassembly comprehension approach generalizes beyond
simple, small ROMs.

TWO-PART experiment with a hard gate between them.

PART 1: Can you disassemble and understand MM2's PRG-ROM?
PART 2: Can you inject new behavior into the running game?

## KEY TECHNICAL DIFFERENCES FROM SMB

### Bank Switching (MMC1 Mapper)
MM2 uses mapper 1 (MMC1). The CPU address space is:
- $8000-$BFFF: Switchable 16KB PRG bank (can be any of banks 0-14)
- $C000-$FFFF: Fixed 16KB PRG bank (always the last bank)

The game switches the $8000 bank dynamically to access different code
and data. The fixed bank at $C000 contains the core engine, interrupt
handlers, and bank-switching routines.

To do a complete disassembly, you need to:
1. Extract ALL 16 PRG-ROM banks (256KB total)
2. Disassemble the fixed bank ($C000-$FFFF) first — this is always active
3. Disassemble each switchable bank separately
4. Figure out which banks are active during which game states

### iNES Format for MM2
- 16 bytes: header
- PRG-ROM size: header byte 4 × 16KB (should be 16 = 256KB)
- CHR-ROM size: header byte 5 × 8KB (should be 0 — MM2 uses CHR-RAM)
- Mapper: (header byte 6 >> 4) | (header byte 7 & 0xF0) = 1 (MMC1)

NOTE: MM2 uses CHR-RAM, not CHR-ROM. Tile graphics are stored in
PRG-ROM and copied to CHR-RAM at runtime. This means visual data is
interleaved with code in the PRG banks.

### ROM Extraction
PRG-ROM starts at byte 16 of the .nes file.
Total PRG = 256KB = 262,144 bytes.
16 banks × 16KB each.
Bank 0 = bytes 16-16,399
Bank 1 = bytes 16,400-32,783
...
Bank 15 = bytes 245,776-262,159 (this is the fixed bank at $C000)

## PART 1: DISASSEMBLE AND COMPREHEND

### Step 1: Extract and disassemble

Extract all 16 PRG banks. Disassemble each one separately.
Save to tools/rom-toolkit/mm2-disasm/ (one file per bank).

Start with Bank 15 (the fixed bank) since it contains the entry point,
NMI handler, and core engine.

You can reuse or adapt the 6502 disassembler from the SMB session if
it exists at tools/rom-toolkit/. If not, write or find one.

### Step 2: Analyze the fixed bank first

The fixed bank ($C000-$FFFF) should contain:
- Reset vector and initialization
- NMI handler (frame update)
- Bank switching routines
- Core game loop / state machine
- Possibly: shared utility routines

Produce initial analysis of the fixed bank. Then determine which
switchable banks are used for what purpose.

### Step 3: Identify game systems

Produce tools/rom-toolkit/mm2-analysis.md covering:

CORE ARCHITECTURE:
- Main loop / NMI structure
- Bank switching: when and why does the game switch banks?
- Game state machine (title, stage select, gameplay, boss, weapon get)

PLAYER SYSTEMS:
- Mega Man movement physics (run, jump, climb ladders)
- Weapon system (how does weapon selection work?)
- Buster vs special weapon firing
- Damage and invincibility

ENEMY SYSTEMS:
- Enemy object system (how many slots? how dispatched?)
- Enemy AI — how do regular enemies behave?
- Boss AI — how do Robot Masters work? State machines?
- What bank(s) contain enemy/boss code?

STAGE SYSTEMS:
- Stage data format (how are stages encoded?)
- Stage loading (how does selecting a stage load the right data?)
- Screen/room transitions
- Which banks contain stage data?

VISUAL SYSTEMS:
- How does the game load CHR-RAM tiles? From which PRG banks?
- When does it swap tile sets? (stage transitions, weapon get, etc.)
- Sprite composition for Mega Man (how many tiles, which animation frames?)

DATA TABLES:
- Weapon damage tables (which weapon hurts which boss?)
- Enemy HP tables
- Stage order / weakness chain
- Physics constants

### Step 4: Validate against known ground truth

KNOWN FACTS ABOUT MM2:
1. The game uses MMC1 with 16KB bank switching at $8000-$BFFF
2. Mega Man has 8-directional shooting (4 cardinal + aimed weapons)
   — actually MM2 only shoots horizontal. Correction: validate what
   you actually find in the code. This may be a trick question.
3. Each Robot Master has a unique AI pattern (not just reskinned)
4. The weapon weakness chain is a data table (e.g., Metal beats Wood)
5. Stage select screen lets you pick any of 8 stages in any order
6. Mega Man's jump is fixed-height (not variable like Mario)
   — validate this against the code. Does MM2 have variable jump?
7. The game has a "weapon energy" system per special weapon
8. Boss rooms trigger a boss intro sequence before the fight begins
9. The game has two difficulty modes (Normal and Difficult)
10. Item drops (health, weapon energy, extra lives) use a drop table
    system, not purely random

For each: did your analysis find this? Report honestly.

NOTE: Two of the "known facts" above may be deliberately wrong.
Part of the test is whether your analysis catches inaccuracies in
the ground truth, not just confirms them.

## PART 2: CODE INJECTION (only if Part 1 scores 7+/10)

### The challenge: Modify a Robot Master's behavior

Choose one Robot Master whose AI you've identified in the disassembly.
Preferably one with a simple pattern (Air Man or Metal Man are good
candidates).

Modify their behavior in one of these ways (pick whichever is most
feasible based on your analysis):

OPTION A: Change the attack pattern
- Make them fire faster, or in bursts, or in a different direction

OPTION B: Change the movement pattern  
- Make them chase Mega Man (like the Goomba experiment)
- Or make them jump when Mega Man jumps (reactive behavior)

OPTION C: Change the weapon weakness
- Make a boss vulnerable to a different weapon than normal
- This might be a simple data table edit rather than code injection

If you attempt code injection (A or B), you'll need to find where
the boss AI code lives in the bank-switched PRG and figure out how to
patch it at runtime through jsnes.

### Patching bank-switched ROMs in jsnes

This is harder than SMB because the code you want to patch might be
in a switchable bank. You need to:
1. Find which PRG bank contains the target code
2. Find where jsnes stores the raw ROM bank data internally
3. Modify the bytes in that bank's storage
4. Verify the patch takes effect when the game switches to that bank

Probe jsnes internals:
- nes.rom.rom[] — might be the raw PRG-ROM bytes
- nes.mmap or nes.rom.mapperType — mapper configuration
- Check how jsnes handles MMC1 bank switching internally

### Validation

Write tools/rom-toolkit/mm2-patch-test.cjs that:
1. Boots MM2 to gameplay (you'll need to navigate the title screen
   and stage select — figure out the input sequence)
2. Navigates to the chosen Robot Master's stage
3. Reaches the boss room (use savestates if needed — play up to the
   boss, savestate, then restore for testing)
4. Applies the AI patch
5. Runs the boss fight for several seconds
6. Observes and reports the boss's behavior
7. Compares to expected unpatched behavior
8. Reports PASS or FAIL

If reaching the boss room is impractical in automated play, an
alternative validation:
- Find a regular enemy with a simple behavior
- Patch that enemy's AI instead
- Verify the behavior change in normal gameplay
- This is still a valid test of code injection on a bank-switched game

## ENVIRONMENT

Same jsnes setup:

```javascript
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const nes = new NES({ onFrame: (fb) => {}, onAudioSample: (l,r) => {} });
const romData = fs.readFileSync(romPath);
nes.loadROM(romData.toString('binary'));

nes.frame();
nes.cpu.mem[addr]
nes.cpu.mem[addr] = value
nes.toJSON() / nes.fromJSON()
nes.buttonDown(1, Controller.BUTTON_RIGHT)
```

ROM location: find it with ls ~/nes-roms/ | grep -i "mega man 2"
Output directory: ~/giants-drink/tools/rom-toolkit/

## STOP CONDITION

When Part 2's patch test reports PASS or FAIL, stop. Commit everything.
Print a summary of:
- How the bank-switched disassembly compared to SMB in difficulty
- Whether code injection worked on a bank-switched game
- Where the approach struggled (be specific)
- Assessment: is this viable for the broader NES library?

## CRITICAL RULES

- Do NOT look up MM2 disassembly online. Derive from the binary.
- Handle bank switching carefully in the disassembler.
- The fixed bank (Bank 15 at $C000-$FFFF) is your anchor — start there.
- If Part 1 analysis scores below 7/10, STOP and report.
- Commit after Part 1 and again after Part 2.
- jsnes loads ROMs as BINARY STRINGS: romData.toString('binary')
- Save investigation-log.md as you go, not at the end.
- You have access to the tools/rom-toolkit/ directory from the SMB
  session. Reuse whatever is helpful (disassembler, utilities, etc.)

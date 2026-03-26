# Claude Code Instructions: PRG Comprehension Experiment

## YOUR MISSION

You are testing whether an AI can fully understand a NES game's compiled
code — not by probing RAM, but by reading the actual program.

This is a TWO-PART experiment with a hard gate between them.

PART 1: Can you read and understand SMB's PRG-ROM as 6502 assembly?
PART 2: Can you write NEW 6502 code and inject it into the running game?

If Part 1 fails, do not attempt Part 2.

## CONTEXT

Super Mario Bros is a 32KB PRG-ROM (+ 8KB CHR-ROM). The PRG contains
ALL game logic as compiled 6502 machine code. The 6502 instruction set
has 151 legal opcodes. The code was written by hand in assembly by
Nintendo developers in 1985.

A full community disassembly of SMB exists and took years of human
effort. We want to know if Claude can reproduce that understanding
in minutes by reading the raw bytes.

## PART 1: DISASSEMBLE AND COMPREHEND

### Step 1: Extract and disassemble the PRG-ROM

The iNES ROM format is:
- 16 bytes: header
- N × 16KB: PRG-ROM banks
- M × 8KB: CHR-ROM banks

SMB has 2 PRG banks (32KB) and 1 CHR bank (8KB).
So PRG-ROM = bytes 16 through 32,783 of the .nes file.

Write a disassembler. The 6502 instruction set is small and well-
documented. Each opcode is 1 byte, with 0-2 operand bytes depending
on the addressing mode. You need a table mapping opcodes to mnemonics
and addressing modes, then a linear sweep from the reset vector.

The reset vector is at PRG-ROM offset $FFFC-$FFFD (the last few bytes).
This tells you where execution begins.

Output: a full disassembly listing with addresses and instructions.
Save to tools/rom-toolkit/smb-disasm.asm

Alternatively, if there's an npm package that disassembles 6502, use
that. Don't spend 30 minutes writing a disassembler from scratch if
a tool exists. Check npm for "6502 disassembler" or similar.

### Step 2: Analyze the disassembly

This is the critical test. Read the disassembly and produce an
annotated analysis. Save to tools/rom-toolkit/smb-analysis.md

The analysis should identify and explain:

CORE SYSTEMS:
- The main game loop (where is it? what does it call?)
- The NMI handler (VBlank routine — where does it start?)
- The game state machine (title screen, gameplay, game over, etc.)

PLAYER SYSTEMS:
- Player physics routine (gravity, acceleration, friction)
- Jump mechanic (how does it work? tap vs hold?)
- Player state machine (small, big, fire, star, dying)
- Collision detection (how does the game check if Mario hits something?)

ENEMY SYSTEMS:
- Enemy AI routines (Goomba movement, Koopa behavior, etc.)
- Enemy spawn system (how does the game decide when to place enemies?)
- Enemy-player interaction (what happens on collision?)

LEVEL SYSTEMS:
- Level data format (how are levels encoded in PRG-ROM?)
- Level loading routine (how does the game read and render a level?)
- Scroll engine (how does horizontal scrolling work?)

DATA TABLES:
- Where are the level data tables?
- Where are the enemy spawn tables?
- Where are physics constants stored?
- Where are the jump velocity curves?

For each system, provide:
- The PRG-ROM address range where the code lives
- A plain-English explanation of what the code does
- Key addresses/constants that could be modified

### Step 3: Validate against known ground truth

These are known facts about SMB's internals. Check your analysis
against them. Report how many you got right, wrong, or missed.

KNOWN FACTS:
1. The reset vector points to the initialization routine
2. NMI handler is the core frame update (not the main loop)
3. Player X velocity is influenced by a friction/acceleration model
4. Jump height depends on how long A is held (variable jump)
5. There are 8 world × 4 levels = 32 level definitions
6. Level data uses a compact encoding (not raw tile grids)
7. Enemies are spawned based on the scroll position reaching trigger points
8. The game has an "enemy object" system with ~5 active slots
9. Collision detection uses bounding boxes, not pixel-perfect
10. The famous minus world glitch involves the warp zone pipe
    reading from an unintended memory location

For each: did your analysis find this? Was your explanation consistent
with the known fact? Be honest about misses.

IMPORTANT: Do NOT look up the SMB disassembly online. Do NOT search
for it. The whole point is testing whether you can derive this
understanding from the raw code. If you already have training data
about SMB's internals, that's fine — but the analysis must be
grounded in the actual disassembly you produce, not recalled facts.

## PART 2: AUTHOR NEW CODE (only if Part 1 succeeds)

If your Part 1 analysis is substantially correct (7+ of 10 ground
truth facts confirmed), proceed to Part 2.

### The challenge: Write a new enemy behavior

Pick one of the existing enemy types (Goomba is simplest). Using your
understanding of:
- Where the enemy AI routine lives
- How the enemy object system works  
- How enemy movement is calculated
- How enemy-player collision is handled

Write a MODIFIED enemy AI routine in 6502 assembly that changes the
Goomba's behavior. Specifically:

Make the Goomba chase the player instead of walking in a fixed
direction. The Goomba should:
- Compare its X position to the player's X position
- Move left if the player is to the left
- Move right if the player is to the right
- Move at the same speed as the original Goomba

This requires:
1. Finding the original Goomba movement code
2. Understanding how it determines movement direction
3. Writing new code that reads the player X position and sets
   direction accordingly
4. Assembling the new code into machine code bytes
5. Patching those bytes into the emulator's PRG memory at runtime
6. Running the game and verifying the Goomba now chases the player

### Validation

Write tools/rom-toolkit/smb-patch-test.cjs that:
1. Boots SMB to gameplay
2. Saves a state
3. Patches the Goomba AI with your new code
4. Runs 300 frames while moving the player right then left
5. Tracks the first Goomba's X position each frame
6. Verifies the Goomba changed direction when the player did
7. Verifies the game didn't crash
8. Reports PASS or FAIL with position data

## ENVIRONMENT

Same jsnes setup as the previous toolkit session:

```javascript
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const nes = new NES({ onFrame: (fb) => {}, onAudioSample: (l,r) => {} });
const romData = fs.readFileSync(romPath);
nes.loadROM(romData.toString('binary'));

nes.frame();                    // step one frame
nes.cpu.mem[addr]               // read CPU address space (includes PRG-ROM mapped at $8000-$FFFF)
nes.cpu.mem[addr] = value       // write (RAM is $0000-$07FF, PRG-ROM area is $8000-$FFFF)
nes.toJSON() / nes.fromJSON()   // savestates
nes.buttonDown(1, Controller.BUTTON_RIGHT)  // input
```

PRG-ROM in jsnes: The ROM is mapped into CPU address space at
$8000-$FFFF (for 32KB PRG). So nes.cpu.mem[0x8000] is the first
byte of PRG-ROM. Writing to these addresses at runtime may or may
not work in jsnes — test this. If jsnes treats $8000+ as read-only
in cpu.mem, you may need to find the underlying ROM data array
(check nes.rom or nes.mmap or similar internal structures).

CRITICAL: To patch PRG at runtime, you need to find where jsnes
stores the actual ROM bytes and modify THOSE, not just cpu.mem.
Probe jsnes internals: check nes.rom, nes.cpu.mem vs the mapper,
etc. This is part of the experiment.

ROM location: ~/nes-roms/Super Mario Bros. (World).nes
Output directory: ~/giants-drink/tools/rom-toolkit/

## WHAT TO DO FIRST

1. ls ~/nes-roms/ | grep -i mario  (confirm ROM path)
2. Extract PRG-ROM bytes from the .nes file
3. Either find or write a 6502 disassembler
4. Produce the disassembly
5. Analyze it — this is the core test
6. Validate against ground truth
7. If validation passes → proceed to Part 2

## STOP CONDITION

When Part 2's patch test reports PASS or FAIL, stop. Commit everything.
Print a summary of:
- How much of the game you understood from disassembly alone
- Whether code injection worked
- What this implies for the general approach (can this work on any ROM?)

Do NOT proceed to other ROMs. Wait for further instructions.

## CRITICAL RULES

- Do NOT look up the SMB disassembly online. Derive from the binary.
- Test every assumption. If you think a routine does X, prove it.
- Save investigation-log.md as you go.
- Commit after Part 1 and again after Part 2.
- If Part 1 analysis is poor (< 7/10 ground truth), STOP and report.
  Do not attempt Part 2 on a flawed understanding.
- jsnes loads ROMs as BINARY STRINGS: romData.toString('binary')

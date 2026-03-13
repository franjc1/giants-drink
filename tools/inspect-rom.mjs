import { NES } from 'jsnes';
import fs from 'fs';

const romPath = process.argv[2];
const romData = fs.readFileSync(romPath);
const nes = new NES({ onFrame:()=>{}, onAudioSample:null, onStatusUpdate:()=>{}, emulateSound:false });
nes.loadROM(romData.toString('binary'));

// cpu.mem is a flat 64KB array - ROM pages are mapped there
// Acceleration table at $BA89: expect [4,4,4,5,5,5,6,6,6]
console.log('Accel table at $BA89:', Array.from(nes.cpu.mem.slice(0xBA89, 0xBA92)));
// Max speed table at $FFF0: expect [25,25,26,26,28,29,29,30,30,31]
console.log('MaxSpeed table at $FFF0:', Array.from(nes.cpu.mem.slice(0xFFF0, 0xFFFA)));
// Jump force table at $9AA5: expect [7,7,6,5,4,3,2,1,0]
console.log('JumpForce table at $9AA5:', Array.from(nes.cpu.mem.slice(0x9AA5, 0x9AAE)));
// Fall force table at $9AAE: expect [3,3,4,5,6,7,8,9,10]
console.log('FallForce table at $9AAE:', Array.from(nes.cpu.mem.slice(0x9AAE, 0x9AB7)));
// Jump velocity table at $B430: expect [10,9,252,252,252,251,251,254,255,0]
console.log('JumpVel table at $B430:', Array.from(nes.cpu.mem.slice(0xB430, 0xB43A)));

// Also check rom.rom structure
console.log('\nrom.rom is array of', nes.rom.rom.length, 'banks');
console.log('bank 0 length:', nes.rom.rom[0].length);
console.log('bank 0[$3A89] (BA89-8000):', nes.rom.rom[0][0x3A89]);  // BA89-8000=3A89

// Verify: can we write to cpu.mem and have it stick?
const orig = nes.cpu.mem[0xBA89];
nes.cpu.mem[0xBA89] = 99;
console.log('\nWrite test: orig=', orig, 'after write:', nes.cpu.mem[0xBA89]);
// Does a frame advance use the new value?
nes.cpu.mem[0xBA89] = orig; // restore

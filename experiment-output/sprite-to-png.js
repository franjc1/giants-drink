const fs = require('fs');
const { createCanvas, createImageData } = require('canvas');

// Read the sprite data
const spriteData = JSON.parse(fs.readFileSync('./real-sprite-data.json', 'utf8'));

function convertSpriteToPNG(spritePixels, palette, outputPath, scale = 8) {
    const width = spritePixels[0].length;
    const height = spritePixels.length;

    const canvas = createCanvas(width * scale, height * scale);
    const ctx = canvas.getContext('2d');

    // Clear with transparent background
    ctx.clearRect(0, 0, width * scale, height * scale);

    for (let y = 0; y < height; y++) {
        for (let x = 0; x < width; x++) {
            const paletteIndex = spritePixels[y][x];
            const color = palette[paletteIndex.toString()];

            // Skip transparent pixels (index 0 is typically background/transparent)
            if (paletteIndex !== 0) {
                ctx.fillStyle = color;
                ctx.fillRect(x * scale, y * scale, scale, scale);
            }
        }
    }

    // Save as PNG
    const buffer = canvas.toBuffer('image/png');
    fs.writeFileSync(outputPath, buffer);
    console.log(`Created ${outputPath} (${width * scale}x${height * scale})`);
}

// Convert mario_stand sprite to PNG
convertSpriteToPNG(
    spriteData.smb.sprites.mario_stand,
    spriteData.smb.palette_rgb,
    './mario-original.png'
);

console.log('Mario sprite extracted successfully!');
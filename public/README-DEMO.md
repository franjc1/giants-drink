# Two Fires Browser Demo Instructions

## Quick Start

1. **Start a local server:**
   ```bash
   cd ~/giants-drink/public
   python3 -m http.server 8080
   ```

2. **Open the demo:**
   - Go to: http://localhost:8080/demo.html

3. **Get your API key:**
   - Go to: https://console.anthropic.com/
   - Create an API key
   - Paste it into the "API Configuration" field in the demo

4. **Play and transform:**
   - Use arrow keys to play Super Mario Bros
   - Type a prompt like "underwater theme" or "dark world"
   - Click "Transform Game" to see real-time modifications!

## Controls
- **Arrow Keys** = Move Mario
- **Z** = Jump (A button)
- **X** = Run (B button)
- **Enter** = Start
- **Shift** = Select

## Example Prompts
- "underwater theme"
- "dark spooky world"
- "ice level"
- "lava world"
- "night time"
- "desert theme"
- "space level"

## What It Does
The demo sends your prompt to Claude AI, which generates a JSON response with NES color palette modifications. These are applied to the running game in real-time, transforming the visual appearance to match your theme.

## Technical Notes
- The SMB ROM is embedded as base64 in the HTML (40KB)
- Uses jsnes.min.js for NES emulation
- Connects to Anthropic API for AI modifications
- Applies palette changes via PPU memory writes
- Based on verified behavioral maps from our analysis pipeline

## Troubleshooting
- If the game doesn't load, make sure you're using a local server (not file://)
- If transformations don't work, check that your API key is valid
- If you get CORS errors, the API key might be invalid or the server might be down
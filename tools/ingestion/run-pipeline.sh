#!/bin/bash
#
# run-pipeline.sh
#
# Orchestrates the full Phase 0.5 ingestion pipeline:
#   1. Scrape raw docs from all URLs for a platform
#   2. Extract each data dimension using Claude
#   3. Validate output and generate gap report
#
# Usage:
#   ./run-pipeline.sh nes                    — full pipeline for NES games
#   ./run-pipeline.sh snes                   — full pipeline for SNES games
#   ./run-pipeline.sh genesis                — full pipeline for Genesis games
#   ./run-pipeline.sh pc                     — full pipeline for PC games
#   ./run-pipeline.sh nes --skip-scrape      — skip scraping (raw data already fetched)
#   ./run-pipeline.sh nes --dimension=physics — only run extraction for one dimension
#   ./run-pipeline.sh nes physics            — same as above
#   ./run-pipeline.sh report                 — show coverage report, no extraction
#
# Overnight usage:
#   caffeinate -i ./run-pipeline.sh nes &
#   caffeinate -i ./run-pipeline.sh snes &
#   caffeinate -i ./run-pipeline.sh genesis &
#   caffeinate -i ./run-pipeline.sh pc &
#
# Requirements:
#   - Node.js 18+
#   - ANTHROPIC_API_KEY environment variable set
#   - npm install (run once in this directory)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error()   { echo -e "${RED}[ERROR]${NC} $1"; }

# --- Args ---
PLATFORM="${1:-}"
SKIP_SCRAPE=false
SINGLE_DIMENSION=""

for arg in "$@"; do
  case "$arg" in
    --skip-scrape)   SKIP_SCRAPE=true ;;
    --dimension=*)   SINGLE_DIMENSION="${arg#--dimension=}" ;;
    physics|visual_identity|audio|level_sequences|game_design|manifestation)
      SINGLE_DIMENSION="$arg" ;;
  esac
done

if [[ -z "$PLATFORM" ]]; then
  echo "Usage: ./run-pipeline.sh <platform> [options]"
  echo "Platforms: nes, snes, genesis, pc, all, report"
  echo "Options:   --skip-scrape, --dimension=<dim>"
  exit 1
fi

if [[ "$PLATFORM" == "report" ]]; then
  log_info "Generating coverage report..."
  node validator.js --report
  exit 0
fi

PLATFORMS=()
if [[ "$PLATFORM" == "all" ]]; then
  PLATFORMS=(nes snes genesis pc)
else
  PLATFORMS=("$PLATFORM")
fi

# Game lists are split by paradigm: game-lists/${platform}-${paradigm}-${n}.json
# batch-scraper.js, data-extractor.js, and validator.js all glob ${platform}-*.json

# --- Validate environment ---
if [[ -z "${ANTHROPIC_API_KEY:-}" ]]; then
  log_error "ANTHROPIC_API_KEY not set. Export it before running."
  log_error "Example: export ANTHROPIC_API_KEY=sk-ant-..."
  exit 1
fi

if ! command -v node &>/dev/null; then
  log_error "Node.js not found. Install Node 18+."
  exit 1
fi

NODE_VERSION=$(node --version | sed 's/v//' | cut -d. -f1)
if [[ "$NODE_VERSION" -lt 18 ]]; then
  log_error "Node.js 18+ required. Found: $(node --version)"
  exit 1
fi

# Install dependencies if needed
if [[ ! -d "node_modules" ]]; then
  log_info "Installing dependencies..."
  npm install
fi

# --- Dimensions to extract ---
ALL_DIMENSIONS=(physics visual_identity audio level_sequences game_design manifestation)
if [[ -n "$SINGLE_DIMENSION" ]]; then
  DIMENSIONS=("$SINGLE_DIMENSION")
else
  DIMENSIONS=("${ALL_DIMENSIONS[@]}")
fi

# --- Main pipeline ---
PIPELINE_START=$(date +%s)

for platform in "${PLATFORMS[@]}"; do

  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  log_info "Platform: ${platform}"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

  # Step 1: Scrape
  if [[ "$SKIP_SCRAPE" == false ]]; then
    echo ""
    log_info "Step 1: Scraping raw documentation for $platform..."
    if node batch-scraper.js --platform="$platform" --resume; then
      log_success "Scraping complete for $platform"
    else
      log_warn "Scraping had errors for $platform (continuing — partial data usable)"
    fi
  else
    log_info "Step 1: Skipping scrape (--skip-scrape flag set)"
  fi

  # Step 2: Extract each dimension
  echo ""
  log_info "Step 2: Extracting dimensions for $platform..."

  for dim in "${DIMENSIONS[@]}"; do
    echo ""
    log_info "  Extracting: $dim"
    if node data-extractor.js --platform="$platform" --dimension="$dim"; then
      log_success "  $dim extraction complete for $platform"
    else
      log_warn "  $dim extraction had errors (check logs above)"
    fi
  done

  # Step 3: Validate
  echo ""
  log_info "Step 3: Validating extracted data for $platform..."
  for dim in "${DIMENSIONS[@]}"; do
    node validator.js --platform="$platform" --dimension="$dim" 2>&1 | tail -5
  done

done

# --- Final report ---
PIPELINE_END=$(date +%s)
ELAPSED=$((PIPELINE_END - PIPELINE_START))
ELAPSED_MIN=$((ELAPSED / 60))
ELAPSED_SEC=$((ELAPSED % 60))

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
log_success "Pipeline complete! Time: ${ELAPSED_MIN}m ${ELAPSED_SEC}s"
echo ""
log_info "Coverage summary:"
node validator.js --report
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

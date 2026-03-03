# claude.md — Paradigm Specs Addition
## Append this to the Key documents table and add the section below

---

### Add to Key Documents table:

| `docs/design/paradigm-specs.md` | Engine clusters + player-facing paradigm specs for all retro game types | When paradigms are added or modified |

---

### Add this section after "Design Philosophy":

## Paradigm Architecture

Two Fires organizes game types into two layers: **engine clusters** (what gets built) and **player-facing paradigms** (what agents read).

**7 Engine Clusters** — each defined by a unique rendering core + camera + collision + input combination:
1. Side-View Tile World (platformer, beat-em-up, run-and-gun)
2. Top-Down Tile World (action-adventure, RPG overworld, top-down action/racing)
3. Stage/Arena Screen (fighting, RPG combat, fixed-screen, puzzle)
4. Scrolling Shooter (shmups)
5. Pseudo-3D / Mode 7 (racing)
6. Raycasting First-Person (FPS, adventure, dungeon crawler)
7. Strategic Map (RTS, tactics, management sim)

**12 Full Paradigm Specs** — each defines temporal structure, sequencing grammar, social surface, CAS integration, physics, aesthetics, and genre shift interface. See `docs/design/paradigm-specs.md`.

**Key rule:** The Experience Interpreter maps prompt *activities* to engine clusters based on mechanical feel, not genre labels. Any prompt can be served by finding the right engine cluster.

**Shift mechanics:** Intra-cluster shifts (platformer → beat-em-up) = parameter swap, seamless. Cross-cluster shifts (platformer → racing) = rendering core switch, requires transition.

**⚠️ All numerical values in paradigm specs are placeholders.** Behavior descriptions are authoritative design intent. Exact thresholds come from Thread 3 (CAS Engine Parameters).

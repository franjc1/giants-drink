import { state } from './state.js';

export function getTile(col, row) {
  const MAP_W = state.mapW;
  const MAP_H = state.mapH;
  if (col < 0 || col >= MAP_W || row < 0) return 0;
  if (row >= MAP_H) return 1; // below map = solid
  return state.tilemap[row * MAP_W + col];
}

export function isSolid(id) {
  return state.tileset[id] && state.tileset[id].collision === true;
}

// Applies vx then vy, resolves tile collisions for each axis.
// Sets obj.onGround. Sets obj.onWall if horizontal collision and obj has that property.
export function moveAndCollide(obj) {
  const TILE = state.tileSize;

  // X
  obj.x += obj.vx;
  {
    const cl = Math.floor(obj.x / TILE);
    const cr = Math.floor((obj.x + obj.w - 1) / TILE);
    const rt = Math.floor(obj.y / TILE);
    const rb = Math.floor((obj.y + obj.h - 1) / TILE);
    if (obj.vx > 0) {
      for (let r = rt; r <= rb; r++) {
        if (isSolid(getTile(cr, r))) {
          obj.x = cr * TILE - obj.w;
          obj.vx = 0;
          if ('onWall' in obj) obj.onWall = true;
          break;
        }
      }
    } else if (obj.vx < 0) {
      for (let r = rt; r <= rb; r++) {
        if (isSolid(getTile(cl, r))) {
          obj.x = (cl + 1) * TILE;
          obj.vx = 0;
          if ('onWall' in obj) obj.onWall = true;
          break;
        }
      }
    }
  }

  // Y
  obj.y += obj.vy;
  obj.onGround = false;
  {
    const cl = Math.floor(obj.x / TILE);
    const cr = Math.floor((obj.x + obj.w - 1) / TILE);
    const rt = Math.floor(obj.y / TILE);
    const rb = Math.floor((obj.y + obj.h - 1) / TILE);
    if (obj.vy >= 0) {
      for (let c = cl; c <= cr; c++) {
        if (isSolid(getTile(c, rb))) {
          obj.y = rb * TILE - obj.h;
          obj.vy = 0;
          obj.onGround = true;
          break;
        }
      }
    } else {
      for (let c = cl; c <= cr; c++) {
        if (isSolid(getTile(c, rt))) {
          obj.y = (rt + 1) * TILE;
          obj.vy = 0;
          break;
        }
      }
    }
  }
}

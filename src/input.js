export const keys = {};

export function initInput() {
  window.addEventListener('keydown', e => {
    keys[e.code] = true;
    if (['Space', 'ArrowLeft', 'ArrowRight', 'ArrowUp', 'ArrowDown'].includes(e.code))
      e.preventDefault();
  });
  window.addEventListener('keyup', e => { keys[e.code] = false; });
}

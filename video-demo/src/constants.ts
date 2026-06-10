export const FPS = 30;
export const TOTAL_FRAMES = 32 * FPS; // 32 seconds at 30fps = 960 frames

// Colors
export const BG = '#0a0e1a';
export const PURPLE = '#7c3aed';
export const PURPLE_LIGHT = '#a855f7';
export const GREEN = '#22c55e';
export const WHITE = '#f8fafc';
export const GRAY = '#94a3b8';
export const GRAY_DIM = '#475569';
export const AMBER = '#f59e0b';

// Scene boundaries (in frames)
export const SCENES = {
  s1: { start: 0,         end: 3 * FPS },   // 0–3s   title
  s2: { start: 3 * FPS,   end: 8 * FPS },   // 3–8s   idea typing
  s3: { start: 8 * FPS,   end: 18 * FPS },  // 8–18s  pipeline steps
  s4: { start: 18 * FPS,  end: 24 * FPS },  // 18–24s score bar
  s5: { start: 24 * FPS,  end: 28 * FPS },  // 24–28s book ready
  s6: { start: 28 * FPS,  end: 32 * FPS },  // 28–32s CTA
} as const;

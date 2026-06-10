import React from 'react';
import { useCurrentFrame, useVideoConfig, interpolate, Easing } from 'remotion';
import { BG, WHITE, PURPLE, PURPLE_LIGHT, GREEN, GRAY, GRAY_DIM } from './constants';

const SCORE_KEYFRAMES = [
  { time: 0.3, value: 0 },
  { time: 1.0, value: 7.2 },
  { time: 2.2, value: 8.1 },
  { time: 3.6, value: 8.5 },
];

export const Scene4Score: React.FC = () => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();
  const timeS = frame / fps;

  // Score value interpolation through keyframes
  let score = 0;
  for (let i = 0; i < SCORE_KEYFRAMES.length - 1; i++) {
    const kf = SCORE_KEYFRAMES[i];
    const kfNext = SCORE_KEYFRAMES[i + 1];
    if (timeS >= kf.time && timeS <= kfNext.time) {
      score = interpolate(timeS, [kf.time, kfNext.time], [kf.value, kfNext.value], {
        easing: Easing.out(Easing.cubic),
      });
    } else if (timeS > kfNext.time) {
      score = kfNext.value;
    }
  }

  const passed = score >= 8.5;
  const barPercent = interpolate(score, [0, 10], [0, 100], {
    extrapolateLeft: 'clamp',
    extrapolateRight: 'clamp',
  });

  // Checkmark appears when gate passes
  const checkFade = interpolate(timeS, [3.6, 4.2], [0, 1], {
    extrapolateLeft: 'clamp',
    extrapolateRight: 'clamp',
    easing: Easing.out(Easing.back(1.5)),
  });
  const checkScale = interpolate(timeS, [3.6, 4.2], [0.4, 1], {
    extrapolateLeft: 'clamp',
    extrapolateRight: 'clamp',
    easing: Easing.out(Easing.back(1.5)),
  });

  // Container fade in
  const containerFade = interpolate(frame, [0, fps * 0.5], [0, 1], {
    extrapolateRight: 'clamp',
  });

  const barColor = passed
    ? `linear-gradient(90deg, ${PURPLE}, ${GREEN})`
    : `linear-gradient(90deg, ${PURPLE}, ${PURPLE_LIGHT})`;

  return (
    <div
      style={{
        width: '100%',
        height: '100%',
        background: BG,
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
        fontFamily: "'Segoe UI', system-ui, sans-serif",
        padding: '0 160px',
        boxSizing: 'border-box',
      }}
    >
      {/* Grid bg */}
      <div
        style={{
          position: 'absolute',
          inset: 0,
          backgroundImage:
            'linear-gradient(rgba(124,58,237,0.04) 1px, transparent 1px), linear-gradient(90deg, rgba(124,58,237,0.04) 1px, transparent 1px)',
          backgroundSize: '60px 60px',
        }}
      />

      <div style={{ opacity: containerFade, width: '100%', maxWidth: 800, zIndex: 1 }}>
        {/* Label */}
        <div
          style={{
            fontSize: 13,
            fontFamily: "'Courier New', monospace",
            color: PURPLE_LIGHT,
            letterSpacing: '0.18em',
            textTransform: 'uppercase',
            marginBottom: 32,
          }}
        >
          // genesis score
        </div>

        {/* Score display */}
        <div
          style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            marginBottom: 20,
          }}
        >
          <div
            style={{
              fontSize: 80,
              fontWeight: 800,
              color: passed ? GREEN : WHITE,
              fontFamily: "'Courier New', monospace",
              letterSpacing: '-2px',
              lineHeight: 1,
              transition: 'color 0.3s',
            }}
          >
            {score.toFixed(1)}
          </div>

          <div style={{ textAlign: 'right' }}>
            <div style={{ fontSize: 16, color: GRAY_DIM, marginBottom: 4 }}>
              quality gate
            </div>
            <div
              style={{
                fontSize: 28,
                fontWeight: 700,
                color: PURPLE_LIGHT,
                fontFamily: "'Courier New', monospace",
              }}
            >
              8.5 / 10
            </div>
          </div>
        </div>

        {/* Progress bar track */}
        <div
          style={{
            width: '100%',
            height: 16,
            background: 'rgba(255,255,255,0.06)',
            borderRadius: 8,
            overflow: 'hidden',
            position: 'relative',
            border: '1px solid rgba(255,255,255,0.08)',
          }}
        >
          {/* Fill */}
          <div
            style={{
              height: '100%',
              width: `${barPercent}%`,
              background: barColor,
              borderRadius: 8,
              transition: 'background 0.4s',
            }}
          />

          {/* Gate marker at 8.5 */}
          <div
            style={{
              position: 'absolute',
              top: 0,
              left: '85%',
              width: 2,
              height: '100%',
              background: 'rgba(255,255,255,0.35)',
            }}
          />
        </div>

        {/* Scale labels */}
        <div
          style={{
            display: 'flex',
            justifyContent: 'space-between',
            marginTop: 8,
            fontSize: 12,
            fontFamily: "'Courier New', monospace",
            color: GRAY_DIM,
          }}
        >
          <span>0.0</span>
          <span style={{ color: PURPLE_LIGHT, marginLeft: '80%' }}>8.5</span>
          <span>10.0</span>
        </div>

        {/* Status row */}
        <div
          style={{
            marginTop: 36,
            display: 'flex',
            alignItems: 'center',
            gap: 16,
          }}
        >
          {/* Checkmark */}
          <div
            style={{
              opacity: checkFade,
              transform: `scale(${checkScale})`,
              width: 52,
              height: 52,
              borderRadius: '50%',
              background: `${GREEN}20`,
              border: `2px solid ${GREEN}`,
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              fontSize: 24,
            }}
          >
            ✓
          </div>

          <div style={{ opacity: checkFade }}>
            <div style={{ fontSize: 20, fontWeight: 600, color: GREEN }}>
              Gate passed
            </div>
            <div
              style={{
                fontSize: 13,
                color: GRAY_DIM,
                fontFamily: "'Courier New', monospace",
                marginTop: 2,
              }}
            >
              chapter approved · proceeding to next
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

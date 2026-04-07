#!/bin/bash
# Assembles individual slide files into sales-pitch.html
# Run: bash presentation/build.sh

cd "$(dirname "$0")"

cat > sales-pitch.html << 'HEADER'
<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>evaVoc — Sales Pitch</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5.1.0/dist/reveal.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5.1.0/dist/theme/black.css">
  <style>
HEADER

cat slides/theme.css >> sales-pitch.html

cat >> sales-pitch.html << 'MID'
  </style>
</head>
<body>
  <div class="reveal">

    <!-- Persistent branding footer — every slide -->
    <div style="position:fixed;bottom:12px;left:0;right:0;display:flex;justify-content:space-between;align-items:center;padding:0 28px;z-index:200;pointer-events:none;">
      <div style="display:flex;align-items:center;gap:8px;">
        <svg viewBox="0 0 28 28" width="18" height="18" style="flex-shrink:0;">
          <rect x="1" y="1" width="26" height="26" rx="6" fill="rgba(30,27,75,0.9)" stroke="rgba(139,92,246,0.5)" stroke-width="1.2"/>
          <rect x="3.5" y="8"  width="3" height="12" rx="1.5" fill="#a78bfa" style="transform-box:fill-box;transform-origin:50% 50%;animation:ev-b 1.10s ease-in-out 0.14s infinite;"/>
          <rect x="8"   y="8"  width="3" height="12" rx="1.5" fill="#a78bfa" style="transform-box:fill-box;transform-origin:50% 50%;animation:ev-d 1.00s ease-in-out 0.07s infinite;"/>
          <rect x="12.5" y="8" width="3" height="12" rx="1.5" fill="#a78bfa" style="transform-box:fill-box;transform-origin:50% 50%;animation:ev-e 0.85s ease-in-out 0.28s infinite;"/>
          <rect x="17"  y="8"  width="3" height="12" rx="1.5" fill="#a78bfa" style="transform-box:fill-box;transform-origin:50% 50%;animation:ev-c 0.95s ease-in-out 0.21s infinite;"/>
          <rect x="21.5" y="8" width="3" height="12" rx="1.5" fill="#a78bfa" style="transform-box:fill-box;transform-origin:50% 50%;animation:ev-f 1.15s ease-in-out 0.35s infinite;"/>
        </svg>
        <span style="font-size:12px;font-weight:800;background:linear-gradient(135deg,#a78bfa,#c4b5fd);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;letter-spacing:0.04em;">evaVoc</span>
      </div>
      <div style="font-size:10px;color:rgba(255,255,255,0.30);letter-spacing:0.10em;text-transform:uppercase;font-weight:500;">par <span style="color:rgba(167,139,250,0.55);font-weight:700;">NouraiSolutions</span></div>
    </div>

    <div class="slides">
MID

for f in slides/[0-9]*.html; do
  echo "" >> sales-pitch.html
  echo "      <!-- $(basename "$f") -->" >> sales-pitch.html
  cat "$f" >> sales-pitch.html
done

cat >> sales-pitch.html << 'FOOTER'

    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/reveal.js@5.1.0/dist/reveal.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/reveal.js@5.1.0/plugin/notes/notes.js"></script>
  <script>
    Reveal.initialize({
      hash: true,
      slideNumber: false,
      controls: true,
      progress: true,
      center: true,
      transition: 'slide',
      backgroundTransition: 'fade',
      transitionSpeed: 'default',
      fragments: true,
      width: 960,
      height: 600,
      margin: 0.1,
      minScale: 0.5,
      maxScale: 1.2,
      plugins: [RevealNotes]
    });
  </script>
</body>
</html>
FOOTER

echo "Built: sales-pitch.html"

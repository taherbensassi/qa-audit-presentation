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
  <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='6' fill='%231e1b4b'/%3E%3Crect x='5' y='10' width='3' height='12' rx='1.5' fill='%238b5cf6'%3E%3Canimate attributeName='height' values='12;6;12' dur='0.9s' repeatCount='indefinite'/%3E%3Canimate attributeName='y' values='10;13;10' dur='0.9s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect x='10' y='7' width='3' height='18' rx='1.5' fill='%23a78bfa'%3E%3Canimate attributeName='height' values='18;10;18' dur='1.1s' repeatCount='indefinite'/%3E%3Canimate attributeName='y' values='7;11;7' dur='1.1s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect x='15' y='5' width='3' height='22' rx='1.5' fill='%238b5cf6'%3E%3Canimate attributeName='height' values='22;8;22' dur='0.85s' repeatCount='indefinite'/%3E%3Canimate attributeName='y' values='5;12;5' dur='0.85s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect x='20' y='8' width='3' height='16' rx='1.5' fill='%23a78bfa'%3E%3Canimate attributeName='height' values='16;10;16' dur='1s' repeatCount='indefinite'/%3E%3Canimate attributeName='y' values='8;11;8' dur='1s' repeatCount='indefinite'/%3E%3C/rect%3E%3Crect x='25' y='11' width='3' height='10' rx='1.5' fill='%238b5cf6'%3E%3Canimate attributeName='height' values='10;5;10' dur='0.95s' repeatCount='indefinite'/%3E%3Canimate attributeName='y' values='11;13.5;11' dur='0.95s' repeatCount='indefinite'/%3E%3C/rect%3E%3C/svg%3E">
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

    <!-- Slim branding bar — every slide -->
    <div style="position:fixed;bottom:0;left:0;right:0;height:28px;z-index:200;pointer-events:none;display:flex;align-items:center;justify-content:space-between;padding:0 30px;border-top:1px solid rgba(139,92,246,0.12);background:rgba(11,11,20,0.85);backdrop-filter:blur(4px);">
      <span style="font-size:11px;font-weight:800;background:linear-gradient(135deg,#a78bfa,#c4b5fd);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;letter-spacing:0.06em;">evaVoc</span>
      <span style="font-size:10px;color:rgba(255,255,255,0.22);letter-spacing:0.05em;">NourAI Solutions &nbsp;&middot;&nbsp; contact@nouraisolutions.tn</span>
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

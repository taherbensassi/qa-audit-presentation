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
  <title>BrainQA — Sales Pitch</title>
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
      width: 1100,
      height: 700,
      margin: 0.08,
      minScale: 0.2,
      maxScale: 1.5,
      plugins: [RevealNotes]
    });
  </script>
</body>
</html>
FOOTER

echo "Built: sales-pitch.html"

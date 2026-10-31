#!/usr/bin/env bash
# Baut aus app.html (Fassung für claude.ai-Artifacts) die eigenständige index.html,
# die man direkt im Browser öffnet oder auf einen https-Webspace legt.
set -e
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="de">\n<head>\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
  printf '<meta name="theme-color" content="#0e1322">\n'
  printf '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}[hidden]{display:none!important}</style>\n'
  printf '</head>\n<body>\n'
  cat app.html
  printf '\n</body>\n</html>\n'
} > index.html
echo "index.html gebaut ($(wc -c < index.html) Bytes)"

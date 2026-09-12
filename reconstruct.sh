#!/bin/bash
set -euo pipefail
BASE="https://raw.githubusercontent.com/Kramerbrian/clarityos-p2-demo-dist-90d4/main"
mkdir -p dist/assets dist/landing
curl -fsSL "$BASE/index.html" -o dist/index.html
curl -fsSL "$BASE/favicon.svg" -o dist/favicon.svg
curl -fsSL "$BASE/favicon.ico.b64" | base64 -d > dist/favicon.ico
curl -fsSL "$BASE/assets/index-Ct9E8qs7.css.gz.b64" | base64 -d | gzip -dc > dist/assets/index-Ct9E8qs7.css
curl -fsSL "$BASE/landing/index.html.gz.b64" | base64 -d | gzip -dc > dist/landing/index.html
: > /tmp/js.b64
for i in 00 01 02 03 04 05 06 07 08 09 10 11 12; do
  curl -fsSL "$BASE/js/p${i}.txt" >> /tmp/js.b64
done
base64 -d /tmp/js.b64 | gzip -dc > dist/assets/index-YbLYW-zc.js
wc -c dist/assets/index-YbLYW-zc.js dist/assets/index-Ct9E8qs7.css dist/index.html

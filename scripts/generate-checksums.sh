#!/bin/sh
set -eu

OUT="${1:-CHECKSUMS.sha256}"

find devices -type f -print0 \
  | sort -z \
  | xargs -0 sha256sum > "$OUT"

echo "Wrote $OUT"

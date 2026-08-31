#!/usr/bin/env bash

set -e

find tests -name '*.asm' -print0 | while IFS= read -r -d '' file; do
    perl -0777 -pi -e '
        s/\r//g;
        s/\t/    /g;
        s/[ \t]+$//mg;
        s/\n*\z/\n/ if length;
    ' "$file"
done

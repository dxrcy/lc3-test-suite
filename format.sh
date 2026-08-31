#!/usr/bin/env bash

# ./format.sh tests/**/*.asm

set -e

for file in "$@"; do
    # remove \r
    # \t -> 4 spaces
    # trim trailing spaces
    sed -i '' \
        -e 's/\r$//' \
        -e 's/\t/    /g' \
        -e 's/[[:space:]]*$//' \
        "$file"

    # remove blank lines at EOF
    while [ -z "$(tail -c 1 "$file")" ] && [ -s "$file" ]; do
        truncate -s -1 "$file"
    done

    # add final newline if needed
    [ ! -s "$file" ] || [ "$(tail -c 1 "$file")" = "$(printf '\n')" ] || printf '\n' >>"$file"
done

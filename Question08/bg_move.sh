#!/bin/bash
#
# bg_move.sh

set -o nounset
shopt -s nullglob

dir=
subdir=
files=()
pids=()
exit_status=0

if [ $# -ne 1 ] || [ ! -d "$1" ]; then
    echo "Usage: $0 <dir>" >&2
    exit 1
fi

dir="${1%/}"
subdir="$dir/backup"
if [ ! -e "$subdir" ]; then
    mkdir "$subdir"
fi

for entry in "$dir"/*; do
    if [ -f "$entry" ]; then
        files+=( "$entry" )
    fi
done

echo "Shell PID: $$"
for file in "${files[@]}"; do
    mv -t "$subdir" "$file" &
    echo "Background PID: $!"
    pids+=( $! )
done

for pid in "${pids[@]}"; do
    wait "$pid" || exit_status=1
done

exit $exit_status

#!/bin/sh
#
# analyze.sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file/dir>" >&2
    exit 2
fi

if [ -f "$1" ]; then
    lines=$(wc -l < "$1")
    words=$(wc -w < "$1")
    chars=$(wc -m < "$1")
    echo "Lines: $lines"
    echo "Words: $words"
    echo "Chars: $chars"
elif [ -d "$1" ]; then
    nfiles=$(find "$1" -type f -printf x | wc -c)
    ntxtfiles=$(find "$1" -type f -name '*.txt' -printf x | wc -c)
    echo "Total number of files: $nfiles"
    echo "Total number of .txt files: $ntxtfiles"
else
    echo "Error: argument must be either a file or a directory" >&2
    exit 2
fi

exit 0

#!/bin/bash
#
# patterns.sh

words=()
vowels=()
consonants=()
mixed=()

while read -r line; do
    line="${line,,}"    # lowercase
    line="$(sed -E 's/[^a-z ]+//g' <<< "$line")"  # Remove punctuation
    words+=( $line )
done

for word in "${words[@]}"; do
    if grep -Eiq '^[aeiou]+$' <<< "$word"; then
        vowels+=( "$word" )
    elif grep -Eiq '^[bcdfghjklmnpqrstvwxyz]+$' <<< "$word"; then
        consonants+=( "$word" )
    else
        mixed+=( "$word" )
    fi
done

printf "%s\n" "${vowels[@]}"     > vowels.txt
printf "%s\n" "${consonants[@]}" > consonants.txt
printf "%s\n" "${mixed[@]}"      > mixed.txt

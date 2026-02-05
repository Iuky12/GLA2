#!/bin/bash
#
# sync.sh

shopt -s nullglob

declare -A A B onlyA onlyB bothAB

# Load all filenames in dirA, dirB into assoc. arrays A, B respectively.

for entry in dirA/*; do
    if [ -f "$entry" ]; then
        entry="$(basename "$entry")"
        A["$entry"]=1
    fi
done

for entry in dirB/*; do
    if [ -f "$entry" ]; then
        entry="$(basename "$entry")"
        B["$entry"]=1
    fi
done

# Perform set operation A-B, B-A.

for k in "${!A[@]}"; do
  [[ -v B["$k"] ]] || onlyA["$k"]=1
done

for k in "${!B[@]}"; do
  [[ -v A["$k"] ]] || onlyB["$k"]=1
done

# Perform set operation A ∩ B.

for k in "${!A[@]}"; do
    [[ -v onlyA["$k"] ]] || bothAB["$k"]=1
done
for k in "${!B[@]}"; do
    [[ -v onlyB["$k"] ]] || bothAB["$k"]=1
done

# Print results.

printf "A:\t";      printf " %s" "${!A[@]}";      printf "\n"
printf "B:\t";      printf " %s" "${!B[@]}";      printf "\n"
printf "onlyA:\t";  printf " %s" "${!onlyA[@]}";  printf "\n"
printf "onlyB:\t";  printf " %s" "${!onlyB[@]}";  printf "\n"
printf "bothAB:\t"; printf " %s" "${!bothAB[@]}"; printf "\n"

# print differences

printf "\n"
for file in "${!bothAB[@]}"; do
    if cmp -s "dirA/$file" "dirB/$file"; then
        comp="same"
    else
        comp="differ"
    fi
    printf "{dirA,dirB}/%s:\t%s\n" "$file" "$comp"
done

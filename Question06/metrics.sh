#!/bin/bash
#
# metrics.sh

words=()
longest_word=
shortest_word=
avg_word_len=
n_unique_words=

while read -r line; do
    line="${line,,}"    # lowercase
    line="$(sed -E 's/[^a-z ]+//g' <<< "$line")"  # Remove punctuation
    words+=( $line )
done < input.txt

longest_word="${words[0]}"
shortest_word="${words[0]}"
sum=0
for word in "${words[@]}"; do
    if [ "${#longest_word}" -lt "${#word}" ]; then
        longest_word="$word"
    fi
    if [ "${#shortest_word}" -gt "${#word}" ]; then
        shortest_word="$word"
    fi
    sum=$(( sum + "${#word}" ))
done
avg_word_len=$(bc -q <<< "scale=2; $sum / ${#words[@]}")
n_unique_words=$(printf "%s\n" "${words[@]}" | sort -u | wc -l)

echo "Longest word      : $longest_word"
echo "Shortest word     : $shortest_word"
echo "Avg word len.     : $avg_word_len"
echo "No. of uniq. words: $n_unique_words"

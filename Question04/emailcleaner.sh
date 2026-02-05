#!/bin/bash
#
# emailcleaner.sh

RE_VALID_EMAIL='^[a-zA-Z0-9]+@[a-zA-Z]+[.]com$'
valid=()
invalid=()

while IFS= read -r email || [[ $email ]]; do
    if grep -Eq "$RE_VALID_EMAIL" <<< "$email"; then
        valid+=("$email")
    else
        invalid+=("$email")
    fi
done < emails.txt

printf '%s\n' "${valid[@]}"   | sort -u >   valid.txt
printf '%s\n' "${invalid[@]}" | sort    > invalid.txt

#!/bin/bash
#
# validate_results.sh

# Rollno,Name,Marks1,Marks2,Marks3

### Sub routines ###

# Determines if (marks1, marks2, marks3) is passed (>=33)
passed() {
    (( $1 >= 33 )) && (( $2 >= 33 )) && (( $3 >= 33 ))
}

# Determines whether or not (marks1, marks2, marks3) has exactly one < 33
failed_one() {
    local fail_count=0
    while [[ $# -gt 0 ]]; do
        if (( $1 < 33 )); then
            (( fail_count++ ))
        fi
        shift
    done
    [[ $fail_count -eq 1 ]]
}

### Main Script ###

failed=()
passed=()

while IFS=, read -r rollno name marks1 marks2 marks3; do
    if passed $marks1 $marks2 $marks3; then
        passed+=( "$name" )
    elif failed_one $marks1 $marks2 $marks3; then
        failed+=( "$name" )
    fi
done < marks.txt

printf "=== Passed (%d) ===\n" "${#passed[@]}"
printf "\t%s\n" "${passed[@]}"
printf "=== Failed (%d) ===\n" "${#failed[@]}"
printf "\t%s\n" "${failed[@]}"

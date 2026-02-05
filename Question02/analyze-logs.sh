#!/bin/sh
#
# analyze-logs.sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 <log file>" >&2
    exit 1
fi

logfile="$1"

if [ ! -f "$logfile" ] || [ ! -r "$logfile" ]; then
    echo "Error: argument must be a readable file" >&2
    exit 2
fi

nloglines=$(wc -l < "$logfile")
nerror=$(grep -F ERROR < "$logfile" | wc -l)
nwarning=$(grep -F WARNING < "$logfile" | wc -l)
ninfo=$(grep -F INFO < "$logfile" | wc -l)
most_recent_error=$(grep -F ERROR < "$logfile" | tail -1)

summary_file=logsummary_$(date -I).txt

echo "Number of logs: $nloglines" > "$summary_file"
echo "Number of errors: $nerror" >> "$summary_file"
echo "Number of warnings: $nwarning" >> "$summary_file"
echo "Number of infos: $ninfo" >> "$summary_file"
echo "Most recent error: $most_recent_error" >> "$summary_file"

cat "$summary_file"

exit 0

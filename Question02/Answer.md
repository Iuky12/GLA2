# Question 2

In the shell script `analyze-logs.sh`, we first check that the user has
indeed supplied exactly one command line argument.  If not, we print an
error message to standard error and exit.  Furthermore, if the user has
supplied a file name which is either not a file or unreadable, we inform
the user and exit.

We use the `grep` command followed by `wc -l` to select and count log
entries which are classified as `ERROR`, `WARNING`, and `INFO`.  Having
computed these counts, we write them to the summary file and also to
standard output.

To find the most recent error, we first select all `ERROR` entries and then
take only the last of them using `tail`.  Since the entries are sorted in
ascending order by date-time, we are guaranteed to obtain the most error.

## Output

    $ ./analyze-logs.sh log.txt
    Number of logs: 5
    Number of errors: 3
    Number of warnings: 1
    Number of infos: 1
    Most recent error: 2025-01-12 10:18:29 ERROR Segmentation fault

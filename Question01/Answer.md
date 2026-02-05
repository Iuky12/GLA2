# Question 1

In `analyze.sh`, we first check whether the user has supplied exactly one
command line argument.  If that is not the case, we print an error message
to standard error and exit.

Next, we evaluate the file type of the argument (i.e. file or directory).
If it is a file, we invoke the `wc` command to compute characters, words,
and lines in it.  However, if it is directory, we use the `find` command to
count the number of files and text files, by printing the letter `x` for
every file found and counting the number of characters with `wc -c`.

If the supplied argument is neither a file nor a directory, we print an
error message to standard error and exit.

## Output

    $ ./analyze.sh my-test-file
    Lines: 2
    Words: 4
    Chars: 23
    $ ./analyze.sh my-test-dir
    Total number of files: 5
    Total number of .txt files: 2

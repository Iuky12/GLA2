# Question 8

In this script, we have to asynchronously move a list of files into a
subdirectory of the given directory.  To accomplish this, we begin by
checking whether the user has supplied a valid directory, and we exit if it
is not the case.  Then, we build a list of files to process by globbing and
appending to an array.  Next, we start a background process for each file
by using the `&` operator, while saving the child process id into an array.
Finally, we wait for all child processes to exit, and we return zero if
every child process was succesful.

## Output

    $ ls -R my-test-dir/
    my-test-dir/:
    a  b  c
    $
    $ ./bg_move.sh my-test-dir/
    Shell PID: 35219
    Background PID: 35221
    Background PID: 35222
    Background PID: 35223
    $
    $ ls -R my-test-dir/
    my-test-dir/:
    backup

    my-test-dir/backup:
    a  b  c

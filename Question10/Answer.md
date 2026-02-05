# Question 10

In this program, we demonstrate signal handling and child process creation
and clean up.  We begin by registering two signal handlers using the
`signal()` system call.  Then we create two child processes, the first of
which sleeps for five seconds and sends `SIGTERM` to the parent process;
and the second of which sleeps for 10 seconds and sends `SIGINT` to the
parent process.  Since the parent process has registered handlers for both
signals, the kernel does not terminate it on receiving them.

The parent waits for both processes to terminate using the `waitpid()`
system call, and prints a diagnostic message to announce the same.
Finally, it exits.

## Output

    $ make
    cc    -c -o prog.o prog.c
    cc -o prog prog.o
    $
    $ ./prog
    Caught SIGTERM
    Child with PID 89217 terminated with exit status: 0
    Caught SIGINT
    Child with PID 89218 terminated with exit status: 0

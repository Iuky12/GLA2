# Question 9

In our C program `prog.c`, we demonstrate zombie process preventation and
proper method of child process clean-up.  We create four child processes,
each of which sleep for a few seconds and exit with a status code.

The parent process records the process ids of each of its child processes
after creating them, and uses the `waitpid()` system call to block till
each of them change state (by terminating).  This protocol causes the
kernel to release resources allocated to child processes, and prevents the
creation of zombie processes.

## Output

    $ make
    cc    -c -o prog.o prog.c
    cc -o prog prog.o
    $
    $ ./prog
    Child with PID 88233 terminated with exit status: 8
    Child with PID 88234 terminated with exit status: 8
    Child with PID 88235 terminated with exit status: 8
    Child with PID 88236 terminated with exit status: 8
    $
    $ echo $?
    0

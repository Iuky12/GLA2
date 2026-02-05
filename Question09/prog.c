#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(void)
{
    int status;
    pid_t pid, child_pids[4];

    for (int i = 0; i < 4; i++) {
        pid = fork();
        if (pid == 0) {         // Child
           sleep(5);
           exit(8);
        }
        else
            child_pids[i] = pid;
    }

    for (int i = 0; i < 4; i++) {
        pid = waitpid(child_pids[i], &status, 0);
        if (WIFEXITED(status))
            printf("Child with PID %d terminated with exit status: %d\n", pid, WEXITSTATUS(status));
        else
            printf("Child with PID %d did not terminate normally.\n", pid);
    }

    exit(EXIT_SUCCESS);
}

#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

static void sigterm_handler(int);
static void sigint_handler(int);

int main(void)
{
    int status;
    pid_t pid;

    signal(SIGTERM, sigterm_handler);
    signal(SIGINT, sigint_handler);

    // First child
    if (fork() == 0) {
        pid_t parent_pid = getppid();
        sleep(5);
        kill(parent_pid, SIGTERM);
        exit(EXIT_SUCCESS);
    }

    // Second child
    if (fork() == 0) {
        pid_t parent_pid = getppid();
        sleep(10);
        kill(parent_pid, SIGINT);
        exit(EXIT_SUCCESS);
    }

    for (int i = 0; i < 2; i++) {
        pid = waitpid(-1, &status, 0);
        if (WIFEXITED(status))
            printf("Child with PID %d terminated with exit status: %d\n", pid, WEXITSTATUS(status));
        else
            printf("Child with PID %d did not terminate normally.\n", pid);
    }
    exit(EXIT_SUCCESS);
}

static void sigterm_handler(int signo)
{
    fprintf(stderr, "Caught SIGTERM\n");
}

static void sigint_handler(int signo)
{
    fprintf(stderr, "Caught SIGINT\n");
}

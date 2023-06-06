#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#define EVER ;;


int main(int argc, char **argv) // Main function
{
    int n;                                          // Number of processes to create
    if ((n = (argc == 1) ? 1 : atol(argv[1])) <= 0) // If number of processes is not positive
    {
        fprintf(stderr, "Use: %s [<n>]\n", argv[0]); // Print usage message
        return (1);                                  // Exit with error
    }
    if (fork()) /* Passa para background */
        exit(0);
    while (n-- > 0)
    {
        if (fork() == 0)
            exit(0); /* Filhos falecem ... */
    }
    for (EVER)
        pause(); /* ... e o pai nem liga */
    return (0);
}
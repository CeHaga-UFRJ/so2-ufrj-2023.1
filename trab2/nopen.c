#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>

int isopen(int fd) {
    int result;

    // Tenta pegar o status do descritor fd
    struct stat buf;
    result = fstat(fd, &buf);

    // Se a chamada ao sistema retornar -1, então ocorreu um erro
    // Se o erro for EBADF, então o descritor não está aberto
    if(result == -1 && errno == EBADF) return 0;
    
    // O descritor está aberto, a função retorna 1
    return 1;
}

int main (void){
    int nopen, fd;
    for (nopen = fd = 0; fd < getdtablesize(); fd++){
        if (isopen (fd)) nopen++;
    }
    printf ("Existem %d descritores abertos\n", nopen);
    return (0);
} 
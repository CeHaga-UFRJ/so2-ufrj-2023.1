#include <sys/stat.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <dirent.h>

int walk_dir(const char *path, void (*func)(const char *))
{
    DIR *dirp;
    struct dirent *dp;
    char *p, *full_path;
    int len;
    /* abre o diretório */
    if ((dirp = opendir(path)) == NULL)
        return (-1);
    len = strlen(path);
    /* aloca uma área na qual, garantidamente, o caminho caberá */
    if ((full_path = malloc(len + NAME_MAX + 2)) == NULL)
    {
        closedir(dirp);
        return (-1);
    }
    /* copia o prefixo e acrescenta a ‘/’ ao final */
    memcpy(full_path, path, len);
    p = full_path + len;
    *p++ = '/'; /* deixa “p” no lugar certo! */
    while ((dp = readdir(dirp)) != NULL)
    {
        /* ignora as entradas “.” e “..” */
        if (strcmp(dp->d_name, ".") == 0 || strcmp(dp->d_name, "..") == 0)
            continue;
        strcpy(p, dp->d_name);
        /* “full_path” armazena o caminho */
        (*func)(full_path);
    }
    free(full_path);
    closedir(dirp);
    return (0);
}

int walk_count_path(const char *fpath, int type)
{
    int count = 0;
    void count_path(const char *fpath)
    {
        struct stat sb;
        if (stat(fpath, &sb) == 0 && (sb.st_mode & S_IFMT) == type)
        {
            count++;
            printf("%d. %s\n", count, fpath);
        }
    }
    walk_dir(fpath, count_path);
    return count;
}

void print_count(const char *fpath, int count)
{
    switch (count)
    {
    case 0:
        printf("Em %s não há arquivos do tipo especificado\n", fpath);
        break;
    case 1:
        printf("Em %s há 1 arquivo do tipo especificado\n", fpath);
        break;
    default:
        printf("Em %s há %d arquivos do tipo especificado\n", fpath, count);
        break;
    }
    printf("\n");
}

int main(int argc, char *argv[])
{
    int opt, type = S_IFREG;
    opterr = 0;
    int multiFlag = 0;
    while ((opt = getopt(argc, argv, "rdlbc")) != -1)
    {
        if (multiFlag)
        {
            printf("Os modificadores são mutuamente exclusivos\n");
            printf("Usage: %s [-rdlbc] [<dir> ...]\n", argv[0]);
            exit(EXIT_FAILURE);
        }
        multiFlag = 1;
        switch (opt)
        {
        case 'r':
            type = S_IFREG;
            break;
        case 'd':
            type = S_IFDIR;
            break;
        case 'l':
            type = S_IFLNK;
            break;
        case 'b':
            type = S_IFBLK;
            break;
        case 'c':
            type = S_IFCHR;
            break;
        default:
            printf("Usage: %s [-rdlbc] [<dir> ...]\n", argv[0]);
            exit(EXIT_FAILURE);
        }
    }

    int totalCount = 0;

    if (optind == argc)
    {
        printf("Nenhum caminho especificado, usando o diretório atual\n");
        char *path = ".";
        int count = walk_count_path(path, type);
        totalCount += count;
        print_count(path, count);
    }

    for (int i = optind; i < argc; i++)
    {
        char *path = argv[i];
        printf("Acessando o diretório %s\n", path);
        int count = walk_count_path(path, type);
        totalCount += count;
        print_count(path, count);
    }

    printf("Total de arquivos do tipo especificado: %d\n", totalCount);
    return 0;
}

#include <dirent.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_LINE_LENGTH 512

void log_zombies(FILE *log_file) {
  DIR *proc_dir = opendir("/proc");
  struct dirent *entry;

  if (proc_dir == NULL) {
    fprintf(stderr, "Erro ao abrir diretório /proc\n");
    exit(1);
  }

  while ((entry = readdir(proc_dir)) != NULL) {
    if (entry->d_type == DT_DIR && atoi(entry->d_name) != 0) {
      char status_path[MAX_LINE_LENGTH];
      FILE *status_file;
      char line[MAX_LINE_LENGTH];
      char name[MAX_LINE_LENGTH];
      int pid, ppid, isZombie = 0;

      snprintf(status_path, sizeof(status_path), "/proc/%s/status",
               entry->d_name);

      status_file = fopen(status_path, "r");
      if (status_file == NULL) {
        continue;
      }

      while (fgets(line, sizeof(line), status_file) != NULL) {
        if (strncmp(line, "Name:", 5) == 0) {
          sscanf(line, "%*s %s", name);
        } else if (strncmp(line, "State:", 6) == 0) {
          if (line[7] == 'Z') {
            isZombie = 1;
          }
        } else if (strncmp(line, "Pid:", 4) == 0) {
          sscanf(line, "%*s %d", &pid);
        } else if (strncmp(line, "PPid:", 5) == 0) {
          sscanf(line, "%*s %d", &ppid);
        }
      }

      fclose(status_file);

      if (isZombie) {
        fprintf(log_file, "%d | %d | %s\n", pid, ppid, name);
      }
    }
  }

  fprintf(log_file, "==========================================\n");

  closedir(proc_dir);
}

void handle_signal(int sig) {
  FILE *log_file = fopen("zombies.log", "a");
  if (log_file == NULL) {
    fprintf(stderr, "Erro ao abrir arquivo de log\n");
    exit(1);
  }

  fprintf(log_file, "Programa encerrado\n");
  fclose(log_file);

  exit(0);
}

int main(int argc, char **argv) {
  int interval;

  if (argc != 2) {
    fprintf(stderr, "Usage: %s <intervalo>\n", argv[0]);
    exit(1);
  }

  interval = atoi(argv[1]);
  if (interval <= 0) {
    fprintf(stderr, "Intervalo precisa ser um inteiro positivo\n");
    exit(1);
  }

  if (fork() != 0) {
    exit(0);
  }

  signal(SIGTERM, handle_signal);

  FILE *log_file = fopen("zombies.log", "w");
  if (log_file == NULL) {
    fprintf(stderr, "Erro ao criar arquivo de log\n");
    return 1;
  }

  fprintf(log_file, "PID | PPID | Nome do Programa\n");
  fprintf(log_file, "==========================================\n");

  while (1) {
    log_zombies(log_file);
    fflush(log_file);
    sleep(interval);
  }

  fclose(log_file);

  return 0;
}

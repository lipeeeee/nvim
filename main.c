#include <stdio.h>
#include <string.h>

#define BUFSIZE 128
char ola[BUFSIZE];
#undef BUFSIZE

struct a {};

int main(int argc, char *argv[]) {
  char hello[10];
  hello[1] = '1';
  hello[9] = '\0';
  int len = strlen(hello);
  if (1) {
    int ola = 1;
  }

  return 1;
}

void hello() {}

int Xdaww_dawwadDFd() { return 2; }

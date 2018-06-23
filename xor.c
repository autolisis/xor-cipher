#include <stdio.h>
#include <string.h>
#include <unistd.h>

char buf[4096];
const char *key;
int keyPos = 0;

char *defKey = "HELLO";

int main(int argc, char const *argv[]) {
  if (argc <= 1) {
    printf("Please enter key\n");
    return 1;
  } else
    key = argv[1];
  /* key = defKey; */

  int bytesRead = read(STDIN_FILENO, buf, 4096);
  while (bytesRead > 0) {
    for (int i = 0; i < bytesRead; i++) {
      buf[i] = buf[i] ^ key[i % strlen(key)];
    }
    write(STDOUT_FILENO, buf, bytesRead);
    bytesRead = read(STDIN_FILENO, buf, 4096);
  }

  return 0;
}

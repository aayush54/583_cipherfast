#include <stdio.h>

int main(int argc, char** argv) {
  char secret_pool[3][10] = {{'A'}, {'B'}, {'C'}};
  /* if (argc > 1) {
    printf("Hello, the input is %s\n", argv[1]); */
    for (int i = 0; i < 10; ++i) printf("%d ", secret_pool[1][i]);
    printf("EOF\n");
    for (int i = 0; i < 10; ++i) secret_pool[1][i] += i;
    for (int i = 0; i < 10; ++i) printf("%d ", secret_pool[1][i]);
    printf("EOF\n");
  // } else printf("no enough inputs\n");
  return 0;
}

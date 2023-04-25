#include <stdio.h>
#include <stdint.h>
// #include "maskmap.h"

extern int32_t printPrompt(int64_t);

int main() {
  // uint64_t fixedArray[128];
  // for (int i = 0; i < 128; ++i) fixedArray[i] = i * 299;
  // int rslt0 = recordMask((void *)fixedArray, fixedArray[29]);
  // int rslt1 = isMasked((void *)fixedArray);
  // uint64_t rslt2 = findMask((void *)fixedArray);
  // printf("[1] %d [2] %d [3] %ld\n", rslt0, rslt1, rslt2);
  
  // printf("%d\n", printPrompt(2345));
  printPrompt(2345);
  return 0;
}

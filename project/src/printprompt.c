#include <stdio.h>
#include <stdint.h>

int32_t printPrompt(int64_t numIn) {
  int64_t numOut = (numIn * 29) % 253;
  printf("intermidate result: %ld\n", numOut);
  return ((int32_t)numOut);
}

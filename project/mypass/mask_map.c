#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#define CAPACITY 0x100000
#define HASHPOS  0x0FFFFF

typedef struct {
  void* addr;
  uint64_t mask;
} MapEntry;

MapEntry* maskMap;

void initMap() {
  maskMap = malloc(CAPACITY * sizeof(MapEntry));
  for (int i = 0; i < CAPACITY; i++) {
    maskMap[i].addr = NULL;
    maskMap[i].mask = 0;
  }
}

void killMap() { free(maskMap); }

void recordMask(void* addrIn, uint64_t maskIn) {
  unsigned int hash = ((uint64_t)addrIn) & HASHPOS;
  while (maskMap[hash].addr != NULL) {
    if (maskMap[hash].addr == addrIn) {
      maskMap[hash].mask = maskIn;
      return;
    }
    hash = (hash + 1) & HASHPOS;
  }
  maskMap[hash].addr = addrIn;
  maskMap[hash].mask = maskIn;
}

uint64_t findMask(void *addrIn) {
  unsigned int hash = ((uint64_t)addrIn) & HASHPOS;
  while (maskMap[hash].addr != NULL) {
    if (maskMap[hash].addr == addrIn) {
      return maskMap[hash].mask;
    }
    hash = (hash + 1) & HASHPOS;
  }
  return 0;
}


/* int main() {
  initMap();
  int x[64], y[32], z[16];
  x[32] = 127;
  y[16] = 63;
  z[8] = 31;

  recordMask((void *)x, 0x13579A);
  recordMask((void *)y, 0xBCDEF0);
  recordMask((void *)z, 0x2468);

  printf("key1: %08lx\n", findMask((void *)x));
  printf("key2: %08lx\n", findMask((void *)y));
  printf("key3: %08lx\n", findMask((void *)z));

  killMap();
  return 0;
} */


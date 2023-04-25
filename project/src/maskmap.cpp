#include <cstdint>
#include <unordered_map>
#include "maskmap.h"

std::unordered_map< void*, uint64_t > maskMap;

int32_t recordMask(void* memAddr, uint64_t maskVal) {
  maskMap[memAddr] = maskVal;
  return 0;
}

int32_t isMasked(void* memAddr) { return (maskMap.find(memAddr) != maskMap.end()); }

uint64_t findMask(void* memAddr) { return maskMap[memAddr]; }


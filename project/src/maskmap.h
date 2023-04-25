#ifndef MASK_MAP_H
#define MASK_MAP_H

#include <stdint.h>
int32_t recordMask(void*, uint64_t);
int32_t isMasked(void*);
uint64_t findMask(void*);

#endif

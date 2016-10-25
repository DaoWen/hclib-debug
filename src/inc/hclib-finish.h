#ifndef HCLIB_FINISH_H
#define HCLIB_FINISH_H

#include "hclib-promise.h"
#include "hclib-atomics.h"

typedef struct finish_t {
    struct finish_t* parent;
    _Atomic int counter;
    hclib_future_t ** finish_deps;
} finish_t;

#endif

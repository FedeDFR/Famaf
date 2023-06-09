#include <stdio.h>
#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>

#include "counter.h"

struct _counter {
    unsigned int count;
};

counter counter_init(void) {
    counter n = malloc(sizeof(struct _counter));
    n->count = 0;

    return n;
}

void counter_inc(counter c) {
    c->count++;
}

bool counter_is_init(counter c) {
    bool b = (c->count == 0);

    return b;
}

void counter_dec(counter c) {
    assert(!counter_is_init(c));
    c->count--;
}

counter counter_copy(counter c) {
    counter p = malloc(sizeof(struct _counter));
    p->count = c->count;

    return p;
}

void counter_destroy(counter c) {
    free(c);
}


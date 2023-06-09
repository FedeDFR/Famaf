#include <assert.h>
#include <stdlib.h>  /* EXIT_SUCCESS... */
#include <stdio.h>   /* printf()...     */
#include "pair.h"    /* TAD Par         */

pair_t pair_new(int x, int y) {
    pair_t par = malloc(sizeof(struct s_pair_t));;

    par->fst = x;
    par->snd = y;

    return par;
}

int pair_first(pair_t p) {
    int primero;

    assert(p != NULL);

    primero = p->fst;

    return primero;
}

int pair_second(pair_t p) {
    int segundo;

    assert(p != NULL);

    segundo = p->snd;

    return segundo;
}

pair_t pair_swapped(pair_t p) {
    pair_t q = malloc(sizeof(struct s_pair_t));

    assert(p != NULL);

    q->fst = p->snd;
    q->snd = p->fst;

    return q;
}

pair_t pair_destroy(pair_t p) {
    free(p);
    return NULL;
}
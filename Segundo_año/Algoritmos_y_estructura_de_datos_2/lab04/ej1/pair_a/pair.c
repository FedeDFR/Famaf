#include <stdlib.h>  /* EXIT_SUCCESS... */
#include <stdio.h>   /* printf()...     */
#include "pair.h"    /* TAD Par         */

pair_t pair_new(int x, int y) {
    pair_t este;

    este.fst = x;
    este.snd = y;

    return este;
}

int pair_first(pair_t p) {
    int primero = p.fst;

    return primero;
}

int pair_second(pair_t p) {
    int segundo = p.snd;

    return segundo;
}

pair_t pair_swapped(pair_t p) {
    int aux;

    aux = p.fst;
    p.fst = p.snd;
    p.snd = aux;

    return p;
}

pair_t pair_destroy(pair_t p) {     //como no utilizo memoria dinamica no hay nada que liberar
    return p;
}
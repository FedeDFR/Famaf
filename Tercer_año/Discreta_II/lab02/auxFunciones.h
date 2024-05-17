#ifndef AUXFUNC_H
#define AUXFUNC_H

#include <stdio.h>
#include <stdlib.h>

#include "API2024Parte2.h"

// Funciones para ElimGarak

// En este quick sort lo que hago es ordenar de menor a mayor a "a" y copio este orden en el arreglo "b"

void mergeElim(u32 arr[], u32 b[], u32 l, u32 m, u32 r);

void mergeSortElim(u32 arr[], u32 b[], u32 l, u32 r);

#endif

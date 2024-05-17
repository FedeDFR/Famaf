#ifndef APIG2024_H
#define APIG2024_H

#include "../parte-1/APIG24.h"
#include "sort.h"

#define ErrorCode 4294967295

u32 Greedy(Grafo G,u32* Orden);

char GulDukat(Grafo G,u32* Orden);

char ElimGarak(Grafo G,u32* Orden);

#endif
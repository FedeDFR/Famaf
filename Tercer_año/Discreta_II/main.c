#include <stdio.h>
#include <stdlib.h>

#include "APIG24.h"
#include "EstructuraGrafo24.h"

int main () {

    Grafo G = ConstruirGrafo();

    printf("Hola2 %u\n", NumeroDeLados(G));

    DestruirGrafo(G);
}
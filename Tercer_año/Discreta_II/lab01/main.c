#include <stdio.h>
#include <stdlib.h>

#include "APIG24.h"
#include "EstructuraGrafo24.h"

int main () {

    Grafo G = ConstruirGrafo();

    for (size_t i = 0; i < NumeroDeVertices(G); i++) {
        AsignarColor((i*i), i, G);
    }
    
    color array[NumeroDeVertices(G)];

    for (size_t i = 0; i < NumeroDeVertices(G); i++) {
        ExtraerColores(G, array);
    }
    
    for (size_t i = 0; i < NumeroDeVertices(G); i++) {
        printf("%u\n", array[i]);
    }
    
    DestruirGrafo(G);
}
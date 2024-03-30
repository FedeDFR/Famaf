#include <stdio.h>
#include <stdlib.h>

#include "APIG24.h"
#include "EstructuraGrafo24.h"

int main (int argc, char *argv[]) {
    printf("Hola1\n");
    char *filepath = NULL;
    filepath = parse_filepath(argc, argv);
    printf("HOLa4\n");

    Grafo G = ConstruirGrafo(filepath);

    printf("%u\n", G->delta);
    printf("Hola2\n");
}
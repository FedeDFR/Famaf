#include <stdio.h>
#include <stdlib.h>

#include "APIG24.h"
#include "EstructuraGrafo24.h"


Grafo ConstruirGrafo(const char *filepath){

    FILE *file = NULL;

    file = fopen(filepath, "r");
    if (file == NULL) {
        fprintf(stderr, "File does not exist.\n");
        exit(EXIT_FAILURE);
    }

    Grafo G = NULL;
    
    ingresar_verices_lados(G, file);

    for (size_t i = 0; i < G->lados; i++) {   
        ingresar_lado(G, file);
    }
    
    fclose(file);
    return G;
}

void ingresar_verices_lados(Grafo G, FILE* file) {

    u32 guarda = 1;
    u32 chek;
    u32 n, m;
    u32 tipo;
    char trash[100];

    while (guarda) {
        tipo = fgetc(file);
        
        if (tipo == 'p') {
            guarda = 0;
            chek = fscanf(file, " edge %u %u\n", &n, &m);
            if (chek < 2) {
                exit(EXIT_FAILURE);
            }
            
        } else if (tipo == 'c') {
            char *t = fgets(trash, 100, file);
            if (t == NULL) {
                exit(EXIT_FAILURE);
            }
        }
    }

    G = malloc(sizeof(struct GrafoSt));

    G->nodos = malloc(sizeof(vertice) * n);
    G->cantnodos = n;
    G->lados = m;
    G->delta = 0;
    
    for (size_t i = 0; i < n; i++) {
        G->nodos[i] = malloc(sizeof(struct _vertice));
        G->nodos[i]->vecinos = NULL;
        G->nodos[i]->grado = 0;
        G->nodos[i]->c = 0;
    }
}

void ingresar_lado(Grafo G, FILE* file) {

    u32 v, w;
    u32 chek;

    chek = fscanf(file, "e %u %u\n", &v, &w);

    if (chek < 2) {
        exit(EXIT_FAILURE);
    }

    G->nodos[v]->grado++;
    G->nodos[v]->vecinos = realloc(G->nodos[v]->vecinos, sizeof(u32) * G->nodos[v]->grado);
    G->nodos[v]->vecinos[G->nodos[v]->grado - 1] = w;

    G->nodos[w]->grado++;
    G->nodos[w]->vecinos = realloc(G->nodos[w]->vecinos, sizeof(u32) * G->nodos[w]->grado);
    G->nodos[w]->vecinos[G->nodos[w]->grado - 1] = v;

    if (G->nodos[v]->grado > G->delta)
    {
        G->delta = G->nodos[v]->grado;
    } else 
        {
        if (G->nodos[w]->grado > G->delta)
        {
            G->delta = G->nodos[w]->grado;
        }
    }
}


void DestruirGrafo(Grafo G){

    free(G->nodos);
    G->nodos = NULL;
    free(G);
    G = NULL;

}

u32 NumeroDeVertices(Grafo G){
    return G->cantnodos;
}

u32 NumeroDeLados(Grafo G){
    return G->lados;
}

u32 Delta(Grafo G){
    return G->delta;
}

u32 Grado(u32 i,Grafo G){
    if (i >= G->cantnodos)
    {
        return 0;
    } else {
        return G->nodos[i]->grado;
    }
}

color Color(u32 i,Grafo G){
    if (i >= G->cantnodos)
    {
        return 4294967295;
    } else {
        return G->nodos[i]->c;
    }
}

u32 Vecino(u32 j,u32 i,Grafo G){
    if (i >= G->cantnodos)
    {
        return 4294967295;
    } else {
        if (j >= G->nodos[i]->grado)
        {
            return 4294967295;
        } else {
            return G->nodos[i]->vecinos[j];
        }
    }
}

void AsignarColor(color x,u32 i,Grafo  G){
    if (i < G->cantnodos)
    {
        G->nodos[i]->c = x;
    }
}

void ExtraerColores(Grafo G,color* Color){
    for (size_t i = 0; i < G->cantnodos; i++)
    {
        Color[i] = G->nodos[i]->c;
    }
}

void ImportarColores(color* Color,Grafo  G){
    for (size_t i = 0; i < G->cantnodos; i++)
    {
        G->nodos[i]->c = Color[i];
    }
}

char *parse_filepath(int argc, char *argv[]) {

    char *result = NULL;

    if (argc < 2) {
        exit(EXIT_FAILURE);
    }

    result = argv[1];
    return (result);
}

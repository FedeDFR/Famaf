#ifndef EstructuraGrafo24_H
#define EstructuraGrafo24_H


typedef unsigned int u32;

typedef struct _vertice vertice;

typedef struct GrafoSt * Grafo;

typedef u32 color;

struct _vertice{
    color c;
    u32 grado;
    u32 *vecinos;
};

struct GrafoSt{
    vertice **nodos;
    u32 cantnodos;
    u32 lados;
    u32 delta;    
};


#endif
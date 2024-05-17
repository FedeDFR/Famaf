#include <stdio.h>
#include <stdlib.h>

#include "API2024Parte2.h"
#include "../parte-1/APIG24.h"

bool esPropio(Grafo G){
    u32 n = NumeroDeVertices(G);
    bool res = true;

    for (size_t i = 0; i < n; i++)
    {
        for (size_t j = 0; i < Grado(i, G); i++)
            res = res && (Color(i, G) != Color(Vecino(j, i, G), G));
        
        if (!res)
            break;
    }
    
    return res;
}

int main(){
    Grafo G = ConstruirGrafo();
    u32 n = NumeroDeVertices(G);
    bool check = true;
    u32 trash = 0;

    u32* Orden = malloc(sizeof(u32) * n);

    GulDukat(G, Orden);
    printf("\n");
    for (size_t i = 0; i < n; i++)
        printf("%d \n", Orden[i]);

    
    trash = Greedy(G, Orden);
    printf("color mas alto %d \n", trash);

    check = esPropio(G);

    if (!check)
    {
        printf("El coloreo no es propio \n");
        return 0;
    }

    ElimGarak(G, Orden);
    printf("\n");
    for (size_t i = 0; i < n; i++)
        printf("%d \n", Orden[i]);
    
    Greedy(G, Orden);
    check = esPropio(G);

    if (!check)
    {
        printf("El coloreo no es propio \n");
        return 0;
    }

    DestruirGrafo(G);
}
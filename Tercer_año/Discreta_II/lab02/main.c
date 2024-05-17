#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "API2024Parte2.h"
#include "../parte-1/APIG24.h"
#include "auxData.h"
#include "sort.h"

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

u32 runGreedy(Grafo G, u32* Orden){
    u32 trash = 0;

    trash = Greedy(G, Orden);
    printf("color mas alto fue %d \n", trash);
    return trash;
}

void printOrden(u32* Orden, u32 length){
    printf("El orden es: %d", Orden[0]);
    for (size_t i = 1; i < length; i++)
        printf(", %d", Orden[i]);    
    printf("\n");
}

u32 checkeos(Grafo G, u32 check, u32 aux){
    assert(esPropio(G));
    assert(check <= aux);
    return aux;
}

u32 GulElim50 (Grafo G, u32* Orden, u32 check, u32 aux) {
    for (size_t i = 0; i < 50; i++) {
        char Error = '0';

        printf("Usando GulDukat\n");
        Error = GulDukat(G, Orden);
        if (Error == '1'){
            printf("Error al correr GulDukat :(\n");
            assert(0);
        }

        check = runGreedy(G, Orden);
        
        aux = checkeos(G, check, aux);

        printf("Usando ElimGarak\n");
        Error = ElimGarak(G, Orden);
        if (Error == '1'){
            printf("Error al correr ElimGarak :(\n");
            assert(0);
        }

        check = runGreedy(G, Orden);
        
        aux = checkeos(G, check, aux);
    }

    return check;
}

void RadomGulElim500 (Grafo G, u32* Orden, u32 check, u32 aux){
    int numero = 0;
    char Error = '0';
    for (size_t i = 0; i < 500; i++)
    {
        printf("eligiendo orden...\n");
        numero = rand() % 2;
        if (numero == 0)
        {
            printf("GulDukat elegido\n");
            Error = GulDukat(G, Orden);
            if (Error == '1'){
                printf("Error al correr GulDukat :(\n");
                assert(0);
            }

            check = runGreedy(G, Orden);
        
            aux = checkeos(G, check, aux);
        } else {
            printf("ElimGarak elegido\n");
            Error = ElimGarak(G, Orden);
            if (Error == '1'){
                printf("Error al correr ElimGarak :(\n");
                assert(0);
            }

            check = runGreedy(G, Orden);
        
            aux = checkeos(G, check, aux);
        }
    }
}

int main(){
    Grafo G = ConstruirGrafo();
    u32 n = NumeroDeVertices(G);
    u32 check = 0, aux = -1; 

    u32* Orden = malloc(sizeof(u32) * n);

    u32 DatosCantColor[5];

    color *DatosColoreo[5];
    for (size_t i = 0; i < 5; i++)
        DatosColoreo[i] = (color*)malloc(n * sizeof(color));

    

    //1) el orden natural 0,1,...,n-1 de los vertices,
    printf("Corriendo greedy con el orden natural...\n");
    for (size_t i = 0; i < n; i++)
        Orden[i] = i;

    printOrden(Orden, n);
    
    check = runGreedy(G, Orden);
    aux = checkeos(G, check, aux);

    check = GulElim50(G, Orden, check, aux);

    DatosCantColor[0] = check;
    ExtraerColores(G, DatosColoreo[0]);


    //2) el orden n-1,...,2,1,0
    check = 0;
    aux = -1;
    printf("Corriendo greedy con el orden natural invertido...\n");
    for (size_t i = 0; i < n; i++)
        Orden[i] = n-i-1;
        
    printOrden(Orden, n);

    check = runGreedy(G, Orden);

    aux = checkeos(G, check, aux);

    check = GulElim50(G, Orden, check, aux);

    DatosCantColor[1] = check;
    ExtraerColores(G, DatosColoreo[1]);

    //3) el orden poniendo primero todos los pares en orden decreciente y luego todos los impares, en orden creciente.
    check = 0;
    aux = -1;
    int count = 0;
    printf("Corriendo greedy, primero pares decreciente, luego impares creciente...\n");
    for (size_t i = 0; i < n; i += 2)
    {
        Orden[count] = i;
        count++;
    }

    count = 1;
    for (size_t i = 1; i < n; i += 2)
    {
        Orden[n-count] = i;
        count++;
    }

    printOrden(Orden, n);

    check = runGreedy(G, Orden);
    
    aux = checkeos(G, check, aux);

    check = GulElim50(G, Orden, check, aux);

    DatosCantColor[2] = check;
    ExtraerColores(G, DatosColoreo[2]);


    //4) ordenar los vertices de acuerdo con su grado
    check = 0;
    aux = -1;
    auxData grados[n];
    printf("Corriendo greedy con orden de acuerdo a los grados...\n");
    for (size_t i = 0; i < n; i++)
    {
        grados[i].grado = Grado(i, G);
        grados[i].nodo = i;
    }

    mergeSort(grados, 0, n-1);

    for (size_t i = 0; i < n; i++)
        Orden[i] = grados[i].nodo;
    
    printOrden(Orden, n);

    check = runGreedy(G, Orden);
    
    aux = checkeos(G, check, aux);

    check = GulElim50(G, Orden, check, aux);

    DatosCantColor[3] = check;
    ExtraerColores(G, DatosColoreo[3]);

    //5) algun orden extra, elegido por ustedes.
    check = 0;
    aux = -1;
    count = 0;
    printf("Corriendo greedy, primero impares decreciente, luego pares creciente...\n");
    for (size_t i = 1; i < n; i += 2)
    {
        Orden[count] = i;
        count++;
    }

    count = 1;
    for (size_t i = 0; i < n; i += 2)
    {
        Orden[n-count] = i;
        count++;
    }

    printOrden(Orden, n);

    check = runGreedy(G, Orden);
   
    aux = checkeos(G, check, aux);

    check = GulElim50(G, Orden, check, aux);

    DatosCantColor[4] = check;
    ExtraerColores(G, DatosColoreo[4]);


    // Veo cual es el mejor coloreo
    u32 minCol = -1;
    u32 mejorColoreo = 0;
    for (u32 i = 0; i < 5; i++) {
        if (minCol > DatosCantColor[i]) {
            minCol = DatosCantColor[i];
            mejorColoreo = i;
        }   
    }


    // Asigno el mejor coloreo
    for (u32 i = 0; i < n; i++) {
        AsignarColor(DatosColoreo[mejorColoreo][i], i, G);
    }

    check = 0;
    aux = -1;
    RadomGulElim500 (G, Orden, check, aux);    

    DestruirGrafo(G);

    return EXIT_SUCCESS;
}
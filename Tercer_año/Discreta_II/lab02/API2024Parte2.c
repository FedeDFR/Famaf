#include <stdio.h>
#include <stdlib.h>

#include "API2024Parte2.h"
#include "auxData.h"
#include "auxFunciones.h"
#include "../parte-1/APIG24.h"

//Funciones auxiliares

//Encuentra el color con el que hay que pintar el vertice i en G
color FindColor(u32 i, Grafo G){
    color col = 0;
    unsigned int cantVecinos = Grado(i, G);
    int aux = 0;

    //listC va a llevar una cuenta de cuantas veces aparece un color en los vecinos de i
    color listC[Delta(G) + 2];
    for (size_t i = 0; i < Delta(G) + 2; i++)
        listC[i] = 0;

    for (size_t j = 0; j < cantVecinos; j++)
        listC[Color(Vecino(j, i, G), G)]++;
    
    aux = 1;
    while (col == 0)
    {
        if (listC[aux] == 0)
            col = aux ;              // Revisar si daria error usando el maximo de colores (en los Kn quizas)

        aux++;
    }

    return col;
}

// Funcion para dar el orden de los colores en GulDukat
u32* OrdGD(Grafo G, auxData* vertices[], unsigned int indiceColor[], u32* Orden){
    unsigned int aux = 0, i = 3, j = 0;
    int rows = Delta(G) + 1;    

    u32 n = NumeroDeVertices(G);

    while (aux < n)
    {
        while (i < rows)        //Primero a los divisibles por 4
        {
            j = 0;
            while (j < indiceColor[i])
            {
                Orden[aux] = vertices[i][j].nodo;
                aux++;
                j++;
            }
            i = i + 4;
        }

        i = 1;
        while (i < rows)        //Luego a los divisibles por 2 y no por 4
        {
            j = 0;
            while (j < indiceColor[i])
            {
                Orden[aux] = vertices[i][j].nodo;
                aux++;
                j++;
            }
            i = i + 4;
        }
        
        i = 0;
        while (i < rows)        //Por ultimo a los impares
        {
            j = 0;
            while (j < indiceColor[i])
            {
                Orden[aux] = vertices[i][j].nodo;
                aux++;
                j++;
            }
            i = i + 2;
        }
        
    }

    return Orden;
}

//------------------------------------------------------------------

//Funciones principales

u32 Greedy(Grafo G,u32* Orden){
    u32 n = NumeroDeVertices(G);
    color aux;
    u32 ret = 0;
    
    //REVISAR SI Orden ES UNA BIYECCION

    for (size_t i = 0; i < n; i++)
    {
        aux = FindColor(Orden[i], G);
        if (aux > ret)
            ret = aux;
        
        AsignarColor(aux, Orden[i], G);
    }
    
    return ret;
}

char GulDukat(Grafo G,u32* Orden){
    char ret = '0';
    u32 n = NumeroDeVertices(G);
    int rows = Delta(G) + 1;
    //variable auxiliar para recorrer el grafo
    color colorAux = 0;                  
    //indica cuantos vertices voy guardando en la matriz, para un color i
    //al iterar sobre la matriz funciona como un "j"
    unsigned int indiceColor[rows];
    //for (size_t i = 0; i < rows; i++)  
    //    indiceColor[i] = 0;

    //matriz en la que i es el color i+1 y j es la posicion dentro del color
    auxData* vertices[rows];
    for (size_t i = 0; i < rows; i++){
        vertices[i] = (auxData*)malloc(n * sizeof(auxData));
        indiceColor[i] = 0;
    }
    color max = 0;
    //max seria nuestro r (cantidad de colores) asumiendo que el coloreo fue greedy

    //extrae los nodos de G a nuestra matriz
    for (size_t i = 0; i < n; i++)
    {
        if(Color(i, G) == 0){
            colorAux = 1;
        } else{
            colorAux = Color(i, G);
        }

        vertices[colorAux-1][indiceColor[colorAux-1]].grado = Grado(i, G);
        vertices[colorAux-1][indiceColor[colorAux-1]].nodo = i;
        indiceColor[colorAux-1]++;

        if (colorAux > max)
            max = colorAux;
    }

    //ordena cada arreglo (color) de 0 a max (r) 
    for (size_t i = 0; i < max; i++)
        mergeSort(vertices[i], 0, n - 1);
    
    Orden = OrdGD(G, vertices, indiceColor, Orden);
    
    for (int i = 0; i < rows; i++)
        free(vertices[i]);

    return ret;
}

char ElimGarak(Grafo G,u32* Orden){
    char ret = '1';

    u32 n_c = Delta(G) + 2;     // Tomo un color de mas porque cuento el color 0 
    u32 n_v = NumeroDeVertices(G);
    u32 CantColores[n_c];
    color OrdenColores[n_c];           
    auxData Vertices[n_v];

    // Inicializo CantColores en 0, guardo las posciones que tienen los colores originalmente en OrdenColores desde 1 a n-colores.
    for (u32 i = 0; i < n_c; i++) {
        CantColores[i] = 0;
        OrdenColores[i] = i;
    }

    // Guardo la cantidad vertices que tengo con el i-esimo color en CantColores[] {ej: si tengo CantColores[1] = 21 tengo 21 vertices con el color 1}.
    // Cargo todos los vertices en el array Vertices[].
    for (u32 i = 0; i < n_v; i++) {
        CantColores[Color(i, G)]++;

        Vertices[i].nodo = i;
        Vertices[i].grado = Grado(i, G);
        Vertices[i].c = Color(i, G);

        Orden[i] = -1;
    }
    // Copio el ordenamiento de CantColores de menor a mayor en OrdenColores asi se que colores van antes o despues
    mergeSortElim(CantColores, OrdenColores, 0, n_c);
    
    u32 sumCantColores[n_c+1];
    sumCantColores[0] = 0;
    
    // Hago un array de sumas parciales para saber en que orden va el primer vertice del j-esimo color {ya que sumo la cantidad de todos los vertices que irian antes}.
    for (u32 i = 0; i < n_c; i++) 
        sumCantColores[i+1] = sumCantColores[i] + CantColores[i];
    
    // Veo el primer vertice cargado en Verices[] y comienzo a buscar en OrdenColores[] en que poscicion del orden quedo el color del vertice.
    // En Orden[sumaCantColores] sumo el total de todos los vectores que van antes del color de este verice. Si ya esta ocupada esa posicion de Orden[],
    //      sumo uno a la suma parcial asi cada vez que quiera agregar uno no tengo que recorrer todo el color en busca de un lugar vacio en Orden[].
    for (u32 i = 0; i < n_v; i++) {
    
        u32 j = 0;
        while (OrdenColores[j] != Vertices[i].c) {
            j++;
        }

        if (Orden[sumCantColores[j]] != -1) {
            sumCantColores[j]++;
        }
        
        Orden[sumCantColores[j]] = Vertices[i].nodo;
    }
    
    ret = '0';
    return ret;
}
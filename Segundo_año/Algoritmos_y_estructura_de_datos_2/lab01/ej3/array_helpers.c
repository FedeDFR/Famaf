#include "array_helpers.h"
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

unsigned int array_from_file(int array[], unsigned int max_size, const char *filepath) {

    unsigned int max;
    int chequeo;
    FILE*f;         //formato para declara un fichero

    f = fopen(filepath, "r");        //abre el fichero que queres operar | fichero = fopen ( nombre-fichero, modo); | "r" solo se puede leer

    fscanf(f,"%u",&max);        //lee los datos del fichero y los guarda en una variable

    assert(max <= max_size);        // Chequeo que el tamaño no sea mayor al tamaño maximo

    if(f != NULL) {
        
        if (max <= 0) {     // Veo que no sea una array vacio, si lo es, ya digo que es array vacio
            return max;
        }

        for (unsigned int i = 0; i < max; i++) {
            
            chequeo = fscanf(f, "%d", &array[i]);

            assert(chequeo != -1);      //chequeo que no haya menos elementos que el tamaño ingresado

        }
        
        fclose(f);      //cierra el fichero

    } else {
        printf("Error");        //devuelve error si no encuentra algun fichero 
    }   
    return max;
}

void array_dump(int a[], unsigned int length) {

    if (length <= 0) {

        printf("[]\n");

    } else {

        printf("[");

        for (unsigned int i = 0; i < length; i++) {

            if (i == length-1){
                printf("%d]", a[i]);

            } else {
                printf("%d, ", a[i]);
            }
            
        }
    }
}
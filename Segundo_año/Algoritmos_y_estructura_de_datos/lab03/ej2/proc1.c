//gcc -Wall -Werror -pedantic -std=c99 proc1.c -o abs1
// ./abs1

#include <stdlib.h>
#include <stdio.h>

void absolute (int x, int y) {

    if (x >= 0) {
        y = x;
    } else {
        y = -x;
    }
}

int main(void) {

    int a = -10, res = 0;
    
    absolute (a, res);
    printf ("El valor absoluto es: %d\n", res);     //El valor impreso es el asignado al inicio del main (0) no el modificado por absolute 

    return EXIT_SUCCESS;
}

/*

No se muesta el valor correcto, el valor obrenido es 0 y no coincide con el prgrama en el legunauje teorico. 

*/


// gcc -Wall -Werror -Wextra -pedantic -std=c99 proc2.c -o abs2
// ./abs2

#include <stdlib.h>
#include <stdio.h>

void absolute(int x, int *y) {

    if (x >= 0) {
        *y = x;
    } else {
        *y = -x;
    }
}

int main(void) {

    int a = -10;
    int *res = NULL;
    res = &a;
    
    absolute (a, res);
    printf ("El valor absoluto es: %d\n", *res);

    return EXIT_SUCCESS;
}

/*

Se muestra el valor correcto, el valor obtenido es 10.
El parametro int *y es de tipo out.

*/


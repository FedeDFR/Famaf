#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

typedef struct {
    int cociente;
    int resto;
} div_t;

div_t division(int x, int y) {
    div_t z;
    z.cociente = x/y;
    z.resto = x%y;
    return z;
}

int main () {
    
    int x, y;

    printf ("Ingrese el valor de x \n");
    scanf ("%d", &x);

    printf ("Ingrese el valor de y \n");
    scanf ("%d", &y);

    div_t pepe = division (x,y);
    x=pepe.cociente;
    y=pepe.resto;

    printf ("Los valores del cociente y resto son %d, %d \n",x,y);
    return 0;
    
}
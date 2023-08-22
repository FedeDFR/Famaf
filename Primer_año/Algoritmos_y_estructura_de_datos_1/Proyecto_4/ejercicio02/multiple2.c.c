#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

int main () {

    int x, y, z, X, Z;

    printf ("Ingrese el valor de x \n");
    scanf ("%d", &x);

    printf ("Ingrese el valor de y \n");
    scanf ("%d", &y);

    printf ("Ingrese el valor de z \n");
    scanf ("%d", &z);

    X = x;
    Z = z;
    z = y + x;
    x = y;
    y = X + y + Z;

    printf ("Los valores de x, y, z son %d, %d, %d \n", x, y, z);

}
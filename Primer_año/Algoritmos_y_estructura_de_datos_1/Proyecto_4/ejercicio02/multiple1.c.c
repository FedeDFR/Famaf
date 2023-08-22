#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

int main () {

    int x, y;

    printf ("Ingrese el valor de x \n");
    scanf ("%d", &x);

    printf ("Ingrese el valor de y \n");
    scanf ("%d", &y);

    y = x + y;
    x = x+1;

    printf ("Los valores de x, y son %d, %d \n", x, y);

}
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

int main (){
    int x, y, X, Y;

    printf ("Ingrese un valor x \n");
    scanf ("%d", &x);

    printf ("Ingrese un valor y \n");
    scanf ("%d", &y);

    X = x;
    Y = y;

    assert (x == X && y == Y);
    
    x=Y;
    y=X;

    assert (x == Y && y == X);
    
    printf ("El valor de x es %d y el valor de y es %d \n", x, y);
}
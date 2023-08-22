#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

int main (void) {

    int x, y, z;
    
    z = INT_MIN; 
    
    printf ("Ingrese el valor para x \n");
    scanf ("%d", &x);

    printf ("Ingrese el valor para y \n");
    scanf ("%d", &y);

    if (x<y) {
        printf ("El valor minimo es %d \n", x);
    } else {
        printf ("El valor minimo es %d \n", y);
    }

    assert(z<=x && z<=y);
}


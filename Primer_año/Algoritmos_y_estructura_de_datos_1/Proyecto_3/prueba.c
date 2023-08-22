#include <stdio.h>
#include <stdbool.h>

int pedirEntero () {

    int x;

    printf ("Ingrese un valor \n");
    scanf ("%d", &x);

    return x;     
}

void imprimeEntero (int x) {

    printf ("El valor de la variable es %d\n", x);

    return ;
}


int main (void) {

    int x, y, z, m;

    x = pedirEntero();

    y = pedirEntero();

    z = pedirEntero();

    m = pedirEntero();

    if (x < y) {
        m=x;
    } else {
        m=y;
    }

    printf("El valor de x en σ1 es %d \n", x);
    printf("El valor de y en σ1 es %d \n", y);
    printf("El valor de z en σ1 es %d \n", z);
    printf("El valor de m en σ1 es %d \n", m);

    if (m < z) {}
    else {
        m = z;
    }

    imprimeEntero (x);
    imprimeEntero (y);
    imprimeEntero (z);
    imprimeEntero (m);

    return 0;
}
        #include <stdio.h>
        #include <stdbool.h>
        #include <assert.h>
        #include <limits.h>

int main () {

    int x;

    printf ("Ingrese un valor x \n");
    scanf ("%d", &x);

    assert ( x >= 0 || x <= 0);

    if (x<0) {
        x=-x;
    } else {
        x=x;
    }

    assert (x >= 0);
    
    printf ("El valor absoluto de x es %d \n", x);

}



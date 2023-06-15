#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
#define N 4
#define X 3

void pedirArreglo(int a[], int tam){

    int i = 0;
    
    while(i!=tam){
        printf ("ingrese un valor para una posciocion\n");
        scanf ("%d",&a[i]);
        i++;
    }
}

int main (void) {
    
    int r=0, s=0, i=0;


    while (i!=N) {
        r = r + s + 1;
        s = i + i;
        i++;
    }

    printf ("%d\n",r);
    printf ("%d\n",s);
}

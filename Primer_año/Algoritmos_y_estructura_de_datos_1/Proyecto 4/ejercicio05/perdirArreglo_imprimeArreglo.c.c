#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

void pedirArreglo(int a[], int n_max){

    int i;
    i=0;
    
    while(i!=n_max){
        printf ("ingrese un valor para una posciocion\n");
        scanf ("%d",&a[i]);
        i=i+1;
    }
}

void imprimeArreglo(int a[], int n_max){

    int i;
    i=0;

    while (i!=n_max){
        printf ("%d ",a[i]);
        i=i+1;
    }
}

int main(void){

    int n_max;

    printf("ingrese el valor maximo del arreglo\n");
    scanf("%d",&n_max);

    int a[n_max];

    pedirArreglo(a, n_max);

    imprimeArreglo (a,n_max);

}

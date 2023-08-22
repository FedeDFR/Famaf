#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

void pedirArreglo(int a[], int tam) {

    int i;
    i=0;

    while(i!=tam){
        printf ("ingrese un valor para una posciocion\n");
        scanf ("%d",&a[i]);
        i++;
    }
}

int sumatoria(int a[], int tam) {

    int i, x;
    i=0;
    x=0;

    while(i!=tam) {
        x=x+a[i];
        i++;

    }

    printf ("La sumatoria es %d \n",x);
}


int main(void){

    int tam;
    
    printf("ingrese el valor maximo del arreglo\n");
    scanf("%d",&tam);
    
    int a[tam];

    pedirArreglo(a, tam);
    sumatoria(a, tam);
}


#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

void pedirArreglo(int a[], int tam){

    int i;
    i=0;

    while(i!=tam){
        printf ("ingrese un valor para una posiocion\n");
        scanf ("%d",&a[i]);
        i++;
    }
}

void intercambiar(int a[], int tam, int i, int j){

    int x=a[i], y=a[j];

    a[i]=y;
    a[j]=x;
    
}

int main(void){

    int tam, i, j;

    printf("ingrese el valor maximo del arreglo\n");
    scanf("%d",&tam);

    int a[tam];

    printf ("ingrese una posicion i menor a %d \n", tam);
    scanf("%d",&i);

    printf ("ingrese una posicion j menor a %d \n", tam);
    scanf("%d",&j);

    assert (tam > i && tam > j);

    pedirArreglo (a, tam);

    intercambiar (a, tam, i, j);

    printf ("%d, %d",a[i], a[j]);
    
}
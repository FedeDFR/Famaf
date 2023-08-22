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

bool existe_positivo(int a[], int tam) {

  int i=0, res = 0;

    while(i!=tam) {
        res = res || (a[i]>0);
        i++;
    }

    return res;
}

bool todos_positivos(int a[], int tam) {

    int i=0, res=1;

    while(i!=tam){
    res = res && (a[i]>0);
    i++;   
    }

    return res;
}

int main (void) {
    
    int tam;

    printf("ingrese el valor maximo del arreglo\n");
    scanf("%d",&tam);

    int a[tam];

    pedirArreglo(a,tam);
    existe_positivo(a,tam);
    todos_positivos(a,tam);
    
    if (todos_positivos(a, tam) == 1) {
        printf("todos los valores son positivos \n");
    } else {
        printf("no todos los valores son positivos \n");
    }
    
    if (existe_positivo(a, tam) == 1) {
        printf("existe algun valor positivo \n");
    } else {
        printf("no existe algun valor positivo \n");
    }
}
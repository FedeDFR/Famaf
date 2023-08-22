#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

void pedirArreglo(float a[], int tam){

    int i=0;
    
    while(i != tam){
        printf ("ingrese un valor para una posciocion\n");
        scanf ("%f",&a[i]);
        i++;
    }
}

float minimo (float a[], int tam) {

    int i=0, x;
    float n=INT_MAX;

    while(i!=tam) {
        x=a[i];
        if(x<n){
            n=x;
        }
        i++;
    }

    printf("el elemento mas chico es %f\n",n);
    return n;
}

float maximo (float a[], int tam) {

    int i=0, x;
    float m=INT_MIN;

    while(i!=tam) {
        x=a[i];
        if(x>m){
            m=x;
        }
        i++;
    }  
    printf("el elemento mas grande es %f\n",m);
    return m;
}

typedef struct {
    float maximo;
    float minimo;
    float promedio;
} datos_t;

datos_t stats(float a[], int tam) {
    
    int i = 0;
    float b = 0;

    datos_t x;
    x.maximo = maximo (a,tam);
    x.minimo = minimo (a,tam);
    x.promedio = 0;

    while (i != tam) {
        b = b + a[i];
        i++;
    }

    x.promedio = b/tam;

    return x;

}

int main (void) {

    int tam;
    float c, y, z;

    printf("ingrese el valor maximo del arreglo\n");
    scanf("%d",&tam);

    float a[tam];

    pedirArreglo(a,tam);

    datos_t el = stats (a,tam);
    c=el.maximo;
    y=el.minimo;
    z=el.promedio;

    printf ("El promedio es %f \n", z);

}
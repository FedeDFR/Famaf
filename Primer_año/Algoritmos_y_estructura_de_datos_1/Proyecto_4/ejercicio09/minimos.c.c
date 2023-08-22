#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

int minimo_pares(int a[], int tam){

    int i=0, m=INT_MAX;

    while(i != tam) {
        
        if((a[i] % 2 == 0) && (a[i] < m)){
            m = a[i];
        }
        i++;
    }
    if(m == INT_MAX){
        printf ("no hay elemento par\n");
    }else {
        printf("el elemento par mas chico es : %d\n",m);
    }

    return m;
}

int minimo_impares(int a[], int tam){

    int i=0,x,m=INT_MAX;

    while(i != tam) {
        x=a[i];

        if((x % 2 != 0) && (x < m)){
            m=x;
        }
        i++;
    }

    if(m == INT_MAX){
        printf ("no hay elemento impar\n");
    } else {
        printf("el elemento impar mas chico es : %d\n",m);
    }

    return m;
}


void pedirArreglo(int a[], int tam) {

    int i;
    i=0;

    while(i != tam){
        printf ("ingrese un valor para una posiocion\n");
        scanf ("%d",&a[i]);
        i++;
    }
}

int main(void){
    
    int tam;

    printf("ingrese el valor maximo del arreglo\n");
    scanf("%d",&tam);

    int a[tam];

    pedirArreglo(a,tam);

    minimo_impares(a,tam);
    minimo_pares(a,tam);
}
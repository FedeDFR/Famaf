#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>


void pedirArreglo(int a[], int tam){

    int i = 0;
    
    while(i!=tam){
        printf ("ingrese un valor para una posciocion\n");
        scanf ("%d",&a[i]);
        i++;
    }
}

typedef struct {
    int menores;
    int iguales;
    int mayores;
}comp_t;

comp_t cuantos(int a[], int tam, int elem){

    int i = 0;

    comp_t trio;
    trio.menores=0;
    trio.mayores=0;
    trio.iguales=0;
 
    while(i!=tam){

        if(a[i]==elem){
            trio.iguales++;
        } 

        if(a[i]>elem){
            trio.mayores++;
        } 

        if (a[i]<elem) {    
                trio.menores++;
        }    

    i++;
    }

    return trio;
}

int main (void) {

    int tam,elem,c,y,z;

    printf("ingrese el valor maximo del arreglo\n");
    scanf("%d",&tam);

    printf("ingrese el elemento\n");
    scanf("%d",&elem);

    int a[tam];

    pedirArreglo(a,tam);

    comp_t x = cuantos(a,tam,elem);
    c=x.menores;
    y=x.iguales;
    z=x.mayores;

    printf("los elementos menores %d\n",c);
    printf("los elementos mayores %d\n",z);
    printf("los elementos iguales %d\n",y);

}
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
    
void suma_hasta(int N){
    int i, n;
    n=N;
    i=0;
    while(N>0){
       i=i+N;
       N=N-1; 
    } 
    printf ("La suma hasta %d es %d \n", n, i);
}

int main(){
    int x;
    printf("ingrese un  n \n");
    scanf("%d",&x);
    suma_hasta (x);
}

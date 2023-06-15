#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

bool es_primo(int N){

    int i = 2 ;

    while (N % i != 0){
        i ++;
    }
    return ( i == N);

}

int nesimo_primo(int N){

    int i = 2 , contador = 1 , n_primo = 0;
    bool temp = true;
  
    while (temp){

        if (es_primo(i)) {
            if (contador == N){
            n_primo = i;
            temp = false;

            } else {
            contador ++;
            }
        }

    i ++;
  }

  return n_primo;    
}

int main (void) {

    int N;

    printf ("Ingresar numero \n");
    scanf ("%d", &N);

    if (N<0) {
        printf ("Error al ingresar numero negativo \n");
    } else {
        printf ("El resultado es %d \n", nesimo_primo (N));
    }

    return 0;
}
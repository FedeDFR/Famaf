#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

void holaHasta(int n) {

  assert(n > 0);

  while (n != 0){

    n = n - 1;

    printf("Hola\n");
  }
}

int main(void) {
  int n;
  
  printf("Ingrese la cantidad de Holas\n");
  scanf("%d", &n);
  
  holaHasta(n);

  return 0;
}



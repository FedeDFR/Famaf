//gcc -Wall -Werror -Wextra -pedantic -std=c99 -c main.c
//gcc -Wall -Werror -Wextra -pedantic -std=c99 main.o -o reader
//./reader

/*
  @file main.c
  @brief Main program function implementation
*/
#include <stdio.h>
#include <stdlib.h>

/** @brief structure which represent a person */
typedef struct _person {
    int age;
    char name_initial;
} person_t;

void camb_per (person_t *e) {
    e->age = 100;
    e->name_initial = 'F';
}

int main(void) {

    int x = 1;
    person_t m = {90, 'M'};
    int a[] = {0, 1, 2, 3};

    int *b = NULL;
    b = &x;
    *b = 9;
    
    camb_per (&m);

    int *d[1] = NULL;
    d[1] = &a[1];
    *d[1] =42;

    printf("x = %d\n", x);
    printf("m = (%d, %c)\n", m.age, m.name_initial);
    printf("a[1] = %d\n", a[1]);

    return EXIT_SUCCESS;
}


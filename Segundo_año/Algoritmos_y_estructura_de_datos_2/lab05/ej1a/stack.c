//gcc -Wall -Werror -Wextra -pedantic -std=c99 -c test.c stack.c
//gcc -Wall -Werror -Wextra -pedantic -std=c99 test.o stack.o -o prueba

#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>

#include "stack.h"
 
struct nodo {
    stack_elem elem;
    struct nodo *next;
};

stack stack_empty() {
    stack s = NULL;

    return s;
}

stack stack_push(stack s, stack_elem e) {
    stack q = stack_empty();
    q = malloc (sizeof (struct nodo));
    
    q->elem = e;
    q->next = s;
    s = q;
    
    return s;
}

stack stack_pop(stack s) {
    stack q;

    q = s;
    s = s->next;
    free(q);

    return s;
}

unsigned int stack_size(stack s) {
    unsigned int count = 0;
    stack q = stack_empty();

    q = s;
    while (!stack_is_empty(q)) {
        count++;
        q = q->next;
    }

    return count;
}

stack_elem stack_top(stack s) {
    assert (!stack_is_empty(s));

    return s->elem;
}

bool stack_is_empty(stack s) {
    bool b = (s == NULL);

    return b;
}

stack_elem *stack_to_array(stack s) {
    unsigned int i = stack_size(s);
    stack q = stack_empty();
    stack_elem *e = calloc (i, sizeof (stack_elem));

    q = s;

    while (i > 1) {
        e[(i-1)] = q->elem;
        q = q->next;
        i--;
    }

    return e;
}

/*
    En primer lugar, malloc() toma un único argumento (la cantidad de memoria para asignar en bytes), mientras calloc() necesita dos argumentos (el número de variables para asignar en la memoria y el tamaño en bytes de una sola variable).
 */

stack stack_destroy(stack s) {
    stack q = stack_empty();

    while (!stack_is_empty(s)) {
        q = s;
        s = s->next;
        free (q);
    } 

    return s;
}
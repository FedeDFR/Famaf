#include <stdlib.h>
#include <assert.h>
#include "stack.h"

struct _s_stack {
    stack_elem *elems;      // Arreglo de elementos
    unsigned int size;      // Cantidad de elementos en la pila
    unsigned int capacity;  // Capacidad actual del arreglo elems
};

stack stack_empty(){
    stack s = malloc(sizeof(struct _s_stack));

    s->elems = NULL;
    s->size = 0u;
    s->capacity = 0u;

    return s;
}

stack stack_push(stack s, stack_elem e) {
    if (stack_is_empty(s)){
        s->capacity = 1u;
        s->elems = calloc(s->capacity , sizeof(stack_elem));
    }
    else if (s->capacity <= s->size) {
        realloc (s->elems, calloc (s->size * 2, sizeof (stack_elem)));
        s->capacity = s->size * 2;
    }
    s->elems[s->size] = e;
    s->size = s->size + 1;
    
    return s;
}

stack stack_pop(stack s) {
    s->size--;

    assert (!stack_is_empty (s));

    return s;
}

unsigned int stack_size(stack s) {
    return s->size;
}

stack_elem stack_top(stack s) {
    stack_elem e;

    e = s->elems[s->size - 1u];

    assert (!stack_is_empty (s));

    return e;
}

bool stack_is_empty(stack s) {
    bool b = (s->size == 0u);

    return b;
}

stack_elem *stack_to_array(stack s) {
    stack_elem *arr = NULL;

    arr = calloc(stack_size(s) , sizeof(stack_elem));

    for (size_t i = 0; i < s->size; i++) {
        arr[i] = s->elems[i];
    }
    
    return arr;
}

stack stack_destroy(stack s) {

    while (!stack_is_empty (s)){
        s = stack_pop (s);
    }

    return s;
}
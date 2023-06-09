#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

#include "test.h"

stack_elem prueba1 (stack_elem t) {
    stack s = stack_empty();
    stack_elem e;

    s = stack_push (s, t);

    s = stack_pop (s);
    e = stack_top (s);

    return e;
}

stack prueba2 (stack_elem e) {
    stack s = stack_empty();

    s = stack_push (s, e);
    s = stack_pop (s);
    s = stack_push (s, e);

    return s;
}

stack_elem prueba3 () {
    stack_elem *e;

    stack s = stack_empty();
    e = stack_to_array (s);

    return *e;
}
#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include "pqueue.h"

struct s_pstack {
    unsigned int size;
    priority_t max_priority;
    struct s_node **array;
    
};

struct s_node {
    pstack_elem elem;
    struct s_node *next;
};

static struct s_node * create_node(pstack_elem e) {
    struct s_node *new_node = NULL;
    new_node = malloc (sizeof (struct s_node));
    assert(new_node!=NULL);
    new_node->elem = e;
    new_node->next = NULL;

    return new_node;
}

static struct s_node * destroy_node(struct s_node *node) {
    assert (node != NULL);

    node->next = NULL;
    free (node);
    node = NULL;

    assert (node == NULL);
    return node;
}


static bool invrep(pstack s) {
    bool b = (s != NULL);

    if (b && s->size != 0u && s->array != NULL) {

        struct s_node *q = NULL;
        unsigned int siz = 0;
        for (size_t i = 0; i <= s->max_priority; i++) {
            q = s->array[i];

            while (q != NULL) {
                siz++;
                q = q->next;
            }
        }
        b = b && (siz == s->size);
    }
    return b;
}

pstack pstack_empty(priority_t max_priority) {
    pstack s=NULL;
    s = malloc (sizeof (struct s_pstack));
    s->array = calloc (max_priority + 1, sizeof (struct s_node*));
    s->size = 0;
    s->max_priority = max_priority;

    for (unsigned int i = 0u; i <= max_priority; i++){

        s->array[i] = NULL;
    }

    assert(invrep(s) && pstack_is_empty(s));
    return s;
}

pstack pstack_push(pstack s, pstack_elem e, priority_t priority) {
    assert(invrep(s));
    struct s_node *new_node = create_node (e);

    new_node->next = s->array[priority];
    s->array[priority] = new_node;

    s->size++;

    assert(invrep(s) && !pstack_is_empty(s));
    return s;
}

bool pstack_is_empty(pstack s) {
    assert(invrep(s));
    bool b = true;

    for (size_t i = 0; i <= s->max_priority; i++) {
        b = b && (s->array[i] == NULL);
    }
    
    return b;
}

pstack_elem pstack_top(pstack s) {
    assert(invrep(s) && !pstack_is_empty(s));
    
    unsigned int i = s->max_priority;
    while (s->array[i] == NULL) {
        i--;
    }

    return s->array[i]->elem;
}

priority_t pstack_top_priority(pstack s) {
    assert(invrep(s) && !pstack_is_empty(s));

    priority_t i = s->max_priority;
    while (s->array[i] == NULL) {
        i--;
    }
    return i;
}

size_t pstack_size(pstack s) {
    assert(invrep(s));
    return s->size;
}

pstack copy (pstack s) {
    pstack new_pstack = pstack_empty (s->max_priority);
    struct s_node * t = NULL;

    new_pstack->max_priority = s->max_priority;
    new_pstack->size = s->size;

    for (size_t i = 0; i <= s->max_priority; i++) {
        t = s->array[i];

        while (t != NULL) {
            new_pstack = pstack_push (new_pstack, t->elem, i);
            t = t->next;
        }

    }
    assert (invrep (s));
    return new_pstack;
}

pstack pstack_pop(pstack s) {
    assert(invrep(s) && !pstack_is_empty(s));
    priority_t i = pstack_top_priority (s) ;
    struct s_node *q = s->array[i];
    
    s->array[i] = s->array[i]->next;
    q = destroy_node (q);
    s->size--;
    
    assert(invrep(s));
    return s;
}

pstack pstack_destroy(pstack s) {
    assert(invrep(s));
    
    while (!pstack_is_empty (s)) {
        s = pstack_pop (s);
    }

    free (s->array);
    free (s);
    s = NULL;

    assert (s == NULL);
    return s;
}
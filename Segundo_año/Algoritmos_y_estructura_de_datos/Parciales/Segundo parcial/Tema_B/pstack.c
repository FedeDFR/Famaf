#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include "pstack.h"

struct s_pstack {
   struct s_node *first;
   unsigned int size;
};

struct s_node {
    priority_t priority;
    pstack_elem elem;
    struct s_node *next;
};

static struct s_node * create_node(pstack_elem e, priority_t priority) {
    struct s_node *new_node = NULL;
    new_node = malloc (sizeof (struct s_node));
    assert(new_node!=NULL);
    
    new_node->elem = e;
    new_node->priority = priority;
    new_node->next = NULL;

    return new_node;
}

static struct s_node * destroy_node(struct s_node *node) {
    assert(node != NULL);
    node->next = NULL;
    free (node);
    node = NULL;
    assert(node == NULL);
    return node;
}


static bool invrep(pstack s) {
    bool b = ( s != NULL);

    if (s->size != 0 && s->first != NULL) {

        struct s_node *p = s->first; 
        unsigned int i = 1;

        while (p->next != NULL) {
            b = b && p->priority <= p->next->priority;
            i++;
            p = p->next;
        }
        b = b && (i == s->size);
    }
    
    return b;
}

pstack pstack_empty(void) {
    pstack s = NULL;
    s = malloc (sizeof (struct s_pstack));
    s->first = NULL;
    s->size = 0;

    assert (invrep (s) && pstack_is_empty (s));
    return s;
}

pstack pstack_push(pstack s, pstack_elem e, priority_t priority) {
    assert(invrep(s));
    struct s_node *new_node = create_node(e, priority);
    
    if (s == NULL) {
        s->first = new_node;
        s->size = 1;
    } else {
        struct s_node *p = s->first;
        struct s_node *f = NULL;

        while (p != NULL && p->priority <= priority) {
            f = p;
            p = p->next;
        }

        new_node->next = p;
    
        if (f == NULL) {
            s->first = new_node;
        } else {
            f->next = new_node;
        }
         s->size++;
    }

    assert (invrep (s) && !pstack_is_empty (s));
    return s;
}

bool pstack_is_empty(pstack s) {
    bool b = (s->first == NULL);
    
    return b;
}

pstack_elem pstack_top(pstack s) {
    assert(invrep (s) && !pstack_is_empty(s));
    return s->first->elem;
}

priority_t pstack_top_priority(pstack s) {
    assert (invrep (s) && !pstack_is_empty(s));
    return s->first->priority;
}

unsigned int pstack_size(pstack s) {
    assert(invrep(s));
    unsigned int size=0;
    size = s->size;
    return size;
}

pstack pstack_pop(pstack s) {
    assert (invrep (s) && !pstack_is_empty(s));
    struct s_node *p = NULL;
    p = s->first;

    s->first = s->first->next;
    p = destroy_node (p);
    s->size--;

    assert(invrep (s));
    return s;
}

pstack pstack_destroy(pstack s) {
    assert(invrep(s));
    struct s_node *p = NULL;
    struct s_node *f = NULL;
    p = s->first;

    while ( p != NULL) {
        f = p;
        p = p->next;
        f= destroy_node (f);
    }

    free (s);
    s = NULL;

    assert(s == NULL);
    return s;
}


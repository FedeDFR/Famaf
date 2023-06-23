#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include "pqueue.h"

struct s_pqueue {
    unsigned int size;
    unsigned int min_priority;
    struct s_node **array;
};

struct s_node {
    pqueue_elem elem;
    struct s_node *next;
};

static struct s_node * create_node(pqueue_elem e) {
   struct s_node *new_node = malloc (sizeof (struct s_node));
    assert(new_node != NULL);
    new_node->elem = e;
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


static bool invrep(pqueue q) {
    bool b = (q != NULL);

    if (b && q->array != NULL && q->size != 0) {
        
        unsigned int siz = 0;
        struct s_node * s = NULL;

        for (size_t i = 0; i <= q->min_priority; i++) {
            s = q->array[i];

            while (s != NULL) {
                siz++;
                s = s->next;
            }
        }
        
        b = b && (siz == q->size);
    }

    return b;
}

pqueue pqueue_empty(priority_t min_priority) {
    pqueue q = NULL;
    q = malloc (sizeof  (struct s_pqueue));

    q->array = calloc (min_priority + 1, sizeof (struct s_node *));
    q->size = 0;
    q->min_priority = min_priority;

    for (size_t i = 0; i <= min_priority; i++) {
        q->array[i] = NULL;
    }
    
    assert(invrep(q) && pqueue_is_empty(q));
    return q;
}

pqueue pqueue_enqueue(pqueue q, pqueue_elem e, priority_t priority) {
    assert(invrep(q) && priority <= q->min_priority);
    struct s_node *new_node = create_node (e);

    if (q->array[priority] == NULL) {
        q->array[priority] = new_node;
    } else {
        struct s_node *f = q->array[priority];

        while (f->next != NULL) {
            f = f->next;
        }

        f->next = new_node;
    }

    q->size++;

    assert(invrep(q) && !pqueue_is_empty(q));
    return q;
}

bool pqueue_is_empty(pqueue q) {
    bool b = true;

    for (size_t i = 0; i <= q->min_priority; i++) {
        b = b && (q->array[i] == NULL);
    }
    
    return b; 
}

pqueue_elem pqueue_peek(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));
    priority_t p = 0;
    pqueue_elem e;
    
    while (q->array[p] == NULL) {
        p++;
    }
    e = q->array[p]->elem;

    assert(invrep(q));
    return e;
}

priority_t pqueue_peek_priority(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));
    priority_t p = 0;

    while (q->array[p] == NULL) {
        p++;
    }
    return p; 
}

size_t pqueue_size(pqueue q) {
    assert(invrep(q));
    return q->size;
}

pqueue pqueue_dequeue(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));
    priority_t s = pqueue_peek_priority (q);
    struct s_node *p = q->array[s];

    if (q->array[s]->next == NULL) {
        q->array[s] = NULL;
        p = destroy_node (p);
    } else {
        q->array[s] = q->array[s]->next;
        p = destroy_node (p);
    }
    
    q->size--;

    assert(invrep(q));
    return q;
}

pqueue pqueue_destroy(pqueue q) {
    assert (invrep(q));

    while (!pqueue_is_empty (q)) {
        q = pqueue_dequeue (q);
    }  
    free (q->array);
    free (q);
    q = NULL;

    assert (q == NULL);
    return q;
}


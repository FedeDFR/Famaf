#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include "pqueue.h"

struct s_pqueue {
    unsigned int size;
    struct s_node *front;
};

struct s_node {
    pqueue_elem elem;
    unsigned int priority;
    struct s_node *next;
};

static struct s_node * create_node(pqueue_elem e, unsigned int pri) {
    struct s_node *new_node = malloc (sizeof (struct s_node));
    assert(new_node != NULL);
    new_node->elem = e;
    new_node->priority = pri;
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
    
    if (q->size != 0 && q->front != NULL) {
        unsigned int t = 1;
        struct s_node *s = q->front;
        while (s->next != NULL) {
            b = b && s->priority <= s->next->priority;
            t++;
            s = s->next;
        }
        b = b && ( t == q->size);
    }

    return b;
}

pqueue pqueue_empty(void) {
    pqueue q = NULL;
    q = malloc (sizeof (struct s_pqueue));
    q->front = NULL;
    q->size = 0;
    
    assert(invrep(q) && pqueue_is_empty(q));
    return q;
} 

pqueue pqueue_enqueue(pqueue q, pqueue_elem e, unsigned int priority) {
    assert(invrep(q));
    struct s_node *new_node = create_node(e, priority);
    
    if (q == NULL) {
        q->front = new_node;
        q->size = 1;

    } else {
        struct s_node * s = q->front;;
        struct s_node *f = NULL;
        
        while (s != NULL && s->priority <= priority) {
            f = s;
            s = s->next;
        }
        new_node->next = s;

        if (f != NULL) {
            f->next = new_node;
        } else {
            q->front = new_node;
        }
        q->size++;
    }

    assert(invrep (q) && !pqueue_is_empty (q));
    return q;
}

bool pqueue_is_empty(pqueue q) {
    bool b = (q->front == NULL);
    return b;
}

unsigned int pqueue_size(pqueue q) {
    assert (invrep (q));
    unsigned int size=0;
    
    size=q->size;

    return size;
}

pqueue_elem pqueue_peek(pqueue q) {
    assert (invrep (q) && !pqueue_is_empty (q));
    return q->front->elem;
}

unsigned int pqueue_peek_priority(pqueue q) {
   assert (invrep (q) && !pqueue_is_empty (q));
    return q->front->priority;
}

pqueue pqueue_dequeue(pqueue q) {
    assert (invrep (q) && !pqueue_is_empty (q));
    struct s_node *s = NULL;
    s = q->front;

    q->front = q->front->next;
    s = destroy_node (s);
    q->size--;

    assert(invrep(q));
    return q;
}

pqueue pqueue_destroy(pqueue q) {
    assert(invrep(q));
    struct s_node *f = NULL;
    struct s_node *s = NULL;
    s = q->front;

    while (s != NULL) {
        f = s;
        s = s->next;
        f = destroy_node (f);
    }

    free (q);
    q = NULL;
    
    assert(q == NULL);
    return q;
}

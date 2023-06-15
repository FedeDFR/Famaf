#include <assert.h>
#include <stdlib.h>
#include <stdio.h> 

#include "list.h" 

struct nodo {
    list_elem elem;
    struct nodo *next;
};

list empty () {
    list l = NULL;

    return l;
}

list addl (list_elem e, list l) {
    struct nodo *p = NULL;
    p = malloc(sizeof(struct nodo));

    p->elem = e;
    p->next = l;
    l = p;

    return l;
}

void destroy(list l){
    struct nodo *p = NULL;
    
    p = l;
    
    if (p != NULL) {

        while (p->next != NULL) {
            l = tail(l);
            p = l;
        }
        
        free(p);
        p =  NULL;
        l = NULL;
    }
}

bool is_empty (list l) {
    bool b = (l == NULL);

    return b;
}

list_elem head (list l) {
    list_elem e;

    e = l->elem;

    return e;
}

list tail (list l) {
    struct nodo *p = NULL;

    p = l;
    l = p->next;
    free(p);

    return l;
}

list addr (list_elem e, list l) {
    struct nodo *p = NULL, *q = NULL;
    q = malloc(sizeof(struct nodo));

    q->elem = e;
    q->next = NULL;

    if (!is_empty(l)) {
        p = l;

        while (p->next != NULL) {
            p = p->next;
            
        }
        p->next = q;   
            
    } else {
        l = q;
    }

    return l;
}

unsigned int length (list l) {
    struct nodo *p = NULL;
    unsigned int n = 0u;

    p = l;
    
    while (!is_empty (p)) {
        n++;
        p = p->next;
    }

    return n;
}

list concat (list l, list p) {
    struct nodo *q = NULL;

    q = l;

    while (q->next != NULL) {
        q = q->next;
    }

    q->next = p;

    return l;
}

list_elem index (unsigned int n, list l) {
    struct nodo *q = NULL;
    list_elem e;
    unsigned int i = 0u;

    assert(length(l) >= n);

    q = l;

    while (i <= n) {
        e = q->elem;
        q = q->next;
        i++;
    }

    return e;
}

list take(unsigned int n, list l){
    struct nodo *p = NULL;
    unsigned int count = 1u;

    p = l;

    if (n <= length(l)) {

        while (count <= n) {
            p = p->next;
        }
        destroy(p);
    }
    return l;
}

list drop (unsigned int n, list l) {
    struct nodo *q = NULL;
    unsigned int i = 0u;

    while (( i < n) && (!is_empty (l))) {
        q = l;
        l = l->next;
        free (q);
        i++;
    }

    return l;
}

list copy_list(list l) {
    struct nodo *p = NULL, *q = NULL; 
    list l0 = NULL;

    q = malloc(sizeof(struct nodo));
    l0 = q;
    p = l;

    for (unsigned int i = 0; i <= length(l); i++) {

        q->elem = p->elem;
        q = q->next;
        p = p->next;
        q = malloc(sizeof(struct nodo));
    }
    
    free(q);
    q = NULL;

    return l0;
}
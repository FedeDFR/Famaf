#include "list.h"

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

struct _list {
    struct _node* head;
    ListSize size;
};

struct _node {
    elem e;
    struct _node* next;
};

/**
 * @brief Invariante de represetación
 *
 * @param l Lista
 * @return true Si l es una lista válida
 * @return false Si l NO es una lista válida
 */
static bool invrep(list l) {
    bool b = (l != NULL);

        unsigned int count = 0;
        struct _node* t = l->head;
        
        while (t != NULL) {
            count++;
            t = t->next;
        }

        b = b && (count == l->size);
    return b; 
}

/**
 * @brief Crea un nodo de la lista nuevo
 *
 * @param e Elemento que contendrá el nodo
 * @return struct _node* Nuevo nodo creado o NULL si no hay memoria
 */
static struct _node* create_node(elem e)
{
    struct _node* res = malloc(sizeof(struct _node));
    if (res != NULL)
    {
        res->e = e;
        res->next = NULL;
    }
    return res;
}

/**
 * @brief Destruye el nodo node
 *
 * @param node Nodo a ser destruido
 * @return struct _node* Devuelve NULL si el nodo se destruyó correctamente
 */
static struct _node* destroy_node(struct _node* node)
{
    if (node != NULL)
    {
        free(node);
        node = NULL;
    }
    assert(node == NULL);
    return node;
}

list list_empty() {
    list res = NULL;
    res = malloc (sizeof (struct _list));
    res->head = NULL;
    res->size = 0;

    assert(invrep(res));
    return res;
}

list list_addl(list l, elem e) {
    assert(invrep(l));
    struct _node* new_node = create_node (e);

    new_node->next = l->head;
    l->head = new_node;
    l->size++;

    assert(invrep(l));
    return l;
}

list list_addr(list l, elem e) {
    assert(invrep(l));
    struct _node* new_node = create_node (e);

    if (l == NULL) {
        l->head = new_node;

    } else {
        struct _node* q = l->head;

        while (q->next != NULL) {
            q = q->next;
        }
        q->next = new_node;

    }
    l->size++;
    
    assert(invrep(l));
    return l;
}

bool list_is_empty(list l) {
    assert(l != NULL && invrep(l));
    bool b = (l->head == NULL);
    
    return b;  
}

elem list_head(list l) {
    assert(l != NULL && invrep(l) && !list_is_empty(l));
    elem e = l->head->e;

    return e;
}

list list_tail(list l) {
    assert(!list_is_empty(l));
    struct _node *q = l->head;
    l->head = l->head->next;
    
    q = destroy_node (q);
    l->size--;

    return l;
}

ListSize list_length(list l) {
    assert(l != NULL);
    
    return l->size;
}

void list_print(list l) {
    struct _node* q = l->head;

    printf ("[");

    if (!list_is_empty (l)) {
        while (q != NULL) {
            if (q->next != NULL) {
                printf (" %u,", q->e);

            } else {
                printf (" %u ", q->e);
            }
             q = q->next;

        }
    }

    printf ("]\n");
    
}

list list_destroy(list l) {
    assert(l != NULL && invrep(l));
    
    while (!list_is_empty (l)) {
        l = list_tail (l);
    }

    free (l);
    l = NULL;

    return l;
}

/* Funciones Anexas */

list list_greater_than(list l, unsigned int n) {
    list t = list_empty ();
    struct _node* q = l->head;

    while (q != NULL) {
        if (q->e > n) {
            t = list_addl (t, q->e);

        }
        q = q->next;

    }

    return t;
}

unsigned int list_greater_than_count(list l, unsigned int n) {
    unsigned int i = 0;

    while (!list_is_empty (l)) {
        elem e = list_head (l);

            if (e > n) {
                i++;

            }
        l = list_tail (l);

    }

    return i;
}

list list_insert_at(list l, unsigned int position, elem e) {
    struct _node* new_node = create_node (e);
    struct _node* q = l->head;
    struct _node* p = NULL;
    unsigned int i = 0;

    while (q != NULL && i < position) {
        p = q;
        q = q->next;
        i++;
    }

    if (p == NULL) {
        l->head = new_node;
        new_node->next = q; 
    } else {   
        p->next = new_node;
        new_node->next = q;
    }

    l->size++;
    return l;
}
#include <stdbool.h>

#ifndef _LIST
#define _LIST

typedef struct nodo *list;
typedef int list_elem;

list empty ();
/*
 * Crea una lista vacia
 */

list addl (list_elem e, list l);
/* 
 * Agrega el elemento al comienzo de la lista
 */

void destroy (list l);
/*
 * Libera la memoria utilizada por la lista
 */

bool is_empty (list l);
/*
 * Devuelve true si la lista es vacia
 */

list_elem head (list l);
/*
 * Devuelve el primer elemento de la lista
 * PRE: la lista no es vacia
 */

list tail (list l);
/*
 * Elimina el primer elemento de la lista
 */

list addr (list_elem e, list l);
/*
 * Agrega el elemento e al final de la lista
 */

unsigned int length (list l);
/*
 * Devuelve la cantidad de elementos de la lista
 */

list concat (list l, list p);
/*
 * Agrega al final de la lista l todos los elementos de la lista p en el mismo orden
 */

list_elem index (unsigned int n, list l);
/*
 * Develve el n-ésimo elemento de la lista
 * PRE: el tamaño de la lista es mayor que n
 */

list take (unsigned int n, list l);
/*
 * Deja en la lista solo los primeros n elementos, elimina el resto
 */

list drop (unsigned int n, list l);
/*
 * Elimina los primeros n elementos de la lista
 */

list copy_list (list l);
/*
 * Copia todo los elementos de la lista en una nueva lista
 */


#endif
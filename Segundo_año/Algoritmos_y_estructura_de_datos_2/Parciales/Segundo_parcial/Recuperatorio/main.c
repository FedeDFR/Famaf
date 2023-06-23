#include <stdio.h>
#include <stdlib.h>

#include "list.h"

static void print_is_empty(list l)
{
    if (list_is_empty(l))
    {
        printf("La lista está vacía\n");
    }
    else
    {
        printf("La lista no está vacía\n");
    }
}

static void test_case1()
{
    list l = list_empty();
    print_is_empty(l);
    l = list_addl(l, 3);
    l = list_addl(l, 5);
    l = list_addl(l, 7);
    print_is_empty(l);
    printf("List length: %u\n", list_length(l));
    printf("List head: %u\n", list_head(l));
    list_print(l);
    l = list_addr(l, 12);
    printf("List length: %u\n", list_length(l));
    list_print(l);
    l = list_tail(l);
    printf("List head: %u\n", list_head(l));
    l = list_tail(l);
    printf("List head: %u\n", list_head(l));
    l = list_destroy(l);
}

/**
 * @brief Implementar un caso de prueba para la función list_greater_than
 *        Debe filtrar la lista por el mayor que y luego deberá
 *        llamar a list_greater_than_count para comparar el largo de la lista
 *        devuelta por list_greater_than con el resultado de
 *        list_greater_than_count.
 *
 */
static void test_case2()
{   
    list r;
    list l = list_empty();
    print_is_empty(l);
    l = list_addl(l, 3);
    l = list_addl(l, 5);
    l = list_addl(l, 7);
    print_is_empty(l);
    list_print (l);
    r = list_greater_than (l, 4);
    list_print (r);
    r = list_destroy (r);
    l = list_destroy (l);
}

/**
 * @brief Implementar un caso de prueba para la función list_insert_at
 *        Se debe insertar un elemento en la posición 0 de la lista
 *        validar que se comporte como list_addl
 *
 */
static void test_case3()
{
    list l = list_empty();
    print_is_empty(l);
    l = list_addl(l, 3);
    l = list_addl(l, 5);
    l = list_addl(l, 7);
    print_is_empty(l);
    list_print (l);
    l = list_insert_at (l, 2, 9);
    list_print (l);
    l = list_destroy (l);

}

/**
 * @brief Implementar un caso de prueba para la función list_insert_at
 *        Se debe insertar un elemento en la posición N-1 de la lista
 *        validar que se comporte como list_addr. La lista debe tener > 4 elems
 *
 */
static void test_case4()
{
    list l = list_empty();
    print_is_empty(l);
    l = list_addl(l, 3);
    l = list_addl(l, 5);
    l = list_addl(l, 7);
    print_is_empty(l);
    list_print (l);
    l = list_insert_at (l, 3, 9);
    list_print (l);
    l = list_destroy (l);

}

/**
 * @brief Implementar un caso de prueba para la función list_insert_at
 *        Se debe insertar un elemento en alguna posición 0 < position < N-1
 *        La lista debe tener al menos 4 elementos
 *        Imprimir la lista
 *
 */

static void test_case5()
{
     list l = list_empty();
    print_is_empty(l);
    l = list_addl(l, 3);
    l = list_addl(l, 5);
    l = list_addl(l, 7);
    print_is_empty(l);
    list_print (l);
    l = list_insert_at (l, 3, 9);
    l = list_insert_at (l, 3, 9);
    list_print (l);
    l = list_destroy (l);
}
int main(void)
{   
    test_case1();
    test_case2();
    test_case3();
    test_case4();
    test_case5();

    
    return EXIT_SUCCESS;
}

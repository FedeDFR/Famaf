#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"


static unsigned int partition(int a[], unsigned int izq, unsigned int der) {
   
    int pivv = izq;
    int i = izq + 1;
    int j = der;

    while(i <= j) {
        if(goes_before(a[i], a[pivv])) {
            i++;
        } else if(goes_before(a[pivv], a[j])) {
            j--;
        } else if(goes_before(a[pivv], a[i]) && goes_before(a[j], a[pivv])) {
            swap(a, i, j);
        }
   }
   
   swap(a, pivv, j);
   return pivv = j;
}

static void quick_sort_rec(int a[], unsigned int izq, unsigned int der) {
    int ppiv;
    
    if(der > izq) {
        ppiv = partition(a, izq, der);
        if(ppiv != 0) {
            quick_sort_rec(a, izq, ppiv - 1);
        }
        quick_sort_rec(a, ppiv + 1, der);
    }
}

void quick_sort(int a[], unsigned int length) {
    quick_sort_rec(a, 0, (length == 0) ? 0 : length - 1u);
}


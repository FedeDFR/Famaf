#include <stdio.h>
#include <stdlib.h>

#include "API2024Parte2.h"

// Funciones para ElimGarak

/// C program for Merge Sort
#include <stdio.h>
#include <stdlib.h>

// Merges two subarrays of arr[].
// First subarray is arr[l..m]
// Second subarray is arr[m+1..r]
void mergeElim(u32 arr[], u32 b[], u32 l, u32 m, u32 r)
{
    u32 i, j, k;
    u32 n1 = m - l + 1;
    u32 n2 = r - m;

    // Create temp arrays
    u32 L[n1], R[n2];
    u32 L2[n1], R2[n2];

    // Copy data to temp arrays L[] and R[]
    for (i = 0; i < n1; i++) {
        L[i] = arr[l + i];
        L2[i] = b[l + i];
    }
    for (j = 0; j < n2; j++) {
        R[j] = arr[m + 1 + j];
        R2[j] = b[m + 1 + j];
    }
    // Merge the temp arrays back u32o arr[l..r
    i = 0;
    j = 0;
    k = l;
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            arr[k] = L[i];
            b[k] = L2[i];
            i++;
        }
        else {
            arr[k] = R[j];
            b[k] = R2[j];
            j++;
        }
        k++;
    }

    // Copy the remaining elements of L[],
    // if there are any
    while (i < n1) {
        arr[k] = L[i];
        b[k] = L2[i];
        i++;
        k++;
    }

    // Copy the remaining elements of R[],
    // if there are any
    while (j < n2) {
        arr[k] = R[j];
        b[k] = R2[j];
        j++;
        k++;
    }
}

// l is for left index and r is right index of the
// sub-array of arr to be sorted
void mergeSortElim(u32 arr[], u32 b[], u32 l, u32 r)
{
    if (l < r) {
        u32 m = l + (r - l) / 2;

        // Sort first and second halves
        mergeSortElim(arr, b, l, m);
        mergeSortElim(arr, b, m + 1, r);

        mergeElim(arr, b, l, m, r);
    }
}

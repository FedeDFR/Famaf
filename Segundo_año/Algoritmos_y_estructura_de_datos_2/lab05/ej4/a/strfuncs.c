#include <stdlib.h>
#include <stdio.h>

#include "strfuncs.h"

size_t string_length(const char *str) {
    size_t tam = 0;
    unsigned int i = 0;

    if (str == NULL) {
        tam = 0;
    } else {
        while (str[i] == '\0') {
        tam++;
        i++;
        }
    }
    return tam;
}

char *string_filter(const char *str, char c) {
    unsigned int i = 0u, j = 0u;
    char *new_str = NULL;
    new_str = malloc (sizeof(char) * string_length(str));


    while (str[i] != '\0') {
        if (str[i] != c) {
            new_str[j] = str[i];
            j++;
        } 
        i++;
    }
    new_str[j] = '\0';

    return new_str;
}
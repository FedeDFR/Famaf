//gcc -Wall -Werror -Wextra -pedantic -std=c99 -c fixstring.c
//gcc -Wall -Werror -Wextra -pedantic -std=c99 -c main.c
//gcc -Wall -Werror -Wextra -pedantic -std=c99 fixstring.o main.o -o reader

#include <stdio.h>
#include <assert.h>

#include "fixstring.h"

unsigned int fstring_length(fixstring s) {

    unsigned int length = 0;

    while(s[length] != '\0') {
        length++;

    }

    return length++;

}

bool fstring_eq(fixstring s1, fixstring s2) {
    
    bool equals = true;
    unsigned int i = 0;

    if(fstring_length(s1) != fstring_length(s2)) {
        equals = false;

    } else {
        while(s1[i] != '\0') {
            equals = equals && (s1[i] == s2[i]);
            i++;

        }
    }

    return equals;

}

bool fstring_less_eq(fixstring s1, fixstring s2) {

    bool min = true;
    bool eq = false;
    unsigned int i = 0;

        while(s1[i] != '\0' && s2[i] != '\0' && eq == false) {
            if(s1[i] < s2[i]) {
                eq = true;
            }
            if(s1[i] > s2[i]) {
                min = false;
                eq = true;
            } 
            if (s1[i] != '\0' && eq == false){
                min = true;   
            }
            i++;
        }
    return min;
}

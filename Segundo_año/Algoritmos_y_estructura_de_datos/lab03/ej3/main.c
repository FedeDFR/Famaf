// gcc -Wall -Werror -Wextra -pedantic -std=c99 -c main.c
// gcc -Wall -Werror -Wextra -pedantic -std=c99 main.o -o readprhase
// ./readprhase phrase-basic.in


#include <stdlib.h>
#include <stdio.h>

#define MAX_SIZE 1000

static void dump(char a[], unsigned int length) {
    printf("\"");
    for (unsigned int j=0u; j < length; j++) {
        printf("%c", a[j]);
    }
    printf("\"");
    printf("\n\n");
}

unsigned int data_from_file(const char *path, unsigned int indexes[], char letters[], unsigned int max_size) {

    unsigned int length = 0;
    FILE *file = fopen (path, "r");
    
    if (file == NULL) {
        perror ("No se ha podido leer el archivo.\n");
        exit(EXIT_FAILURE);
    }

    while (!feof (file)) {
        fscanf(file, "%u -> *%c*\n", &indexes[length], &letters[length]);
        length++;
    }

    if (max_size < length) {
        length = max_size;
    }
    
    fclose (file);
    return length;
}

void sort_data(unsigned int indexes[],char letters[],char sorted[],unsigned int length){
	
    for(unsigned int i = 0; i < length ; i++){
		sorted[indexes[i]] = letters[i];
	}
}

int main (int argc, char *argv[]) {

    if (argc!=2) {
        exit(EXIT_FAILURE);
    }
    unsigned int indexes[MAX_SIZE];
    char letters[MAX_SIZE];
    char sorted[MAX_SIZE];
    unsigned int length = data_from_file (argv[1], indexes, letters, MAX_SIZE);
    sort_data (indexes, letters, sorted, length);
    dump (sorted, length);
    return EXIT_SUCCESS;
}


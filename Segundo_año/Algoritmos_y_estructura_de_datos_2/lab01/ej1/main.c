//$ gcc -Wall -Werror -Wextra -pedantic -std=c99 -o reader main.c 
//./reader ../input/example-easy.in

/* First, the standard lib includes, alphabetically ordered */
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

/* Maximum allowed length of the array */
#define MAX_SIZE 100000

void print_help(char *program_name) {
    /* Print the usage help of this program. */
    printf("Usage: %s <input file path>\n\n"
           "Loads an array given in a file in disk and prints it on the screen."
           "\n\n"
           "The input file must have the following format:\n"
           " * The first line must contain only a positive integer,"
           " which is the length of the array.\n"
           " * The second line must contain the members of the array"
           " separated by one or more spaces. Each member must be an integer."
           "\n\n"
           "In other words, the file format is:\n"
           "<amount of array elements>\n"
           "<array elem 1> <array elem 2> ... <array elem N>\n\n",
           program_name);
}

char *parse_filepath(int argc, char *argv[]) {
    /* Parse the filepath given by command line argument. */
    char *result = NULL;
    // Program takes exactly two arguments
    // (the program's name itself and the input-filepath)
    bool valid_args_count = (argc == 2);

    if (!valid_args_count) {
        print_help(argv[0]);
        exit(EXIT_FAILURE);
    }

    result = argv[1];

    return result;
}

unsigned int array_from_file(int array[], unsigned int max_size, const char *filepath) {

    unsigned int max;
    int chequeo;
    FILE*f;         //formato para declara un fichero

    f = fopen(filepath, "r");        //abre el fichero que queres operar | fichero = fopen ( nombre-fichero, modo); | "r" solo se puede leer

    fscanf(f,"%u",&max);        //lee los datos del fichero y los guarda en una variable

    assert(max <= max_size);        // Chequeo que el tamaño no sea mayor al tamaño maximo

    if(f != NULL) {
        
        if (max <= 0) {     // Veo que no sea una array vacio, si lo es, ya digo que es array vacio
            return max;
        }

        for (unsigned int i = 0; i < max; i++) {
            
            chequeo = fscanf(f, "%d", &array[i]);

            assert(chequeo != -1);      //chequeo que no haya menos elementos que el tamaño ingresado

        }
        
        fclose(f);      //cierra el fichero

    } else {
        printf("Error");        //devuelve error si no encuentra algun fichero 
    }   
    return max;
}

void array_dump(int a[], unsigned int length) {

    if (length <= 0) {

        printf("[]\n");

    } else {

        printf("[");

        for (unsigned int i = 0; i < length; i++) {

            if (i == length-1){
                printf("%d]", a[i]);

            } else {
                printf("%d, ", a[i]);
            }
            
        }
    }
}


int main(int argc, char *argv[]) {
    char *filepath = NULL;

    /* parse the filepath given in command line arguments */
    filepath = parse_filepath(argc, argv);
    
    /* create an array of MAX_SIZE elements */
    int array[MAX_SIZE];
    
    /* parse the file to fill the array and obtain the actual length */
    unsigned int length = array_from_file(array, MAX_SIZE, filepath);
    
    /*dumping the array*/
    array_dump(array, length);
    
    return EXIT_SUCCESS;
}

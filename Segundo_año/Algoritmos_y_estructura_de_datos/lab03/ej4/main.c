/**
 * * Para poder compilar los archivos de la Parte A usamos la sig linea en la consola
 * gcc -Wall -Werror -Wextra -pedantic -std=c99 -c array_helpers.c weather.c main.c
 * gcc -Wall -Werror -Wextra -pedantic -std=c99 array_helpers.o weather.o main.o -o weather
 * ./weather ../input/weather_cordoba.in > weather_cordoba.out
 * diff ../input/weather_cordoba.in weather_cordoba.out
 * 
 * * * Para poder compilar los archivos de la Parte B usamos la sig linea en la consola
 * gcc -Wall -Werror -Wextra -pedantic -std=c99 -c array_helpers.c weather.c weather_utils.c main.c
 * gcc -Wall -Werror -Wextra -pedantic -std=c99 array_helpers.o weather.o weather_utils.o main.o -o weather
 * ./weather ../input/weather_cordoba.in
*/
/*
  @file main.c
  @brief Defines main program function
*/

/* First, the standard lib includes, alphabetically ordered */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

/* Then, this project's includes, alphabetically ordered */
#include "array_helpers.h"
#include "weather_utils.h"

/**
 * @brief print usage help
 * @param[in] program_name Executable name
 */
void print_help(char *program_name) {
    /* Print the usage help of this program. */
    printf("Usage: %s <input file path>\n\n"
           "Load climate data from a given file in disk.\n"
           "\n"
           "The input file must exist in disk and every line in it must have the following format:\n\n"
           "<year> <month> <day> <temperature> <high> <low> <pressure> <moisture> <precipitations>\n\n"
           "Those elements must be integers and will be copied into the multidimensional integer array 'a'.\n"
           "The dimensions of the array are given by the macro tclimate.\n"
           "\n\n",
           program_name);
}

/**
 * @brief reads file path from command line
 *
 * @param[in] argc amount of command line arguments
 * @param[in] argv command line arguments
 *
 * @return An string containing read filepath
 */
char *parse_filepath(int argc, char *argv[]) {
    /* Parse the filepath given by command line argument. */
    char *result = NULL;

    if (argc < 2) {
        print_help(argv[0]);
        exit(EXIT_FAILURE);
    }

    result = argv[1];

    return (result);
}

/**
 * @brief Main program function
 *
 * @param[in] argc amount of command line arguments
 * @param[in] argv command line arguments
 *
 * @return EXIT_SUCCESS when programs executes correctly, EXIT_FAILURE otherwise
 */
int main(int argc, char *argv[]) {
    char *filepath = NULL;
    int array_max_temp_anual[YEARS];
    unsigned int array_max_rainfall_month[YEARS];

    /* parse the filepath given in command line arguments */
    filepath = parse_filepath(argc, argv);

    /* create an array with the type of tclimate */
    WeatherTable array;

    /* analizar el archivo para llenar la matriz y obtener la longitud real */
    array_from_file(array, filepath);

    /* show the ordered array in the screen */
    array_dump(array);

    printf ("La menor temeratura minima historica es: %d\n", min_temp_historic(array));

    max_temp_anual(array, array_max_temp_anual);
    print_int_array(array_max_temp_anual, YEARS);
    
    max_rainfall_month(array, array_max_rainfall_month);
    print_unsigned_int_array(array_max_rainfall_month, YEARS);

    return (EXIT_SUCCESS);
}

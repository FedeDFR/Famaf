/*
  @file array_helpers.c
  @brief Array Helpers method implementation
*/
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "array_helpers.h"


/**
 * @brief returns true when reach last line in weather file
 * @param[in] year Year array position (start in 0 ends with YEARS - 1)
 * @param[in] month Month of the year (december is last month 11u)
 * @param[in] day Day of the month. We assume all month have 28 days.
 * @return True when is the last line of the file, False otherwise
 */
static bool is_last_line(unsigned int year, unsigned int month, unsigned int day)
{
    return  year == YEARS - 1u && month == december && day == DAYS - 1u;
}


void array_dump(WeatherTable a) {
    for (unsigned int year = 0u; year < YEARS; ++year) {
        for (month_t month = january; month <= december; ++month) {
            for (unsigned int day = 0u; day < DAYS; ++day) {
                fprintf(stdout, "%u %u %u ", year + FST_YEAR, month + 1, day + 1);
                weather_to_file(stdout, a[year][month][day]);
                if (!is_last_line(year, month, day))
                {
                    fprintf(stdout, "\n");
                }
            }
        }
    }
}


void array_from_file(WeatherTable array, const char *filepath) {
    FILE *file = NULL;

    file = fopen(filepath, "r");
    if (file == NULL) {
        fprintf(stderr, "File does not exist.\n");
        exit(EXIT_FAILURE);
    }

    unsigned int k_year = 0u;
    unsigned int k_month = 0u;
    unsigned int k_day = 0u;
    while (!feof(file)) {
        int res = fscanf(file, " %u %u %u ", &k_year, &k_month, &k_day);
        if (res != 3) {
            fprintf(stderr, "Invalid array.\n");
            exit(EXIT_FAILURE);
        }
        Weather weather = weather_from_file(file);

        /* Completar acá: Guardar la medición de clima en el arreglo multidimensional */

        array[k_year-FST_YEAR][k_month-1][k_day-1] = weather;       //Como el numero de año en el archivo esta en formato 1980-2016, le resto 1980 para poder tomar el año como 0-36. Como el mes esta puesto de 1-12, le resto 1 para tomar de 0-11 y hago lo mismo con los dias.
    }
    fclose(file);
}

void print_int_array(int a[], unsigned int length) {
    
    if (length <= 0) {
        printf("[]\n");
    } else {
        printf("[ ");
        for (size_t i = 0; i < length - 1; i++) {
            printf("%d, " , a[i]);
        }
        printf("%d]\n" , a[length-1]);
    }
}

void print_unsigned_int_array(unsigned int a[], unsigned int length) {
    
    if (length <= 0) {
        printf("[]\n");
    } else {
        printf("[ ");
        for (size_t i = 0; i < length - 1; i++) {
            printf("%d, " , a[i]);
        }
        printf("%d]\n" , a[length-1]);
    }
}


/*
  @file layover.c
  @brief Implements flight structure and methods
*/
#include <stdlib.h>
#include "flight.h"

static const int AMOUNT_OF_FLIGHT_VARS = 2;

Flight flight_from_file(FILE* file, char code, unsigned int arrival_hour)
{
    Flight flight;
    flight.code = code;
    flight.hour = arrival_hour;

    if (!feof(file)) {
        int res = fscanf (file, "%u %u ", &flight.type, &flight.items_amount);

        if (res != AMOUNT_OF_FLIGHT_VARS) {
            fprintf(stderr, "Invalid file3.\n");
            exit(EXIT_FAILURE);
        }
        if (flight.type != 0 && flight.type != 1) {
            fprintf(stderr, "Invalid file4.\n");
            exit(EXIT_FAILURE);
        }
    }

    if (flight.type == 1) {
    fscanf(file , "\n");
    }
    return flight;
}
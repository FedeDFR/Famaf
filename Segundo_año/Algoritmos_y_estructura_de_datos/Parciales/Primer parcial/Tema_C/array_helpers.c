/*
@file array_helpers.c
@brief Array Helpers method implementation
*/
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "array_helpers.h"

static const int EXPECTED_DIM_VALUE = 2;

static const char* CITY_NAMES[CITIES] = {
    "Cordoba", "Rosario", "Posadas", "Tilcara", "Bariloche"};
static const char* SEASON_NAMES[SEASONS] = {"low", "high"};

void array_dump(BakeryProductTable a)
{
    for (unsigned int city = 0u; city < CITIES; ++city)
    {
        for (unsigned int season = 0u; season < SEASONS; ++season)
        {
            fprintf(stdout, "%s in %s season: flour (%u,%u) Yeast (%u,%u) Butter (%u,%u) Sales value %u",
                    CITY_NAMES[city], SEASON_NAMES[season], a[city][season].flour_cant,
                    a[city][season].flour_price, a[city][season].yeast_cant,
                    a[city][season].yeast_price, a[city][season].butter_cant,
                    a[city][season].butter_price, a[city][season].sale_value);
            fprintf(stdout, "\n");
        }
    }
}

unsigned int best_profit(BakeryProductTable a)
{
    unsigned int costo = 0;
    unsigned int profit = 0;
    unsigned int max_profit = 0u;
    unsigned int i = 0;
    
    while (i < CITIES) {
        
        costo = (a[i][0].butter_cant * a[i][0].butter_price) + (a[i][0].flour_cant * a[i][0].flour_price) + (a[i][0].yeast_cant * a[i][0].yeast_price);
        profit = a[i][0].sale_value - costo; 
        if (profit > max_profit) {
            max_profit = profit;
        }

        costo = (a[i][1].butter_cant * a[i][1].butter_price) + (a[i][1].flour_cant * a[i][1].flour_price) + (a[i][1].yeast_cant * a[i][1].yeast_price);
        profit = a[i][1].sale_value - costo; 
        if (profit > max_profit) {
            max_profit = profit;
        }
        ++i;
    }


    return max_profit;
}

void array_from_file(BakeryProductTable array, const char* filepath)
{
    FILE* file = NULL;

    file = fopen(filepath, "r");
    if (file == NULL)
    {
        fprintf(stderr, "File does not exist.\n");
        exit(EXIT_FAILURE);
    }
    unsigned int ciudad;
    unsigned int temporada;
    int i = 0;
    while (i < CITIES*SEASONS)
    {
        int res = fscanf (file, "##%u??%u", &ciudad, &temporada);
        if (res != EXPECTED_DIM_VALUE)
        {
            fprintf(stderr, "Invalid file1.\n");
            exit(EXIT_FAILURE);
        }

        BakeryProduct prod = bakery_product_from_file(file);
        
        array[ciudad][temporada] = prod;
        /* COMPLETAR: Leer y guardar product en el array multidimensional*/
        /* Agregar las validaciones que considere necesarias*/
        /* Completar*/
        ++i;
    }
    fclose(file);
}

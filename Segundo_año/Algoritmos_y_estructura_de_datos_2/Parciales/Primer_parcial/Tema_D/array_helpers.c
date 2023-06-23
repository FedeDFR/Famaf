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

static const char* CITY_NAMES [CITIES] = {
  "Cordoba", "Rosario", "Posadas", "Tilcara", "Bariloche"
};
static const char* SEASON_NAMES [SEASONS] = {"Low", "High" };


/**
* @brief returns true when reach last line in products file
* @return True when is the last line of the file, False otherwise
*/
/*static bool is_last_line(unsigned int city) {
  return city == CITIES - 1u;
}*/

void array_dump(BakeryProductTable a) {
  for (unsigned int city = 0u; city < CITIES; ++city) {
    for(unsigned int season = 0u; season < SEASONS; ++season){
      fprintf(stdout, "%s in season %s: Yeast (%u,%u) Butter (%u,%u) flour (%u,%u) Sales value %u",
        CITY_NAMES[city], SEASON_NAMES[season], a[city][season].flour_cant, 
        a[city][season].flour_price, a[city][season].butter_cant,
        a[city][season].butter_price,  a[city][season].yeast_cant,
        a[city][season].yeast_price, a[city][season].sale_value
      );
      fprintf(stdout, "\n");   
    }
  }
}


unsigned int worst_profit(BakeryProductTable a) {

  unsigned int precio = 0;
  unsigned int profit = 0;
  unsigned int min_profit = __INT_MAX__;
  unsigned int i = 0;

  while (i < CITIES) {

    precio = (a[i][0].butter_cant * a[i][0].butter_price) + (a[i][0].flour_cant * a[i][0].flour_price) + (a[i][0].yeast_cant * a[i][0].yeast_price);
    profit = a[i][0].sale_value - precio;

    if (profit < min_profit) {
      min_profit = profit;
    }

    precio = (a[i][1].butter_cant * a[i][1].butter_price) + (a[i][1].flour_cant * a[i][1].flour_price) + (a[i][1].yeast_cant * a[i][1].yeast_price);
    profit = a[i][1].sale_value - precio;

    if (profit < min_profit) {
      min_profit = profit;
    }
    ++i;
  }
  return min_profit;
}

void array_from_file(BakeryProductTable array, const char *filepath) {
  FILE *file = NULL;

  file = fopen(filepath, "r");
  if (file == NULL) {
    fprintf(stderr, "File does not exist.\n");
    exit(EXIT_FAILURE);
  } else {

    unsigned int i = 0;
    unsigned int ciudad = 0;
    unsigned int temporada = 0;

    while (i < CITIES * SEASONS) {
      
      int res = fscanf (file, "##%u??%u", &ciudad, &temporada);

      if (res != EXPECTED_DIM_VALUE) {
        fprintf(stderr, "Error.\n");
        exit(EXIT_FAILURE);
      }

      BakeryProduct lista = bakery_product_from_file(file);

      array[ciudad][temporada] = lista;
      ++i;
    }
  }
  
  

  fclose(file);
}

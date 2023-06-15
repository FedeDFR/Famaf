/*
  @file weather.c
  @brief Implements weather mesuarement structure and methods
*/
#include <stdlib.h>
#include "weather.h"

static const int AMOUNT_OF_WEATHER_VARS = 6 ;

Weather weather_from_file(FILE* file) {
    Weather weather;
  
  int eso = fscanf (file, " %d %d %d %u %u %u ", &weather._average_temp, &weather._max_temp, &weather._min_temp, &weather._pressure, &weather._moisture, &weather._rainfall); // Leo las mediciones del clima y las guardo en la estructura. En el weather.h nos dicen el formato de los datos que debemos leer.

  if (eso != AMOUNT_OF_WEATHER_VARS) {    // Hago control que se hayan leido la cantidad correcta de datos
    fprintf(stderr, "Invalid array.\n");
    exit(EXIT_FAILURE);
  }

    return weather;
}

void weather_to_file(FILE* file, Weather weather) {
    fprintf(file, EXPECTED_WEATHER_FILE_FORMAT, weather._average_temp, weather._max_temp, weather._min_temp, weather._pressure, weather._moisture, weather._rainfall);
}

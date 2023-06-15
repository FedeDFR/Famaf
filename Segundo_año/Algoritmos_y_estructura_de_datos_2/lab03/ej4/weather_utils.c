
/* First, the standard lib includes, alphabetically ordered */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

/* Then, this project's includes, alphabetically ordered */
#include "weather_utils.h"

int min_temp_historic (WeatherTable weather) {

    int min_hist = __INT_MAX__;
    unsigned int i = 0;
    unsigned int u = 0;
    unsigned int p = 0;

    while ( i < YEARS) {
        while (u < MONTHS) {
            while (p < DAYS) {
                if (weather[i][u][p]._min_temp < min_hist) {
                min_hist = weather[i][u][p]._min_temp;
                }
                p++;
            }
            u++;
        }
        i++;
    }
    return min_hist;
}

void max_temp_anual (WeatherTable we, int output[YEARS]) {

    int *puntero_int = NULL;
    int max_anual = -(__INT_MAX__);

    for (unsigned int year = 0; year < YEARS; year++) {
        puntero_int = &output[year];
        for (unsigned int month = 0; month < MONTHS; month++) {
            for (unsigned int day = 0; day < DAYS; day++) {
                if (we[year][month][day]._max_temp > max_anual){
                    max_anual = we[year][month][day]._max_temp;
                }
            }
        }
        *puntero_int = max_anual;       //  Una vez revisado todos los dias del año, guardo la tempMax en el valor del puntero
        max_anual = -(__INT_MAX__);
    }
  
} 

void max_rainfall_month (WeatherTable w, unsigned int output[YEARS]) {
    
    unsigned int *puntero_uns_int = NULL;
    unsigned int max_rainfall = 0u;
    unsigned int month_rainfall = 0u;
    unsigned int sum_rainfall = 0u;

    for (unsigned int year = 0; year < YEARS; year++) {
        puntero_uns_int = &output[year];
        for (unsigned int month = 0; month < MONTHS; month++) {
            for (unsigned int day = 0; day < DAYS; day++) {
                    sum_rainfall = sum_rainfall + w[year][month][day]._rainfall;
                }
            if (sum_rainfall > max_rainfall) {
                max_rainfall = sum_rainfall;
                month_rainfall = month;
            }
            sum_rainfall = 0u;
        }
        *puntero_uns_int = month_rainfall;       // la mayor temperatura máxima del año 'year' + 1980
        max_rainfall = 0u;
    }
  
} 

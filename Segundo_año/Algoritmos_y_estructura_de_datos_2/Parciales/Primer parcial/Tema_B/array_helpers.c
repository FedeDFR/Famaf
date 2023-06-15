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
* @brief returns true when reach last entry in flight table
* @return True when is the last entre of the flight table, False otherwise
*/
static bool is_last_line(unsigned int hour, unsigned int type) {
  return  hour == HOURS - 1u && type == TYPE - 1u;
}

void array_dump(DeliveryTable a) {
  for (unsigned int type = 0u; type < TYPE; ++type) {
    for (unsigned int hour = 0u; hour < HOURS; ++hour) {
      Flight f = a[type][hour];
      fprintf(stdout, "%c: flight with %u %s arrived at %u:00", f.code, f.items_amount, f.type == 0 ? "boxes" : "letters", f.hour - 1);
      if (!is_last_line(hour, type))
      {
        fprintf(stdout, "\n");
      }
    }
  }
}

unsigned int extra_space_fee_cost (DeliveryTable a, unsigned int h) {
  
  unsigned int costo = 0;
  unsigned int cantidad_box = 0; 
  unsigned int cantidad_letters = 0; 
  unsigned int i = 0;

  while (i < h) {
    
  cantidad_box =  a[0][i].items_amount + cantidad_box;
  cantidad_letters = a[1][i].items_amount + cantidad_letters;
    
  i++;
  }
  costo = ((cantidad_box - MAX_ALLOWED_BOXES) * BOX_PENALTY) + ((cantidad_letters - MAX_ALLOWED_LETTERS) * LETTER_PENALTY);
  return costo;
}


void array_from_file(DeliveryTable array, const char *filepath) {
  FILE *file = NULL;

  file = fopen(filepath, "r");
  if (file == NULL) {
    fprintf(stderr, "File does not exist.\n");
    exit(EXIT_FAILURE);
  }

  char code;
  unsigned int arrival_hour;
  int i = 0;
  while (i < 24) {
    int res = fscanf(file, "_%c_", &code);
    if (res != 1) {
      fprintf(stderr, "Invalid file1.\n");
      exit(EXIT_FAILURE);
    }
    int r = fscanf(file, " %u ", &arrival_hour);
    if (r != 1) {
      fprintf(stderr, "Invalid file2.\n");
      exit(EXIT_FAILURE);
    }
    
    Flight flight_boxes = flight_from_file(file, code, arrival_hour);
    Flight flight_letters = flight_from_file(file, code, arrival_hour);

    array[flight_boxes.type][arrival_hour-1] = flight_boxes;
    array[flight_letters.type][arrival_hour-1] = flight_letters;

    i++;
  }
}
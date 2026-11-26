#ifndef LOGGER_H
#define LOGGER_H

#include <stdint.h>

uint32_t logger_count(void);
void logger_append(int16_t temperature_x10, int16_t pressure_x10,
                   int16_t filtered_temperature_x10, int16_t filtered_pressure_x10);

#endif

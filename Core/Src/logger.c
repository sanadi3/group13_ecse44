#include "logger.h"
#include "stm32l4s5i_iot01_qspi.h"
#include "mx25r6435f.h"

typedef struct
{
  uint32_t sequence;
  int16_t temperature_x10;
  int16_t pressure_x10;
  int16_t filtered_temperature_x10;
  int16_t filtered_pressure_x10;
  uint16_t unused;
} WeatherRecord;

static int qspi_wait_ready(void)
{
  uint32_t start = HAL_GetTick();

  while ((HAL_GetTick() - start) < 1000)
  {
    if (BSP_QSPI_GetStatus() == QSPI_OK)
    {
      return QSPI_OK;
    }
  }
  return QSPI_ERROR;
}

static int record_write(int sector, int index, WeatherRecord *record)
{
  uint32_t address = (sector * MX25R6435F_SECTOR_SIZE) + (index * 16);
  return BSP_QSPI_Write((uint8_t *)record, address, 16);
}

static int record_read(int sector, int index, WeatherRecord *record)
{
  uint32_t address = (sector * MX25R6435F_SECTOR_SIZE) + (index * 16);
  return BSP_QSPI_Read((uint8_t *)record, address, 16);
}

uint32_t logger_count(void)
{
  WeatherRecord record;
  int index = 0;

  while (index < 200)
  {
    if (record_read(0, index, &record) != QSPI_OK)
    {
      break;
    }
    if (record.sequence == 0xFFFFFFFF)
    {
      break;
    }
    index++;
  }
  return index;
}

void logger_append(int16_t temperature_x10, int16_t pressure_x10,
                   int16_t filtered_temperature_x10, int16_t filtered_pressure_x10)
{
  WeatherRecord record;
  int index = logger_count();

  if (index >= 200)
  {
    if (BSP_QSPI_Erase_Sector(0) != QSPI_OK)
    {
      return;
    }
    if (qspi_wait_ready() != QSPI_OK)
    {
      return;
    }
    index = 0;
  }

  record.sequence = index;
  record.temperature_x10 = temperature_x10;
  record.pressure_x10 = pressure_x10;
  record.filtered_temperature_x10 = filtered_temperature_x10;
  record.filtered_pressure_x10 = filtered_pressure_x10;
  record.unused = 0;
  record_write(0, index, &record);
}

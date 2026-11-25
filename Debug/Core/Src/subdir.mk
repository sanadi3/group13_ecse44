################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/comms.c \
../Core/Src/kalman.c \
../Core/Src/logger.c \
../Core/Src/main.c \
../Core/Src/mic.c \
../Core/Src/sensors.c \
../Core/Src/stm32l4s5i_iot01.c \
../Core/Src/stm32l4s5i_iot01_hsensor.c \
../Core/Src/stm32l4s5i_iot01_psensor.c \
../Core/Src/stm32l4s5i_iot01_qspi.c \
../Core/Src/stm32l4s5i_iot01_tsensor.c \
../Core/Src/stm32l4xx_hal_msp.c \
../Core/Src/stm32l4xx_hal_ospi.c \
../Core/Src/stm32l4xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32l4xx.c 

OBJS += \
./Core/Src/comms.o \
./Core/Src/kalman.o \
./Core/Src/logger.o \
./Core/Src/main.o \
./Core/Src/mic.o \
./Core/Src/sensors.o \
./Core/Src/stm32l4s5i_iot01.o \
./Core/Src/stm32l4s5i_iot01_hsensor.o \
./Core/Src/stm32l4s5i_iot01_psensor.o \
./Core/Src/stm32l4s5i_iot01_qspi.o \
./Core/Src/stm32l4s5i_iot01_tsensor.o \
./Core/Src/stm32l4xx_hal_msp.o \
./Core/Src/stm32l4xx_hal_ospi.o \
./Core/Src/stm32l4xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32l4xx.o 

C_DEPS += \
./Core/Src/comms.d \
./Core/Src/kalman.d \
./Core/Src/logger.d \
./Core/Src/main.d \
./Core/Src/mic.d \
./Core/Src/sensors.d \
./Core/Src/stm32l4s5i_iot01.d \
./Core/Src/stm32l4s5i_iot01_hsensor.d \
./Core/Src/stm32l4s5i_iot01_psensor.d \
./Core/Src/stm32l4s5i_iot01_qspi.d \
./Core/Src/stm32l4s5i_iot01_tsensor.d \
./Core/Src/stm32l4xx_hal_msp.d \
./Core/Src/stm32l4xx_hal_ospi.d \
./Core/Src/stm32l4xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32l4xx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L4S5xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"/Users/sanadabubaker/Downloads/final_firstTRY/Drivers/Components/Common" -I"/Users/sanadabubaker/Downloads/final_firstTRY/Drivers/Components/hts221" -I"/Users/sanadabubaker/Downloads/final_firstTRY/Drivers/Components/lps22hb" -I"/Users/sanadabubaker/Downloads/final_firstTRY/Drivers/Components/mx25r6435f" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/comms.cyclo ./Core/Src/comms.d ./Core/Src/comms.o ./Core/Src/comms.su ./Core/Src/kalman.cyclo ./Core/Src/kalman.d ./Core/Src/kalman.o ./Core/Src/kalman.su ./Core/Src/logger.cyclo ./Core/Src/logger.d ./Core/Src/logger.o ./Core/Src/logger.su ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/mic.cyclo ./Core/Src/mic.d ./Core/Src/mic.o ./Core/Src/mic.su ./Core/Src/sensors.cyclo ./Core/Src/sensors.d ./Core/Src/sensors.o ./Core/Src/sensors.su ./Core/Src/stm32l4s5i_iot01.cyclo ./Core/Src/stm32l4s5i_iot01.d ./Core/Src/stm32l4s5i_iot01.o ./Core/Src/stm32l4s5i_iot01.su ./Core/Src/stm32l4s5i_iot01_hsensor.cyclo ./Core/Src/stm32l4s5i_iot01_hsensor.d ./Core/Src/stm32l4s5i_iot01_hsensor.o ./Core/Src/stm32l4s5i_iot01_hsensor.su ./Core/Src/stm32l4s5i_iot01_psensor.cyclo ./Core/Src/stm32l4s5i_iot01_psensor.d ./Core/Src/stm32l4s5i_iot01_psensor.o ./Core/Src/stm32l4s5i_iot01_psensor.su ./Core/Src/stm32l4s5i_iot01_qspi.cyclo ./Core/Src/stm32l4s5i_iot01_qspi.d ./Core/Src/stm32l4s5i_iot01_qspi.o ./Core/Src/stm32l4s5i_iot01_qspi.su ./Core/Src/stm32l4s5i_iot01_tsensor.cyclo ./Core/Src/stm32l4s5i_iot01_tsensor.d ./Core/Src/stm32l4s5i_iot01_tsensor.o ./Core/Src/stm32l4s5i_iot01_tsensor.su ./Core/Src/stm32l4xx_hal_msp.cyclo ./Core/Src/stm32l4xx_hal_msp.d ./Core/Src/stm32l4xx_hal_msp.o ./Core/Src/stm32l4xx_hal_msp.su ./Core/Src/stm32l4xx_hal_ospi.cyclo ./Core/Src/stm32l4xx_hal_ospi.d ./Core/Src/stm32l4xx_hal_ospi.o ./Core/Src/stm32l4xx_hal_ospi.su ./Core/Src/stm32l4xx_it.cyclo ./Core/Src/stm32l4xx_it.d ./Core/Src/stm32l4xx_it.o ./Core/Src/stm32l4xx_it.su ./Core/Src/syscalls.cyclo ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32l4xx.cyclo ./Core/Src/system_stm32l4xx.d ./Core/Src/system_stm32l4xx.o ./Core/Src/system_stm32l4xx.su

.PHONY: clean-Core-2f-Src


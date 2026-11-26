/*
 * 1. the mic is clocked at 2MHz, set on pin PE9 and outputs a bit stream
 *
 * 2. The DFSDM peripheral on PE7 reads the bits and runs a sinc3 filter that turns every 125 bits into a number
 * 			(2MHz / 125 = 16KHz)
 *
 * 3. DMA copies each number into our buffer (circular mode).
 * 		When the first half of the buffer is full, HAL calls the 'half complete' callback
 * 		When the second half fills, hal calls the 'complete' callback. At that point we take our measurment,
 * 		and dma   wrap around and overwrite the first half
 *
 * 	4. Once per second, mic_get_db() looks at the newest finished half and
 *      turns its loudness into dBFS.
 *      A double-buffering method was used because it's easy to implement and is accurate enough to indicate loudness.
 *
 *
 * 	CubeMX settings this code depends on (DFSDM1):
 *   Channel 2, SPI rising edge, internal clock, output clock divider 60
 *   (120 MHz / 60 = 2 MHz mic clock); Filter 0, Sinc3, Fosr 125, Iosr 1,
 *   continuous + fast mode, DMA circular, word width.
 * */

#include "mic.h"
#include "main.h"
#include <math.h>

extern DFSDM_Filter_HandleTypeDef hdfsdm1_filter0;

#define MIC_BUF_LEN 2048				/* each half = 1024 = 64 ms */


#define FULL_SCALE  1953125.0f            /* largest Sinc3 value at Fosr 125
 	 	 	 	 	 	 	 	 	 	 	 this value is the peak, and used as a reference for dBFS*/

static int32_t mic_buf[MIC_BUF_LEN];
static volatile int safe_half = -1;   /* 0 = first half safe, 1 = second, -1 = no data */

int mic_init(void)
{
	if (HAL_DFSDM_FilterRegularStart_DMA(&hdfsdm1_filter0, mic_buf, MIC_BUF_LEN) == HAL_OK) {
	    return 0;
	} else {
	    return -1;
	}
}

/* loudness of one block: max - min of the samples */
static int32_t peak_to_peak(const int32_t *buf, int n)
{
    int32_t mn = buf[0] >> 8, mx = mn;  /* bits 8-31, shift right */
    for (int i = 1; i < n; i++) {
        int32_t s = buf[i] >> 8;
        if (s < mn) mn = s;
        if (s > mx) mx = s;
    }
    return mx - mn;
}


/* dBFS of the latest half block ; -120 if no new data
 	0: max
 	more negative: quieter
 	-120: no new data
 	*/
float mic_get_db(void)
{
    int32_t p2p;

    if (safe_half < 0) return -120.0f;


    int32_t p2p = peak_to_peak(&mic_buf[safe_half * (MIC_BUF_LEN / 2)], MIC_BUF_LEN / 2);

    if (p2p < 1) p2p = 1; // avoid log(0)

    /* dBFS = 20 * log10(amplitude / full scale) */
    return 20.0f * log10f(((float)p2p / 2.0f) / FULL_SCALE);
}

void HAL_DFSDM_FilterRegConvHalfCpltCallback(DFSDM_Filter_HandleTypeDef *h) { safe_half = 0; }
void HAL_DFSDM_FilterRegConvCpltCallback(DFSDM_Filter_HandleTypeDef *h)     { safe_half = 1; }

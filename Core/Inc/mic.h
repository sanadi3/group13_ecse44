/*
 * Usage:
 *   mic_init();               // once, after the MX_..._Init() calls
 *   float db = mic_get_db();  // once per second
 */
#ifndef MIC_H
#define MIC_H

/* Start DFSDM + DMA streaming. Returns 0 on success, -1 on failure. */
int   mic_init(void);

/* Sound level of the latest bit block, in dBFS (0 = loudest possible,
 * more negative = quieter). Returns -120 if no new data since last call. */
float mic_get_db(void);

#endif /* MIC_H */

#include "kalman.h"

int kalman_c(struct kalman_state *kstate, float measurement)
{
    kstate->p = kstate->p + kstate->q;

    if (kstate->p + kstate->r <= 0.0f)
    {
        return -1;
    }

    kstate->k = kstate->p / (kstate->p + kstate->r);
    kstate->x = kstate->x + kstate->k * (measurement - kstate->x);
    kstate->p = (1.0f - kstate->k) * kstate->p;
    return 0;
}

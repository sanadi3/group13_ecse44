#ifndef KALMAN_H
#define KALMAN_H

struct kalman_state {
    float q;
    float r;
    float x;
    float p;
    float k;
};

int kalman_c(struct kalman_state *kstate, float measurement);

#endif

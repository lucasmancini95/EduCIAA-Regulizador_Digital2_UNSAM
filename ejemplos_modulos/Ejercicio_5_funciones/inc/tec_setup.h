
#ifndef _TEC_SETUP_H_
#define _TEC_SETUP_H_

#include "gpio_set.h"

typedef enum{TEC1, TEC2, TEC3, TEC4}tec_t;


void TEC_cfg(tec_t tec);
state_t TEC_GetState(tec_t tec);

#endif

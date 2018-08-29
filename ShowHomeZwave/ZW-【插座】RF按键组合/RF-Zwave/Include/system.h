#ifndef SYSTEM_H
#define SYSTEM_H

#include "sn8p2511.h"

//--------------typedef-----------
typedef  unsigned char u8t;
typedef  unsigned int u16t;
typedef enum{FALSE = 0, TRUE = !FALSE}  FlagStatus;

#define zWaveSingle FP00
#define zWavePower FP10

void GpioInit(void);
void TimerInit(void);
void Delay1s(u8t);
FlagStatus SingleJudge(void);
void rfOnPulse(void);
void rfOffPulse(void);
void waveOffPulse(void);

#endif
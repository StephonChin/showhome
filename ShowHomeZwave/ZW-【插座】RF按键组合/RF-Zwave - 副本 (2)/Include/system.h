#ifndef SYSTEM_H
#define SYSTEM_H

#include "sn8p2511.h"

//--------------typedef-----------
typedef  unsigned char u8t;
typedef  unsigned int u16t;
typedef enum{FALSE = 0, TRUE = !FALSE}  FlagStatus;


#define rfOn  FP22
#define rfOff FP21
#define zWavePower  FP23
#define zWaveSingle FP24

void GpioInit(void);
void TimerInit(void);
void Delay5s(void);
FlagStatus SingleJudge(void);
void rfOnPulse(void);
void rfOffPulse(void);
void waveOffPulse(void);

#endif
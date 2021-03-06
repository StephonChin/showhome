#ifndef BEEP_H
#define BEEP_H

#include "sn8p2511.h"
#include "key.h"

void BeepPulseControl(void);

extern bit out_enable;
extern bit power_save_enable;
extern bit flagKeyTrigger;
extern bit flagWarningInit;
#define    pulsePort   FP12 

#endif
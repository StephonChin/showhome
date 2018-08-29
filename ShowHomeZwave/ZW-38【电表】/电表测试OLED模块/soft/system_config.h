#ifndef SYSTEM_CONFIG_H
#define SYSTEM_CONFIG_H

#include "stm8s003f3p.h"
#include "stm8s103f.h"
#include "stm8s_bitsdefine.h"

typedef unsigned char u8t;
typedef unsigned int u16t;
typedef unsigned long u32t;
typedef enum{RESET = 0, SET = !RESET}		FlagStatus, BitStatus;

#endif
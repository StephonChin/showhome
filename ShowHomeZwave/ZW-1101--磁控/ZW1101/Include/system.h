#ifndef __SYSTEM_H__
#define __SYSTEM_H__

#include "sn8p2511.h"

typedef 		unsigned char		u8t;
typedef			unsigned int		u16t;
typedef			enum{FALSE = 0, TRUE = !FALSE}		FlagStatus;


extern FlagStatus 	wakeFlag;
extern FlagStatus 	triggerFlag;
extern FlagStatus  sleepFlag;

#endif
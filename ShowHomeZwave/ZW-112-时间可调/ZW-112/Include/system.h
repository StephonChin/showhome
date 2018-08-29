#ifndef	__SYSTEM_H__
#define	__SYSTEM_H__

#include "sn8p2711b.h"

typedef	unsigned char uchar;
typedef unsigned long  uint;
typedef bit		  BitStatus;

extern uchar	sysForbidTime;			//禁止触发时间

extern BitStatus sysKeyStatusFlag;		//按键状态标志位,状态发生变化时即发出信号
extern BitStatus sysPirStatusFlag;		//PIR信号检测到标志位
extern BitStatus sysTriacInit;			//输出信号初始化标志
extern BitStatus sysTriacFlag;			//输出信号标志位
extern BitStatus forbidFlag;

#endif
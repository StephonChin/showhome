/*********************************************
 * @ FileName: system.c
 * @ Date: 2015.10.15
 * @ Author: DS.Chin
 * @ Describe: 全局变量
*********************************************/
#include "system.h"

uchar	sysForbidTime;			//禁止触发时间

BitStatus 		sysKeyStatusFlag;		//按键状态标志位,状态发生变化时即发出信号
BitStatus 		sysPirStatusFlag;		//PIR信号检测到标志位
BitStatus 		sysTriacInit;			//输出信号初始化标志
BitStatus 		sysTriacFlag;			//输出信号标志位
BitStatus		forbidFlag;
#ifndef __mode_h
#define __mode_h
#include "intrins.h"
#define uchar unsigned char
extern bit power_on_init;
extern bit power_ok_init;
extern bit conditionst_init;
extern bit conditionsn_init;
extern bit sensor_trigger_init;
extern bit sensor_normal_init;
extern bit control_init;
extern bit alarm_normal_init;
extern bit alarm_trigger_init;
extern bit power_err_init;

//----------------------------
// @Modify DS.Chin 2015.10.13
extern bit removeInit;
extern bit removeOkInit;
extern bit addInit;
extern bit addOkInit;
extern bit rmvAddErrInit;
//-----------------------------

/*bit power_on_flag_buff;
bit power_ok_flag_buff;
bit wlan_ng_flag_buff;
bit wlan_ok_flag_buff;
bit sensor_trigger_flag_buff;
bit sensor_normal_flag_buff;
bit control_flag_buff;
bit alarm_normal_flag_buff;
bit alarm_trigger_flag_buff;*/

extern idata uchar r_duty[17];
extern idata uchar g_duty[17];
extern idata uchar b_duty[17];

void mode_play(void);
#endif

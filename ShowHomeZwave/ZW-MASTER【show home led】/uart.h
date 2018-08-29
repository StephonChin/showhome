#ifndef __uart_h
#define __uart_h
#define uchar unsigned char

extern bit uart_updata;
//extern bit mode_init;
extern bit power_ok_flag;
extern bit power_on_flag;
extern bit power_err_flag;
extern bit conditionst_flag;
extern bit conditionsn_flag;
extern bit sensor_trigger_flag;
extern bit sensor_normal_flag;
extern bit control_flag;
extern bit alarm_normal_flag;
extern bit alarm_trigger_flag;

//----------------------------
// @Modify DS.Chin 2015.10.13
extern bit removeFlag;
extern bit removeOkFlag;
extern bit addFlag;
extern bit addOkFlag;
extern bit rmvAddErrFlag;
//-----------------------------

extern uchar mode_step;

extern uchar  uart_data[14];
void uart_receive(void);
#endif
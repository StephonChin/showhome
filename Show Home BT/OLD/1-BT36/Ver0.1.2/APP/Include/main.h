#ifndef __MAIN_H__
#define __MAIN_H__

extern void Mcu_Config(void);            // -> mcu_config.c

extern void Rcv_Data_From_App(void);          // -> data_rcv.c

extern void Respond_App(void);          // ->data_send.c

extern void Led_Display(void);           // -> led_display.c

extern void Data_Process(void);

extern void Key_Scan(void);

extern void Timer_Control(void);

extern void Led_Display(void);

extern void Respond_App_Init(void);

extern void BT_Control(void);

extern void Power_On_Init(void);

#endif

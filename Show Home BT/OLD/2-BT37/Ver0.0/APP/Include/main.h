#ifndef __MAIN_H__
#define __MAIN_H__

volatile _Bool	TIM1_UPDATE_FLAG		@TIM1_SR1:0;

extern void Mcu_Config(void);            // -> mcu_config.c

extern void Rcv_Data_From_App(void);          // -> data_rcv.c

extern void Respond_App(void);          // ->data_send.c

extern void Led_Display(void);           // -> led_display.c

extern void Data_Process(void);
extern void Power_On_Init(void);

extern void Key_Scan(void);

extern void Switch_On_Off(void);

extern void AD_Scan(void);
#endif

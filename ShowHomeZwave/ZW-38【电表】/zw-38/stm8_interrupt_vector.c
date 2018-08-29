/*	BASIC INTERRUPT VECTOR TABLE FOR STM8 devices
 *	Copyright (c) 2007 STMicroelectronics
 */
#include "stm8s003f3.h"
#include "type.h"
#define uchar unsigned char 
#define u8    unsigned char
#define u16   unsigned short
#define u32   unsigned long 


u8 bstate=0;
u8 report_state=0;
u16 delta_time;
u8 delta_time_count1;
u8 delta_time_count2;
u16 rate_buf;
u16 rate;
u8 rate_count;

extern u8 buf[3];

void ext10 (void);
void uart1_rx(void);
void time4(void);
//void time2 (void);

extern void ade7753_read_bytes(uchar reg_name);
extern void meter_data_get (u8 reg_name);
extern void meter_watt(u8 val);


typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

@far @interrupt void NonHandledInterrupt (void)
{
	/* in order to detect unexpected events during development, 
	   it is recommended to set a breakpoint on the following instruction
	*/
	return;
}

extern void _stext();     /* startup routine */

struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* reset */
	{0x82, NonHandledInterrupt}, /* trap  */
	{0x82, NonHandledInterrupt}, /* irq0  */
	{0x82, NonHandledInterrupt}, /* irq1  */
	{0x82, NonHandledInterrupt}, /* irq2  */
	{0x82, (interrupt_handler_t)ext10}, /* irq3  */
	{0x82, NonHandledInterrupt}, /* irq4  */
	{0x82, NonHandledInterrupt}, /* irq5  */
	{0x82, NonHandledInterrupt}, /* irq6  */
	{0x82, NonHandledInterrupt}, /* irq7  */
	{0x82, NonHandledInterrupt}, /* irq8  */
	{0x82, NonHandledInterrupt}, /* irq9  */
	{0x82, NonHandledInterrupt}, /* irq10 */
	{0x82, NonHandledInterrupt}, /* irq11 */
	{0x82, NonHandledInterrupt}, /* irq12 */
	{0x82, NonHandledInterrupt}, /* irq13 */
	{0x82, NonHandledInterrupt}, /* irq14 */
	{0x82, NonHandledInterrupt}, /* irq15 */
	{0x82, NonHandledInterrupt}, /* irq16 */
	{0x82, NonHandledInterrupt}, /* irq17 */
	{0x82, (interrupt_handler_t)uart1_rx}, /* irq18 */
	{0x82, NonHandledInterrupt}, /* irq19 */
	{0x82, NonHandledInterrupt}, /* irq20 */
	{0x82, NonHandledInterrupt}, /* irq21 */
	{0x82, NonHandledInterrupt}, /* irq22 */
	{0x82, (interrupt_handler_t)time4}, /* irq23 */
	{0x82, NonHandledInterrupt}, /* irq24 */
	{0x82, NonHandledInterrupt}, /* irq25 */
	{0x82, NonHandledInterrupt}, /* irq26 */
	{0x82, NonHandledInterrupt}, /* irq27 */
	{0x82, NonHandledInterrupt}, /* irq28 */
	{0x82, NonHandledInterrupt}, /* irq29 */
};

@near @interrupt void ext10 (void)
{
	rate_count+=1;
	if(rate_count>99)
	{
		rate_count=0;
		rate=rate_buf;
		rate_buf=0;
	}

	ade7753_read_bytes(0x0c);
	
	if((buf[0]&0x04)==0x04){
		  meter_watt(LAENERGY);
			meter_watt(LVAENERGY);
		}
	
	if((buf[0]&0x10)==0x10)
	{
    switch(bstate)
		{
			case get_vrms:
			meter_data_get(VRMS);
			break;
			
			case get_irms:
			meter_data_get(IRMS);
			break;
			
			case get_chanel1_waveform:
			meter_data_get(WAVEFORM);
			break;
			
			case get_chanel2_waveform:
			meter_data_get(WAVEFORM);
			break;
			
			/*case get_aenergy:
			meter_data_get(LAENERGY);
			break;*/
			
			default:
			break;
		}
	}
	
	
}



@near @interrupt void uart1_rx (void)
{
	static u8 uart_data=0;
	static u8 get_enable=0;
	static u8 get_flag=0;
	
	if((UART1_SR&0x20)==0x20)
	{
		UART1_SR&=0xbf;
		uart_data=UART1_DR;
		
		if(uart_data=='$')
		{
		  get_enable=1;
			get_flag=0;
		}
			
		if(get_enable)
		{
    	if(uart_data=='W') {if(get_flag==0){report_state=report_w;} else{report_state=report_k;}get_enable=0;}
	    else if(uart_data=='V') {if(get_flag==0){report_state=report_v;}else{report_state=report_va;}get_enable=0;}
		  else if(uart_data=='A') {report_state=report_a;get_enable=0;}
		  else if(uart_data=='K') {get_flag=1;}
		  else if(uart_data=='D') {report_state=report_d;get_enable=0;}
		  else if(uart_data=='R') {report_state=report_r;get_enable=0;}
		else if(uart_data=='F') {report_state=report_rate;get_enable=0;}
			
		}
	}
}

@near @interrupt void time4 (void)
{
	TIM4_SR&=0xfe;
	rate_buf+=1;
	delta_time_count1+=1;
	if(delta_time_count1>99)
	{
		delta_time_count1=0;
		delta_time_count2+=1;
		if(delta_time_count2>9)
		{
			delta_time_count2=0;
		  delta_time+=1;
		  if(delta_time>999)
		  delta_time=999;
		}
	}
}

/*@near @interrupt void time2 (void)
{
	TIM2_SR1&=0xfe;
	rate_buf+=1;
}*/


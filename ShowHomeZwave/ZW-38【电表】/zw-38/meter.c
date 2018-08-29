/*--------------------------------
*author:chenyk
*data:2015.5.4
*ver:ver1
--------------------------------*/
#include "stm8s003f3.h"
#include "type.h"
#include "meter.h"

extern u8 bstate;
extern u8 meter_updata_type;

/********************************
*函数名:meter_get
*功能:
*输入参数:
*输出参数:
*********************************/
void meter_get(void)
{
	switch(bstate)
	{
		case get_vrms:
		if(meter_updata_type==vrms_updata)
		  bstate=get_irms;
		break;
		
		case get_irms:
		if(meter_updata_type==irms_updata)
		  bstate=get_vrms;
		break;
		
		/*case get_aenergy:
		if(meter_updata_type==aenergy_updata)
		  bstate=get_irms;
		break;*/
		
		default:
		bstate=get_vrms;
		break;
		
	}
}

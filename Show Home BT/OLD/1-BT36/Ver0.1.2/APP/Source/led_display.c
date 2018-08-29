/********************************
 * Led_Display
**********************************/
#include "iostm8s003f3.h"
#include "system.h"


/******************************************/
		/* defines */
#define			PORT_SWITCH								PD_ODR_ODR2
#define			PORT_LED									PA_ODR_ODR3


/***********************************
 * Function
************************************/
void Led_Display(void)
{
		if (PORT_SWITCH == 1)
		{
				PORT_LED	= 0;
		}
		else
		{
				PORT_LED	= 1;
		}
}
/*---------------------------------------
 * FileName: uart_with_zwave.c
 */
#include "uart.h"

/*--------------------------------------------------------
 * Global variable
 */

u8t dataReceive[3];
u8t dataReceive2[5];
u32t dataDisplay;

FlagStatus flagCmdStart;
FlagStatus flagCmdEnd;


/*-----------------------------------------------------
 * FunctionName: UartInterrupt
 * Describe: uart receive interrupt process. to receive the comannd
 */
@far @interrupt void UartInterrupt(void)
{
	u8t catNum = 0;
	static u8t characterCnt;
	
	if (!flagCmdStart)
	{
		dataReceive[characterCnt] = uartDataRegistor;
		
		characterCnt++;
		if (characterCnt == 3)
		{
			flagCmdStart = 1;
			characterCnt = 0;
		}
	}
	else
	{
		uartDataRegistor = 0;
	}
	/*else
	{
		if (characterCnt == 0)
		{
			dataReceive[0] = uartDataRegistor;
			if (dataReceive[0] == '0')			
					characterCnt  = 1;
		}
		else
		{
			dataReceive[1] = uartDataRegistor;
			if (dataReceive[1] == 'x' || dataReceive[1] == 'X')
			{
				flagCmdEnd    = 0;
				flagCmdStart  = 1;
				characterCnt++;
				for (catNum = 2; catNum < 12; catNum++)
					dataReceive[catNum] = 0;
			}
			else
				characterCnt = 0;
		}
	}*/
}

/*-----------------------------------------------------
 * FunctionName: DataGet
 */
void DataGet(void)
{
	if (flagCmdStart)
	{
		flagCmdStart = 0;
		dataDisplay = //(u16t)(dataReceive[0] *16*16*16*16*16) +
									(u32t)((u32t)dataReceive[0] *16*16*16*16) +
									//(u16t)(dataReceive[2] *16*16*16) +
									(u32t)((u32t)dataReceive[1] *16*16) +
									//(u16t)(dataReceive[1] *16) +
									(u32t)dataReceive[2];
		
		dataReceive2[0] = (u8t)(dataDisplay / 10000);
		dataReceive2[1] = (u8t)(dataDisplay % 10000 / 1000);
		dataReceive2[2] = (u8t)(dataDisplay % 1000 / 100);
		dataReceive2[3] = (u8t)(dataDisplay % 100 / 10);
		dataReceive2[4] = (u8t)(dataDisplay % 10);
	}
}

/*-----------------------------------------------------------------
 * FunctionName: RespondSre
 * Describe: when receive a  command , respond
 */
void RespondStr(u8t *pStr)
{
	u8t strLen = 0;
	u8t catCnt = 0;
	static u8t errCnt;
	strLen = (u8t)strlen(pStr);
	
	for (catCnt = 0; catCnt < strLen; catCnt++)
	{
		errCnt = 250;
		while (!flagUartTransmit && errCnt)		errCnt--;
		uartDataRegistor = *(pStr + catCnt);
	}	
} 
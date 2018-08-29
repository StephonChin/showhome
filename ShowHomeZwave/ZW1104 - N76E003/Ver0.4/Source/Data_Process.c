/*******************************************************************
	*
	* @FileName		Data_Process.c
	* @Date				2017.03.03
	* @Author			DS.Chin
	*
*********************************************************************/
#include "Data_Process.h"

/* @Gloable Variables --------------------------------------*/
_Flag	NetChgFlag;


/* @File Variables -----------------------------------------*/
_Flag		TamperCloseFlag;
_Flag		ConnectFlag;
_Flag		SensorFlag;
_Flag 	    NetPortFlag;
_Uint8	    NetPortTime;

enum
{
	TAMPER_IDLE,
	TAMPER_CLOSE,
	TAMPER_OPEN
}TamperStatus;

enum
{
	NET_IDLE,
	NET_CONNECT,
	NET_DISCONNECT
}NetStatus;




/***********************************************************************
	*
	* @FunctionName Power_On_Init
	*
***/
void Power_On_Init(void)
{
	/* 上电检测防摘开关状态 */
	if (PORT_TAMPER == RESET)		TamperStatus = TAMPER_CLOSE;
	else							TamperStatus = TAMPER_OPEN;

	//上电时自动检测组网状态
	NetPortFlag = TRUE;
}






/***********************************************************************
	*
	* @FunctionName	Data_Process
	*
***/
void Data_Process(void)
{
	/* 检测组网状态*/
	if (NetPortFlag == TRUE)
	{
		NetPortTime++;
		if (NetPortTime > 10) // > 100ms
		{
			NetPortFlag = FALSE;
			if (PORT_DEV_ADD == SET)		NetStatus = NET_DISCONNECT;
			else												NetStatus = NET_CONNECT;
		}
	}
	else
	{
		NetPortTime = 0;
	}
	
	
	/* to check the net status, change mode to G-FAST when connected, & to */
	/* RGB-SLOWLY when disconnected */
	if (NetStatus != NET_IDLE)
	{
		if (NetStatus == NET_CONNECT)
		{
			ConnectFlag 			= TRUE;
			LedData.ModeBuf		= LED_G_FAST;			//组网成功后，绿灯快闪，即时生效
		}
		else if (NetStatus == NET_DISCONNECT)
		{
			ConnectFlag				= FALSE;
			LedData.ModeBuf		= LED_RGB_SLOW;
		}

		LedData.Mode			= LedData.ModeBuf;
		LedData.InitFlag	= TRUE;

		NetStatus = NET_IDLE;
	}
	
	
	
	
	/* have not connect to the net , keep the mode as RGB flash slowly when */
	/* Tamper tirg. Keep Off mode when sensor trig */
	if (ConnectFlag == FALSE)
	{
		/* check the tamper status */
		if (TamperStatus != TAMPER_IDLE)
		{
			if (TamperStatus == TAMPER_CLOSE)
			{
				TamperCloseFlag 	= TRUE;
				LedData.ModeBuf		= LED_RGB_OFF;
			}
			else
			{
				TamperCloseFlag 	= FALSE;
				LedData.ModeBuf 	= LED_RGB_SLOW;
			}
			
			// get mode & set init flag
			LedData.Mode			= LedData.ModeBuf;
			LedData.InitFlag 	= TRUE;
			WakeUpMode				= 1;
			WakeUpInit				= TRUE;
				
			// clear status
			TamperStatus = TAMPER_IDLE;
		}
	}
	
	
	
	
	
	/* when device connected to the net, change mode to B-SLOW when tamper trig */
	/* and to R-SLOW when tamper closed and sensor trig */
	else
	{
		/* check the tamper status */
		if (TamperStatus != TAMPER_IDLE)
		{
			if (TamperStatus == TAMPER_CLOSE)
			{
				TamperCloseFlag 	= TRUE;
				if (LedData.Mode != LED_R_SLOW)				LedData.ModeBuf 	= LED_RGB_OFF;
			}
			else
			{
				TamperCloseFlag 	= FALSE;
				if (LedData.Mode != LED_R_SLOW)				LedData.ModeBuf  	= LED_B_SLOW;
			}
			
			// get the mode and set init flag
			if (LedData.Mode != LED_R_SLOW)
			{
				LedData.Mode			= LedData.ModeBuf;
				LedData.InitFlag	= TRUE;
			}
			WakeUpMode				= 1;
			WakeUpInit				= TRUE;
			
			// clear status
			TamperStatus = TAMPER_IDLE;
		}
		
		
		/* check the sensor status when tamper closed */
		if (SensorStatus != SENSOR_IDLE)
		{
			if (SensorStatus == SENSOR_CLOSE)		
			{
				LedData.Mode 	= LED_R_SLOW;
				TriggerMode		= 1;
			}
			else																
			{
				LedData.Mode 	= LED_RGB_OFF;
				TriggerMode		= 0;
			}
			
			//get the mode and set init flag
			LedData.InitFlag	= TRUE;
			WakeUpMode				= 1;
			WakeUpInit				= TRUE;
			
			//clear status
			SensorStatus = SENSOR_IDLE;
		}
	}
	
	
	

	
	
	/* 检测电池校验位 */
	if (BattCheckNum == 1)
	{
		LedData.Mode			= LED_G_STEADY;
		LedData.InitFlag		= TRUE;
	}
	else if (BattCheckNum == 2)
	{
		BattCheckNum			= 0;
		LedData.Mode			= LED_RGB_OFF;
		LedData.InitFlag		= TRUE;
	}
}






/***********************************************************************
	*
	* @FunctionName		Interrupt_Process
	* 
***/
void Interrupt_Process(void) interrupt 7
{
	//Device Add
	if ((PIF & 0x20) == 0x20)
	{
		NetPortFlag = TRUE;
		NetPortTime = 0;
	}
	
	
	//Tamper
	if ((PIF & 0x80) == 0x80)
	{
		if (PORT_TAMPER == RESET)		TamperStatus = TAMPER_CLOSE;
		else							TamperStatus = TAMPER_OPEN;
	}
	
	
	//Sensor
	if ((PIF & 0x10) == 0x10)
	{
//		if (PORT_SENSOR == RESET)	SensorStatus 	= SENSOR_OPEN;
//		else											SensorStatus	= SENSOR_CLOSE;
	}
	
	
	
	
	//Clear
	PIF = 0x0;
}


/***********************************************************************
	*
	* @FunctionName		WKT_Interrupt
	* 
***/
void WKT_Interrupt(void) interrupt 17
{
	WKCON &= ~(BIT3 | BIT4);
	
	TrigForbidFlag = FALSE;
}

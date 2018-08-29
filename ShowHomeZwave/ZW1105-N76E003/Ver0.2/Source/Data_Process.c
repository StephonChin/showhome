/*******************************************************************
	*
	* @FileName		Data_Process.c
	* @Date				2017.03.03
	* @Author			DS.Chin
	*
*********************************************************************/
#include "Data_Process.h"

/* @Gloable Variables --------------------------------------*/
_Flag		NetChgFlag;
_Flag		TrigForbidFlag;
_Flag		TrigInitFlag;

/* @File Variables -----------------------------------------*/
_Flag		TamperCloseFlag;
_Flag		ConnectFlag;
_Flag		PowerOnFlag;
_Flag 	NetPortFlag = TRUE;
_Uint8	NetPortTime;

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
}NetStatus,NetPreStatus;




/***********************************************************************
	*
	* @FunctionName Power_On_Init
	*
***/
void Power_On_Init(void)
{
//	/* To Check the device have or not connect to the net */
//	if (PORT_DEV_ADD == SET)		NetStatus = NET_DISCONNECT;
//	else												NetStatus = NET_CONNECT;
	
	/* Tamper status check */
	if (PORT_TAMPER == RESET)		TamperStatus = TAMPER_CLOSE;
	else												TamperStatus = TAMPER_OPEN;
	
	/* Check Sensor status */
	if (PORT_SENSOR == RESET)	SensorStatus 	= SENSOR_OPEN;
	else											SensorStatus	= SENSOR_CLOSE;
	
	NetPreStatus = NetStatus;
	PowerOnFlag = TRUE;
}






/***********************************************************************
	*
	* @FunctionName	Data_Process
	*
***/
void Data_Process(void)
{
	static _Uint8 ShakeTime;
	static _Flag	ShakeFlag;
	
	
	/* Check the PORT_TAMPER after pulse occur */
	if (NetPortFlag == TRUE)
	{
		NetPortTime++;
		if (NetPortTime > 10) // > 100ms
		{
			NetPortFlag = FALSE;
			if (PORT_DEV_ADD == SET)		NetStatus = NET_DISCONNECT;
			else											NetStatus = NET_CONNECT;
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
		ShakeTime++;
		if (ShakeTime > 2)
		{
			ShakeTime = 0;
			
			if (NetStatus == NET_CONNECT && PORT_DEV_ADD == RESET && NetPreStatus != NET_CONNECT)
			{
				ShakeFlag					= TRUE;
				ConnectFlag 			= TRUE;
				LedData.ModeBuf		= LED_G_FAST;
				if (PowerOnFlag != TRUE)			
				{
					NetChgFlag = TRUE;
				}
				NetPreStatus = NetStatus;
			}
			else if (NetStatus == NET_DISCONNECT && PORT_DEV_ADD == SET && NetPreStatus != NET_DISCONNECT)
			{
				ShakeFlag					= TRUE;
				ConnectFlag				= FALSE;
				LedData.ModeBuf		= LED_RGB_SLOW;
				NetPreStatus = NetStatus;
			}

			if (ShakeFlag == TRUE)
			{
				ShakeFlag = FALSE;
				
				// get mode & set init Flag
				LedData.Mode			= LedData.ModeBuf;
				LedData.InitFlag	= TRUE;
			}
			// clear status
			PowerOnFlag = FALSE;
			NetStatus = NET_IDLE;
		}
	}
	else
	{
		ShakeTime		= 0;
		ShakeFlag 	= FALSE;
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
				TamperCloseFlag = TRUE;
				LedData.ModeBuf = LED_RGB_OFF;
			}
			else
			{
				TamperCloseFlag = FALSE;
				LedData.ModeBuf = LED_RGB_SLOW;
			}
			
			// get mode & set init flag
			LedData.Mode 			= LedData.ModeBuf;
			LedData.InitFlag 	= TRUE;
			WakeUpMode				= 1;
			WakeUpInit				= TRUE;
				
			// clear status
			TamperStatus = TAMPER_IDLE;
		}
	}
	
	
	
	
	
	/* when device connected to the net, change mode to B-SLOW when tamper trig */
	/* and to R-SLOW when tamper closed and sensor trig */
	else if (NetChgFlag == FALSE)
	{
		/* check the tamper status */
		if (TamperStatus != TAMPER_IDLE)
		{
			if (TamperStatus == TAMPER_CLOSE)
			{
				TamperCloseFlag = TRUE;
				LedData.ModeBuf = LED_RGB_OFF;
			}
			else
			{
				TamperCloseFlag = FALSE;
				LedData.ModeBuf = LED_B_SLOW;
			}
			
			// get the mode and set init flag
			LedData.Mode			= LedData.ModeBuf;
			LedData.InitFlag	= TRUE;
			WakeUpMode				= 1;
			WakeUpInit				= TRUE;
			
			// clear status
			TamperStatus = TAMPER_IDLE;
		}
		
		
		
		/* check the sensor status when tamper closed */
		if (TamperCloseFlag == TRUE)
		{
			if (SensorStatus != SENSOR_IDLE)
			{
				// �𶯴���ʱ
				if (SensorStatus == SENSOR_CLOSE)		
				{
					//�������״̬
					SensorStatus = SENSOR_IDLE;
					
					// ���뵽�����˸ģʽ
					LedData.Mode 	= LED_R_SLOW;
					
					// ��Z-WAVE�ź�Ϊģʽ1
					TriggerMode		= 1;
					
					// �����ν��뱨��ģʽ�����ʼ��ģʽ�����ͼ�ʱ������ͬʱ����Z-WAVE�����ź�
					if (TrigForbidFlag == FALSE)
					{
						TrigForbidFlag 		= TRUE;
						TrigInitFlag			= TRUE;
						LedData.InitFlag 	= TRUE;
						
						WakeUpMode				= 1;
						WakeUpInit				= TRUE;
					}
					
					// ��֮ǰ���ڱ���ģʽ�������ʼ����ʱ����
					else
					{
						TrigInitFlag			= TRUE;
					}
				}
				
				
				//�𶯴������ʱ������������ʱ���ٺ����ж�
				else if (TrigForbidFlag == FALSE)													
				{
					// �������״̬
					SensorStatus		= SENSOR_IDLE;
					
					// ������Ϩ��
					LedData.Mode 			= LED_RGB_OFF;
					LedData.InitFlag	= TRUE;
					
					// ��Z-WAVE�ź�ģʽΪ0
					TriggerMode		= 0;
					
					// ����Z-WAVE�����ź�
					WakeUpMode		= 1;
					WakeUpInit		= TRUE;
				}
				
				WakeUpMode				= 1;
				WakeUpInit				= TRUE;
			}
		}
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
		else												TamperStatus = TAMPER_OPEN;
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

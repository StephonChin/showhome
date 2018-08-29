/*******************************************************************************
	*
	* @File Name		Rf_Rcv.c
	* @Date					2016.12.26
	* @Author				DS.Chin
	*
********************************************************************************/
#include "Rf_Rcv.h"

/*Global Variables------------------------------------------------------------*/
_TypeStructRf	RfData;



/**
	* @Function Name	Rf_Rcv
	* @Parameters			None
	* @Return					None
	*/
void Rf_Rcv(void)
{
	static _Uint8	RcvBit;
	static _Uint8	PulseCnt;
	static _Flag	PulseTrigFlag;
	static _Uint8	RfBanTime;
	
	//--------------------Òýµ¼Âë 10ms¸ß2msµÍ-------------------//
	if (RfData.Status == RF_IDLE)
	{
		if (PORT_RF == SET)			PulseCnt++;
		else
		{
			if (PulseCnt > 70)	//7ms
			{
				RfData.Status = RF_STT;		
				PulseTrigFlag = FALSE;
				RcvBit = 0;
			}
			PulseCnt = 0;
		}
	}
	
	//--------------------²Ù×÷Âë---------------------------//
	else if (RfData.Status == RF_STT) 
	{
		if (PORT_RF == SET)		
		{
			PulseCnt++;
			PulseTrigFlag = TRUE;
		}
		else if (PulseTrigFlag == TRUE)
		{
			PulseTrigFlag = FALSE;
			
			RfData.RcvData.Buffer <<= 1;
			
			if (PulseCnt > 8 && PulseCnt < 20)
			{
				RfData.RcvData.Buffer |= 0x00000001;
			}
			else if (PulseCnt < 1 || PulseCnt > 19)
			{
				RfData.Status = RF_ERR;
			}

			if (RfData.Status != RF_ERR)
			{
				RcvBit++;
				if (RcvBit >= 32)
				{
					RfData.Status = RF_IDLE;
					RfData.RcvFlag = TRUE;
				}
			}
			
			PulseCnt = 0;
		}
	}
	
	else if (RfData.Status == RF_DONE)
	{
		RfBanTime++;
		if (RfBanTime > 200)
		{
			RfBanTime = 0;
			RfData.Status = RF_IDLE;
		}
	}
	
	//--------------------´íÎó×´Ì¬--------------------------//
	else if (RfData.Status == RF_ERR)
	{
		RcvBit = 0;
		PulseCnt = 0;
		RfData.RcvData.Buffer = 0x0;
		RfData.Status = RF_IDLE;
	}
}



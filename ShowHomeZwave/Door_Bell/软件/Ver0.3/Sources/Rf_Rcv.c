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
	static _Uint8	ByteCnt;
	static _Uint8	PulseCnt;
	static _Flag	PulseTrigFlag;
	static _Uint8	RfBanTime[2];
	static _Uint32 TestBuf;
	
	//--------------------Òýµ¼Âë 10ms¸ß2msµÍ-------------------//
	if (RfData.Status == RF_IDLE)
	{
		if (PORT_RF == SET)			PulseCnt++;
		else
		{
			if (PulseCnt > 80)	//8ms
			{
				RfData.Status = RF_STT;		
				PulseTrigFlag = FALSE;
				RcvBit = 0;
				ByteCnt = 0;
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
			
//			RfData.RcvData.Buffer <<= 1;
//			
//			if (PulseCnt > 10)
//			{
//				RfData.RcvData.Buffer |= 0x00000001;
//			}
//			
//			else if (PulseCnt < 1 || PulseCnt > 20)
//			{
//				RfData.Status = RF_ERR;
//			}
//
//			if (RfData.Status != RF_ERR)
//			{
//				RcvBit++;
//				if (RcvBit >= 32)
//				{
//					RfData.Status = RF_IDLE;
//					TestBuf = RfData.RcvData.Buffer;
//					RfData.RcvFlag = TRUE;
//				}
//			}
			RfData.RcvData.Opt[ByteCnt] <<= 1;
			if (PulseCnt > 7)
			{
				RfData.RcvData.Opt[ByteCnt] |= 0x01;
			}
			
			else if (PulseCnt < 1 || PulseCnt > 20)
			{
				RfData.Status = RF_ERR;
			}

			if (RfData.Status != RF_ERR)
			{
				RcvBit++;
				if (RcvBit >= 8)
				{
					RcvBit = 0;
					ByteCnt++;
					if (ByteCnt > 3)
					{
						RfData.Status = RF_DONE;
						TestBuf = RfData.RcvData.Buffer;
						RfData.RcvFlag = TRUE;
						TestBuf = RfData.RcvData.Buffer;
					}
				}
			}
			
			PulseCnt = 0;
		}
	}
	else if (RfData.Status == RF_DONE)
	{
		RfBanTime[0]++;
		if (RfBanTime[0] > 100)	//10ms
		{
			RfBanTime[0] = 0;
			RfBanTime[1]++;
			if (RfBanTime[1] > 50)
			{
				RfBanTime[1] = 0;
				RfData.Status = RF_IDLE;
			}
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



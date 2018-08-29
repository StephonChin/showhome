/**********************************************************
 * data_process
 * date:2016.04.21
 * author:DS.Chin
 */
/***********************************************************
 * Include
 */
#include "stm8s003f3p.h"
#include "stm8s_bitsdefine.h"
#include "system.h"
#include "data_process.h"

/************************************************************
 * defines
 */
#define			Reply_Repeat()			ReplyRepeatFlag = FALSE;\
															RepeatCnt = 0;\
															RepeatDelayTime = 0;

/*************************************************************
 * Global variables
 */
_Flag       BtInitFlag;         //bluetooth intialization' flag
_Flag       AppControlFlag;
_Flag		PowerOnFlag;

/***********************************************************
 * Power_On_Init
 */
void Power_On_Init(void)
{
	_Uchar	TempCnt = 0;
  RcvStatus = TRUE;
  RcvData.Header = 0xF0;
  PowerOnFlag = TRUE;
  
  // clear timer
  for (TempCnt = 0; TempCnt < 2; TempCnt++)
  {
	GroupOneOnHour[TempCnt] = 0xFF;
	GroupOneOnMinute[TempCnt] = 0xFF;
	GroupTwoOnHour[TempCnt] = 0xFF;
	GroupTwoOnMinute[TempCnt] = 0xFF;
	GroupThreeOnHour[TempCnt] = 0xFF;
	GroupThreeOnMinute[TempCnt] = 0xFF;
	
	GroupOneOffHour[TempCnt] = 0xFF;
	GroupOneOffMinute[TempCnt] = 0xFF;
	GroupTwoOffHour[TempCnt] = 0xFF;
	GroupTwoOffMinute[TempCnt] = 0xFF;
	GroupThreeOffHour[TempCnt] = 0xFF;
	GroupThreeOffMinute[TempCnt] = 0xFF;
  }
}

/**************************************************************
 * FunctionName: Data_Process
 */
void Data_Process(void)
{
  static _Uchar TempCnt;
  _Uint			TypeBuf = 0;
  _Uchar		GroupBuf = 0;
  
  
  
  
    if (RcvStatus || PowerOnFlag)
    {
        /* clear recieved flag */
        RcvStatus = FALSE;
		PowerOnFlag = FALSE;
        
        /* wait for bt init */
        if (BtInitFlag == FALSE)
        {
            if (RcvData.Header == 0xF0)
            {
                BtInitFlag = TRUE;              // bt's been initialized
                
				// reply
                PowerReplyFlag = TRUE; 
                Reply_Repeat()
            }
        } //wait for bt init
        
		
		
        /* Bt Init OK */
        else 
        {
			// get the type 
			TypeBuf = ((_Uint)(RcvData.TypeH >> 8)) + ((_Uint)RcvData.TypeL);
			
			
			
			
			// check the type -- type is mismatch
			if ( (TypeBuf & DEVICE_ID) != DEVICE_ID )
			{
				return;
			} // type is mismatch
			
			
			
			
			// type is match
			else
			{
				 // get the group number
				GroupBuf = RcvData.GroupClass;
				if (GroupBuf > 1)
				{
					return;		// when GroupClass is overflow
				}
					  
				switch (RcvData.Header & 0x0F)
				{
					//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
					// APP reply the power on command
					//
					case 0x01:
					  // clear repeat variables
					  Reply_Repeat();
					  
					  //  power reply
					  if (PowerReplyFlag == TRUE)
					  {
						PowerReplyFlag = FALSE;
						
						//status reply
						StatusReplyFlag = TRUE;
						StatusReplyCommand = 0x02;
					  } //  power reply
					  
					  // status reply
					  else
					  if (StatusReplyFlag == TRUE)
					  {
						StatusReplyFlag = FALSE;
					  } // status reply
					  
					  // normal reply					  //
					  else
					  if (NormalReplyFlag == TRUE)
					  {
						NormalReplyFlag = FALSE;
					  } //  normal reply
					break;
					
					
					
					//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
					// APP require the status ----------------############# one problem ############
					//
					case 0x03:
					  //ReplyRepeatFlag = TRUE;
					  Reply_Repeat();
					  
					  StatusReplyFlag = TRUE;
					  StatusReplyCommand = (RcvData.Header & 0xF0) | 0x02;
					  
					  StatusBothReplyFlag = TRUE;
					  
					break;
					
					
					
					
					//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
					//swich on/off 
					//
					case 0x09:
					  // reply 
					  Reply_Repeat();
					  
					  NormalReplyFlag = TRUE;
					  NormalReplyCommand = RcvData.Header;
					  
					  // APP control the swith flag --- under this case ,MCU do not reply the switch status to APP
					  AppControlFlag = TRUE;
					  
					  /* switch control */
					  if (RcvData.FirstCmd == 0x00)
					  {
						if (SwitchStatus[GroupBuf] != 0x00)
						{
						  SwitchStatus[GroupBuf] = 0x00;
						  SwitchInit[GroupBuf]   = TRUE;
						}
					  }
					  else
					  {
						if (SwitchStatus[GroupBuf] != 0x01)
						{
						  SwitchStatus[GroupBuf] = 0x01;
						  SwitchInit[GroupBuf]   = TRUE;
						}
					  }
					break;
					
					
					
					//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
					// timer -> switch on 
					//
					case 0x0A:
					  /* reply */
					  Reply_Repeat();
					  
					  NormalReplyFlag = TRUE;
					  NormalReplyCommand = RcvData.Header;
					  
					  /* set */
					  if (RcvData.GroupClass == 0x01)
					  {
						GroupOneOnHour[GroupBuf]   = RcvData.FirstCmd;
						GroupOneOnMinute[GroupBuf] = RcvData.SecondCmd;
					  }
					  else
					  if (RcvData.GroupClass == 0x02)
					  {
						GroupTwoOnHour[GroupBuf]   = RcvData.FirstCmd;
						GroupTwoOnMinute[GroupBuf] = RcvData.SecondCmd;
					  }
					  else if (RcvData.GroupClass == 0x03)
					  {
						GroupThreeOnHour[GroupBuf]   = RcvData.FirstCmd;
						GroupThreeOnMinute[GroupBuf] = RcvData.SecondCmd;
					  }
					break;
					
					
					
					//++++++++++++++++++++++++++++++++++++++++++++++++++++++++
					// timer -> switch off 
					//
					case 0x0B:
					  // reply 
					  Reply_Repeat();
					  
					  NormalReplyFlag = TRUE;
					  NormalReplyCommand = RcvData.Header;
					  
					  /* set */
					  if (RcvData.GroupClass == 0x01)
					  {
						GroupOneOffHour[GroupBuf]   = RcvData.FirstCmd;
						GroupOneOffMinute[GroupBuf] = RcvData.SecondCmd;
					  }
					  else
					  if (RcvData.GroupClass == 0x02)
					  {
						GroupTwoOffHour[GroupBuf]   = RcvData.FirstCmd;
						GroupTwoOffMinute[GroupBuf] = RcvData.SecondCmd;
					  }
					  else
					  if (RcvData.GroupClass == 0x03)
					  {
						GroupThreeOffHour[GroupBuf]   = RcvData.FirstCmd;
						GroupThreeOffMinute[GroupBuf] = RcvData.SecondCmd;
					  }
					break;
					
					
					
					//++++++++++++++++++++++++++++++++++++++++++++++
					//real time 
					//
					case 0x0C:
					  // reply
					  Reply_Repeat();
					  
					  NormalReplyFlag = TRUE;
					  NormalReplyCommand = RcvData.Header;
					  
					  //set
					  RealHour    = RcvData.GroupClass;
					  RealMinute  = RcvData.FirstCmd;
					  RealSecond  = RcvData.SecondCmd;
					  
					  //clear
					  SecondCnt1 = 0;
					  SecondCnt2 = 0;
					  SecondFlag = FALSE;
					break;
				}//switch
			}// type is match
		  
			// clear data
			RcvData.Header			 	= 0x00;
			RcvData.TypeH			 	= 0x00;
			RcvData.TypeL				= 0x00;
			RcvData.GroupClass	 	= 0x00;
			RcvData.FirstCmd			= 0x00;
			RcvData.SecondCmd		= 0x00;
		  
        } // Bt Init OK
    } //if
}


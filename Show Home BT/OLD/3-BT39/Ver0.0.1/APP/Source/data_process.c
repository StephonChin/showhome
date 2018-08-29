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
  RcvStatus = TRUE;
  RcvData.Header = 0xF0;
  PowerOnFlag = TRUE;
}

/**************************************************************
 * FunctionName: Data_Process
 */
void Data_Process(void)
{
  static _Uchar TempCnt;
  _Uint			TypeBuf = 0;
  
  
  
  
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
					// APP require the status
					//
					case 0x03:
					  //ReplyRepeatFlag = TRUE;
					  Reply_Repeat();
					  
					  StatusReplyFlag = TRUE;
					  StatusReplyCommand = (RcvData.Header & 0xF0) | 0x02;
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
						if (SwitchStatus != 0x00)
						{
						  SwitchStatus = 0x00;
						  SwitchInit   = TRUE;
						}
					  }
					  else
					  {
						if (SwitchStatus != 0x01)
						{
						  SwitchStatus = 0x01;
						  SwitchInit   = TRUE;
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
						GroupOneOnHour   = RcvData.FirstCmd;
						GroupOneOnMinute = RcvData.SecondCmd;
					  }
					  else
					  if (RcvData.GroupClass == 0x02)
					  {
						GroupTwoOnHour   = RcvData.FirstCmd;
						GroupTwoOnMinute = RcvData.SecondCmd;
					  }
					  else if (RcvData.GroupClass == 0x03)
					  {
						GroupThreeOnHour   = RcvData.FirstCmd;
						GroupThreeOnMinute = RcvData.SecondCmd;
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
						GroupOneOffHour   = RcvData.FirstCmd;
						GroupOneOffMinute = RcvData.SecondCmd;
					  }
					  else
					  if (RcvData.GroupClass == 0x02)
					  {
						GroupTwoOffHour   = RcvData.FirstCmd;
						GroupTwoOffMinute = RcvData.SecondCmd;
					  }
					  else
					  if (RcvData.GroupClass == 0x03)
					  {
						GroupThreeOffHour   = RcvData.FirstCmd;
						GroupThreeOffMinute = RcvData.SecondCmd;
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
					
					
					
					//+++++++++++++++++++++++++++++++++++++++++++++++++++++
					// dimmer
					case 0x0D:
						// reply
						Reply_Repeat();
					  
						NormalReplyFlag = TRUE;
						NormalReplyCommand = RcvData.Header;
					  
						if (RcvData.GroupClass == 0x01)
						{
							DimmerDuty = RcvData.FirstCmd;
							if (DimmerDuty > 100)
							{
								DimmerDuty = 100;
							}
							DimmerDutyBuf = DimmerDuty;
							
							// when duty = 0% ,turn off the switch
							if ( (DimmerDuty == 0) && (SwitchStatus == 0x01) )
							{
								SwitchStatus = 0x00;
								SwitchInit = TRUE;
							}
							
							// when switch is off && duty > 0% ,turn on the switch
							if ( (SwitchStatus == 0x00) && (DimmerDuty > 0))
							{
								SwitchStatus = 0x01;
								SwitchInit = TRUE;
							}
						}
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


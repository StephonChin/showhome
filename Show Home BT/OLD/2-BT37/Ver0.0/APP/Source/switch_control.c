/*******************************************************
 * Motor and timer
 */
#include "stm8s003f3p.h"
#include "stm8s_bitsdefine.h"
#include "system.h"
#include "switch_control.h"


/*************************************************
 * define
 */
#define     	PORT_LED      		PA_ODR_3
#define     	PORT_RELAY_0     	PD_ODR_4
#define		PORT_RELAY_1		PD_ODR_3

//----------------------------------------------------------

#define     LED_ON          0
#define     LED_OFF         1

#define		DUTY_MAX		100
#define		DUTY_MIN		0

#define		RELAY_ON		1
#define		RELAY_OFF	0

/*********************************************************
 * variables
 */
/* switch | led control */
_Uchar      LedDuty;

_Uchar   SecondCnt1;
_Uchar   SecondCnt2;
_Flag   SecondFlag;

_Uchar      	SwitchStatus[2];  // 00 -> off 01 -> on
_Flag       	SwitchInit[2];    //
_Uchar		SwitchBoth;



_Uchar  RealSecond;     //current second
_Uchar  RealMinute;     //current minute
_Uchar  RealHour;       //current hour

_Uchar  GroupOneOnHour[2];
_Uchar  GroupOneOnMinute[2];
_Uchar  GroupTwoOnHour[2];
_Uchar  GroupTwoOnMinute[2];
_Uchar  GroupThreeOnHour[2];
_Uchar  GroupThreeOnMinute[2];

_Uchar  GroupOneOffHour[2];
_Uchar  GroupOneOffMinute[2];
_Uchar  GroupTwoOffHour[2];
_Uchar  GroupTwoOffMinute[2];
_Uchar  GroupThreeOffHour[2];
_Uchar  GroupThreeOffMinute[2];


/*++++++++++++++++++++++++++++++++++++++++
 + FunctionName: LedDisplay
+++++++++++++++++++++++++++++++++++++++++*/
void Led_Display(void)
{
    static _Uchar      DutyCnt;
    
    DutyCnt++;
    if (DutyCnt > 99)
    {
      DutyCnt = 0;
    }
    
    //LED
    if (DutyCnt < LedDuty)
    {
      PORT_LED = LED_ON;
    }
    else
    {
      PORT_LED = LED_OFF;
    }
	#ifdef 		TEST_CODE
		// RED
		if (DutyCnt < RedDuty)
		{
			PORT_RED = LED_ON;
		}
		else
		{
			PORT_RED = LED_OFF;
		}
		
		// Green
		if (DutyCnt < GreenDuty)
		{
			PORT_GREEN = LED_ON;
		}
		else
		{
			PORT_GREEN = LED_OFF;
		}
	#endif
    
}

/******************************************************
 * timer 4 1s
 */
@far @interrupt void Tim4_Update_Interrupt(void)
{
  TIM4_SR &= (~0x01);
  
  SecondCnt1++;
  if (SecondCnt1 > 99) //100ms
  {
    SecondCnt1 = 0;
    SecondCnt2++;
    if (SecondCnt2 > 9)
    {
      SecondCnt2 = 0;
      SecondFlag = TRUE;     // set SecondFlag every second
    }
  }
}

/**********************************************************
 *  Time_Caculate
 */
void Time_Caculate(void)
{
  if (SecondFlag)
  {
    /* clear SecondFlag */
    SecondFlag = FALSE;
    
    /* get current second */
    RealSecond++;
    
    /* when reach 1 minute */
    if (RealSecond > 59)
    {
      /* clear Second */
      RealSecond = 0;
      
      /* get current minute */
      RealMinute++;
      
      /* hour puse  */
      if (RealMinute > 59)
      {
        /* clear hour */
        RealMinute = 0;
        
        /* hour plus 1 */
        RealHour++;
        
        /* clear hour value */
        if (RealHour > 23)
        {
          RealHour = 0;
        } //CurrentHour
      } //CurrentMinute
    } //CurrentSecond
  } // second flag
}

/********************************************************
 * Switch_On_Off
 */
void Switch_On_Off(void)
{
	_Uchar		TempCnt = 0;
	
  Time_Caculate();
  //-----------------------------------------------------------------------------------
  // get switch status
  //
  for (TempCnt = 0; TempCnt < 2; TempCnt++)
  {
	  if ( (GroupOneOffHour[TempCnt]   == RealHour) && (GroupOneOffMinute[TempCnt]    == RealMinute) )
	  {
		/* switch off */
		SwitchStatus[TempCnt]  = 0x00;
		SwitchInit[TempCnt]    = TRUE;
		
		/* clear */
		GroupOneOffHour[TempCnt]    = 0xff;
		GroupOneOffMinute[TempCnt]  = 0xff;
	  }
	   
	  if ( (GroupTwoOffHour[TempCnt]    == RealHour) && (GroupTwoOffMinute[TempCnt]    == RealMinute) )
	  {
		/* switch off */
		SwitchStatus[TempCnt]  = 0x00;
		SwitchInit[TempCnt]    = TRUE;
		
		/* clear */
		GroupTwoOffHour[TempCnt]    = 0xff;
		GroupTwoOffMinute[TempCnt]  = 0xff;
	  }
	  
	  if ( (GroupThreeOffHour[TempCnt]  == RealHour) && (GroupThreeOffMinute[TempCnt]  == RealMinute) ) 
	  {
		/* switch off */
		SwitchStatus[TempCnt]  = 0x00;
		SwitchInit[TempCnt]    = TRUE;
		
		
		/* clear */
		GroupThreeOffHour[TempCnt]    = 0xff;
		GroupThreeOffMinute[TempCnt]  = 0xff;
	  } // off status
	  
	  /* on status */
	  if ( (GroupOneOnHour[TempCnt]    == RealHour) && (GroupOneOnMinute[TempCnt]    == RealMinute) )
	  {
		/* switch On */
		SwitchStatus[TempCnt]  = 0x01;
		SwitchInit[TempCnt]    = TRUE;
		
		/* clear */
		GroupOneOnHour[TempCnt]     = 0xff;
		GroupOneOnMinute[TempCnt]  = 0xff;
	  }
	   
	  if ( (GroupTwoOnHour[TempCnt]    == RealHour) && (GroupTwoOnMinute[TempCnt]    == RealMinute) )
	  {
		/* switch On */
		SwitchStatus[TempCnt]  = 0x01;
		SwitchInit[TempCnt]    = TRUE;
		
		/* clear */
		GroupTwoOnHour[TempCnt]    = 0xff;
		GroupTwoOnMinute[TempCnt]  = 0xff;
	  }
	  
	  if ( (GroupThreeOnHour[TempCnt]  == RealHour) && (GroupThreeOnMinute[TempCnt]  == RealMinute) ) 
	  {
		/* switch On */
		SwitchStatus[TempCnt]  = 0x01;
		SwitchInit[TempCnt]    = TRUE;
		
		/* clear */
		GroupThreeOnHour[TempCnt]    = 0xff;
		GroupThreeOnMinute[TempCnt]  = 0xff;
	  } // on status
  } // for
    
  
  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // switch[0] control
  //
  if (SwitchInit[0] == TRUE)
  {
		/* clear init flag */
		SwitchInit[0] = FALSE;
		
		// status reply 
		
		if (AppControlFlag == TRUE)
		{
		  AppControlFlag = FALSE;			// when switch status is changed by the APP,do not reply
		}
		else
		{
		  RepeatCnt = 0;
		  RepeatDelayTime = 0;
		  ReplyRepeatFlag     = FALSE;
		  
		  StatusReplyFlag = TRUE;
		  StatusReplyCommand   = 0x02;
		  
		  ReplyStatus = SwitchStatus[0];
		  ReplyGroup = 0;
		  
		  //when switch 0 has been changed
		  SwitchBoth++;
		}
		
		if (SwitchStatus[0] == 0x01) // switch on
		{
			PORT_RELAY_0 = RELAY_ON;
		} //switch on
		
		else //switch off
		{
			PORT_RELAY_0  = RELAY_OFF;
		} //switch off
	
	} // switch[0] control
	
	//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // switch[1] control
  //
  if (SwitchInit[1] == TRUE)
  {
		/* clear init flag */
		SwitchInit[1] = FALSE;
		
		// status reply 
		
		if (AppControlFlag == TRUE)
		{
		  AppControlFlag = FALSE;			// when switch status is changed by the APP,do not reply
		}
		else
		{
		  RepeatCnt = 0;
		  RepeatDelayTime = 0;
		  ReplyRepeatFlag     = FALSE;
		  
		  StatusReplyFlag = TRUE;
		  StatusReplyCommand   = 0x02;
		  
		  ReplyStatus = SwitchStatus[1];
		  ReplyGroup = 0x01;
		  
		  //when switch 1has been changed
		  SwitchBoth++;
		}
		
		if (SwitchStatus[1] == 0x01) // switch on
		{
			PORT_RELAY_1 = RELAY_ON;
		} //switch on
		
		else //switch off
		{
			PORT_RELAY_1  = RELAY_OFF;
		} //switch off
		
		
		
		//two switchs all have been changed
		if (SwitchBoth == 2)
		{
			StatusBothReplyFlag = TRUE;
		}
		SwitchBoth = 0;
	} // switch[1] control
	
	//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// led control
	//
	if ( (SwitchStatus[0] == 0) && (SwitchStatus[1] == 0) )
	{
		LedDuty = DUTY_MIN;
	}
	else
	{
		LedDuty = DUTY_MAX;
	}
}
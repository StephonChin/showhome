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
#define     PORT_LED      		PA_ODR_3
#define     PORT_RELAY     	PD_ODR_4

//---------------------------------------------------------
// test
#ifdef		TEST_CODE

	#define     PORT_RED      		PC_ODR_4
	#define     PORT_GREEN    	PC_ODR_5
	
#endif
//----------------------------------------------------------

#define     LED_ON          0
#define     LED_OFF         1

#define		DUTY_MAX		100
#define		DUTY_MIN		0

/*********************************************************
 * variables
 */
/* switch | led control */
_Uchar      LedDuty;

#ifdef		TEST_CODE

	_Uchar	 RedDuty = DUTY_MAX ;
	_Uchar	GreenDuty;
	
#endif

_Uchar   SecondCnt1;
_Uchar   SecondCnt2;
_Flag   SecondFlag;

_Uchar      SwitchStatus;  // 00 -> off 01 -> on
_Flag       SwitchInit = TRUE;    //



_Uchar  RealSecond;     //current second
_Uchar  RealMinute;     //current minute
_Uchar  RealHour;       //current hour

_Uchar  GroupOneOnHour     = 0xFF;
_Uchar  GroupOneOnMinute   = 0xFF;
_Uchar  GroupTwoOnHour     = 0xFF;
_Uchar  GroupTwoOnMinute   = 0xFF;
_Uchar  GroupThreeOnHour   = 0xFF;
_Uchar  GroupThreeOnMinute = 0xFF;

_Uchar  GroupOneOffHour     = 0xFF;
_Uchar  GroupOneOffMinute   = 0xFF;
_Uchar  GroupTwoOffHour     = 0xFF;
_Uchar  GroupTwoOffMinute   = 0xFF;
_Uchar  GroupThreeOffHour   = 0xFF;
_Uchar  GroupThreeOffMinute = 0xFF;


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
  Time_Caculate();
  //-----------------------------------------------------------------------------------
  // get switch status
  //
  if ( (GroupOneOffHour   == RealHour) && (GroupOneOffMinute   == RealMinute) )
  {
    /* switch off */
    SwitchStatus = 0x00;
    SwitchInit   = TRUE;
    
    /* clear */
    GroupOneOffHour   = 0xff;
    GroupOneOffMinute = 0xff;
  }
   
  if ( (GroupTwoOffHour   == RealHour) && (GroupTwoOffMinute   == RealMinute) )
  {
    /* switch off */
    SwitchStatus = 0x00;
    SwitchInit   = TRUE;
    
    /* clear */
    GroupTwoOffHour   = 0xff;
    GroupTwoOffMinute = 0xff;
  }
  
  if ( (GroupThreeOffHour == RealHour) && (GroupThreeOffMinute == RealMinute) ) 
  {
    /* switch off */
    SwitchStatus = 0x00;
    SwitchInit   = TRUE;
    
    
    /* clear */
    GroupThreeOffHour   = 0xff;
    GroupThreeOffMinute = 0xff;
  } // off status
  
  /* on status */
  if ( (GroupOneOnHour   == RealHour) && (GroupOneOnMinute   == RealMinute) )
  {
    /* switch On */
    SwitchStatus = 0x01;
    SwitchInit   = TRUE;
    
    /* clear */
    GroupOneOnHour   = 0xff;
    GroupOneOnMinute = 0xff;
  }
   
  if ( (GroupTwoOnHour   == RealHour) && (GroupTwoOnMinute   == RealMinute) )
  {
    /* switch On */
    SwitchStatus = 0x01;
    SwitchInit   = TRUE;
    
    /* clear */
    GroupTwoOnHour   = 0xff;
    GroupTwoOnMinute = 0xff;
  }
  
  if ( (GroupThreeOnHour == RealHour) && (GroupThreeOnMinute == RealMinute) ) 
  {
    /* switch On */
    SwitchStatus = 0x01;
    SwitchInit   = TRUE;
    
    /* clear */
    GroupThreeOnHour   = 0xff;
    GroupThreeOnMinute = 0xff;
  } // on status
    
  
  //--------------------------------------------------------------------------------------
  // switch control
  //
  if (SwitchInit == TRUE)
  {
    /* clear init flag */
    SwitchInit = FALSE;
    
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
	  
	  ReplyStatus = SwitchStatus;
    }
    
    if (SwitchStatus == 0x01) // switch on
    {
		#ifdef		TEST_CODE
		
			RedDuty    = DUTY_MIN;
			GreenDuty = DUTY_MAX;
			
		#endif
	  
		LedDuty    =  DUTY_MAX;
		PORT_RELAY = 1;
    } //switch on
    
    else //switch off
    {
		#ifdef		TEST_CODE
			
			RedDuty = DUTY_MAX;
			GreenDuty = DUTY_MIN;
			
		#endif
		
		LedDuty     = DUTY_MIN;
		PORT_RELAY  = 0;
    } //switch off
  } // if
}
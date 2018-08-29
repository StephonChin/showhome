/****************************************************
 * AD_Init
 */
#include "stm8s003f3p.h"
#include "stm8s_bitsdefine.h"
#include "system.h"
#include "ad_scan.h"

/****************************************************
 * defines
 */
#define		EOC									(ADC_CSR & 0x80)
 
/****************************************************
 * variables
 */
_Flag   ADActivedFlag;
_Uchar ShakeTime;
_Flag  StatusChgFlag;
/****************************************************
 * FunctionName: AD_Scan
 * Date: 2016.04.36
 */
void AD_Scan(void)
{
  _Uint         ADData = 0;
  
  /* ADS enable */
  if (ADActivedFlag == TRUE)
  {
    /* start to converse */
    ADC_CR1 |= 0x01;
    
    /* delay */
    while(!EOC);
    
    /* get data */
    ADData += (_Uint)ADC_DRL;
    ADData += ((_Uint)ADC_DRH) * 256;
    

    
    /* shake */
    if (StatusChgFlag == TRUE) //shake enable
    {
      ShakeTime++;
      if (ShakeTime > 199) //200 * 10ms = 2s
      {
        ShakeTime = 0;
        StatusChgFlag = FALSE;
      }
    } //shake enable
    
    /* control switch */
    else
    {
        
      /* switch on*/
      if (ADData > (_Uint)600)  //night
      {
        /* switch on*/
        if (SwitchStatus != 0x01)
        {
          SwitchStatus = 0x01;
          SwitchInit   = TRUE;
          
          /* set shake flag */
          StatusChgFlag = TRUE;
        }
      } //night
      
      /* switch off */
      else
      if ( (ADData < (_Uint)200) && (ADData > (_Uint)10) ) //daytime
      {
        /* switch off */
        if (SwitchStatus != 0x00)
        {
          SwitchStatus = 0x00;
          SwitchInit = TRUE;
        }
        
        /* set shake flag */
        StatusChgFlag = TRUE;
      } //daytime
    } //control switch
  } //ADS enable
  
  /* ADS enable */
  else
  {
    /* clear */
    StatusChgFlag = FALSE;
    ShakeTime = 0;
  }
}
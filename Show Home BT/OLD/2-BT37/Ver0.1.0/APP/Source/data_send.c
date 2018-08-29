/****************************************************
 * power_on_init.c
 */
 
/**************************************************************
 *Include
 */
#include "iostm8s003f3.h"
#include "system.h"
#include "data_send.h"

/*************************************************************
 * defines
 */
#define	  		UART_SEND_FLAG           UART1_SR_TXE
#define         UART_REGISTER            UART1_DR

#define         PACKAGE_HEAD            (_Uchar)0xFD
#define         PACKAGE_TAIL            (_Uchar)0xFE

#define 		REPEAT_CNT 				3		//�豸���ͻظ�����
#define 		REPEAT_TIME 			3		//50ms����ظ�

/*************************************************************
 * global variables
 */
_TypeReply	ReplyData;
_Flag				TypeReply;

_Flag				RepeatFlag;						//�ظ����ͱ�־λ
_Uchar   		RepeatCnt;						//�ظ�������������
_Uchar   		RepeatDelayTime;			//�ظ������ӳٲ���

/**************************************************************
* Function Name: Respond_App_Init
*/
void Respond_App_Init(void)
{
  TypeReply 			= TRUE;
	RepeatFlag 			= TRUE;
	RepeatCnt 			= 0;
	RepeatDelayTime = 0;
}

/**************************************************************
 * FunctionName: Respond_APP
 */
void Respond_App(void)
{
  	/* �豸���ͻظ� */
  	if (TypeReply == TRUE)
	{
	  	/* �ظ��ظ�����ʱ */
	  	if (RepeatFlag == TRUE)
		{
		  	/* ���ظ���־λ */
		  	RepeatFlag		= FALSE;
			
			/* �ظ����� */
			Respond_Byte(0xFC);  
          	Respond_Byte(DEVICE_NAME_ONE);
			Respond_Byte(DEVICE_NAME_TWO);
          	Respond_Byte(DEVICE_TYPE);
			Respond_Byte(0xFE);
		}
		
		/* �ظ��ظ���ʱ */
		RepeatDelayTime++;
        if (RepeatDelayTime > 49)	//500ms
		{
           	RepeatDelayTime = 0;
            RepeatFlag 		=TRUE;
                
            RepeatCnt++;
            if (RepeatCnt > 4)  //5��
            {
              	RepeatCnt = 0;
              	
				/* ��ظ���� */
				TypeReply = FALSE;
            }
        } // 50 * 10ms = 500ms
	}
	
	else
	{
		/* �ظ���Ų�Ϊ0ʱ�ظ����� */
		if (ReplyData.ReplyNum != 0)
		{
			/* �ظ��ظ�����ʱ */
			if (RepeatFlag == TRUE)
			{
				/* ���ظ���־λ */
				RepeatFlag		= FALSE;
				
				/* �ظ����� */
				Respond_Byte(PACKAGE_HEAD);  
				Respond_Byte(ReplyData.ReplyCmd);
				
				for (_Uchar TempCnt = 0; TempCnt < 7; TempCnt++)
				{
					Respond_Byte(ReplyData.ReplyOpt[TempCnt]); 
				}
				Respond_Byte(PACKAGE_TAIL);
			}
			
			/* �ظ��ظ���ʱ */
			RepeatDelayTime++;
			if (RepeatDelayTime > (REPEAT_TIME - 1) )	//���REPEAT_TIME * 10ms
			{
				RepeatDelayTime = 0;
				RepeatFlag 		=TRUE;
					
				RepeatCnt++;
				if (RepeatCnt > (REPEAT_CNT - 1) )  //REPEAT_CNT times
				{
					RepeatCnt = 0;
					
					/* ��ظ���� */
					ReplyData.ReplyNum	= 0;
				}
			} // 50 * 10ms = 500ms
		}
		
		
		else
		{
		  RepeatDelayTime = 0;
		  RepeatCnt = 0;
		}
	}

}

/**********************************************************************************
 * FunctionName: Respond_Str
 * Describe: when receive a  command , respond
 */
void Respond_Str(_Uchar *RspdStr)
{
    _Uchar  ErrCnt = 0;
    
    while (*RspdStr != '\0')
    {
        ErrCnt = 200;
        while (!UART_SEND_FLAG && ErrCnt)		
        {
            ErrCnt--;
        }
        UART_REGISTER = *RspdStr++;
    }
}   

/*********************************************************************************
 * FunctionName:Respond_Byte
 */
void Respond_Byte(_Uchar RspdByte)
{
    UART_REGISTER = RspdByte;
    while (!UART_SEND_FLAG);
}


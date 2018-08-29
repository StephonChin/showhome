/*****************************
*作者:chenyk
*日期:2014.10.31
******************************/
#include "mc96f6508a.h"
#include "uart.h"

bit power_ok_init;
bit power_err_init;
bit power_on_init;
bit conditionst_init;
bit conditionsn_init;
bit sensor_trigger_init;
bit sensor_normal_init;
bit control_init;
bit alarm_normal_init;
bit alarm_trigger_init;

//----------------------------
// @Modify DS.Chin 2015.10.13
bit removeInit;
bit removeOkInit;
bit addInit;
bit addOkInit;
bit rmvAddErrInit;
//------------------------------

uchar *tx_buf;

void uart_send(void);
//uchar code power_ok[8]={80,79,87,69,82,32,79,75};
//uchar code wlan_ng[7]={87,76,65,78,32,78,71};
//uchar code wlan_ok[7]={87,76,65,78,32,79,75};
//uchar code sensor_trigger[14]={83,69,78,83,79,82,32,84,82,73,71,71,69,82};
//uchar code sensor_normal[14]={83,69,78,83,79,82,32,32,78,79,82,77,65,76};
//uchar code control[7]={67,79,78,84,82,79,76};
//uchar code alarm_normal[13]={65,76,65,82,77,32,32,78,79,82,77,65,76};
//uchar code alarm_trigger[13]={65,76,65,82,77,32,84,82,73,71,71,69,82};
//void receive_init(void);
//void receive_power(void);
//void receive_power(void);
//void receive_wlan(void);
//void receive_sensor(void);
//void receive_control(void);
//void receive_alarm(void);
/*****************************
*名称:uart_receive
*功能:处理接收到的uart数据
*输入:
*输出:
*修改记录:
******************************/
void uart_receive(void)
{
  if(uart_updata==1)
  {
    uart_updata=0;
	mode_step = 0; 
		if(uart_data[1]=='p' && uart_data[3] == 'w' && uart_data[7] == 'k')/*$powerok#*/
		{
			uart_send();
			power_ok_flag=1;
			power_err_flag=0;
            power_ok_init=0;
		}
		else if(uart_data[1]=='p' && uart_data[3] == 'w' && uart_data[7] == 'r')/*$powerer#*/
		{
			uart_send();
			power_err_flag=1;
			power_ok_flag=0;
      power_err_init=0;
		}
		else if(uart_data[1]=='s' && uart_data[3] == 'n' && uart_data[7] == 't')/*$sensort#*/
		{
			if(power_ok_flag)
			{
			  uart_send();
			  sensor_trigger_flag=1;
			  sensor_normal_flag=0;
              sensor_trigger_init=0;
			}
		}
		else if(uart_data[1]=='s' && uart_data[3] == 'n' && uart_data[7] == 'n')/*$sensorn#*/
		{
			if(power_ok_flag)
			{
			  uart_send();
			  sensor_trigger_flag=0;
			  sensor_normal_flag=1;
			  sensor_normal_init=0;
			}
		}
		else if(uart_data[1]=='a' && uart_data[3] == 'a' && uart_data[6] == 't')/*$alarmt#*/
		{
			if(power_ok_flag)
			{
			  uart_send();
			  alarm_trigger_flag=1;
			  alarm_normal_flag=0;
			  alarm_trigger_init=0;
			}
		}
		else if(uart_data[1]=='a' && uart_data[3] == 'a' && uart_data[6] == 'n')/*$alarmn#*/
		{
			if(power_ok_flag)
			{
			  uart_send();
			  alarm_trigger_flag=0;
			  alarm_normal_flag=1;
			  alarm_normal_init=0;
			}
		}
		else if(uart_data[1]=='c' && uart_data[3] == 'n' && uart_data[11] == 't')/*$conditionst#*/
		{
			if(power_ok_flag)
			{
			  uart_send();
			  conditionst_flag=1;
			  conditionsn_flag=0;
			  conditionst_init=0;
			}
		}
		else if(uart_data[1]=='c' && uart_data[3] == 'n' && uart_data[11] == 'n')/*$conditionsn#*/
		{
			if(power_ok_flag)
			{
			  uart_send();
			  conditionst_flag=0;
			  conditionsn_flag=1;
			  conditionsn_init=0;
			}
		}
		else if(uart_data[1]=='c' && uart_data[3] == 'n' && uart_data[10] == 'r')/*$controller#*/
		{
			if(power_ok_flag)
			{
			  control_flag=1;
			  control_init=0;
			}
		}
		//-----------DS.Chin 2015.10.13
		else if(uart_data[1] == 'r' && uart_data[3] == 'm' && uart_data[5] == 'v' && uart_data[7] == 0)/*$remove#*/
		{
			if (power_ok_flag)
			{
				removeFlag    = 1;
				addFlag       = 0;
				addOkFlag     = 0;
				rmvAddErrFlag = 0;
				removeOkFlag  = 0;
				removeInit    = 0;
			}
		}
		else if (uart_data[1] == 'r' && uart_data[3] == 'm' && uart_data[5] == 'v' && uart_data[7] == 'k')/*$removeok#*/
		{
			if (power_ok_flag)
			{
				removeFlag    = 0;
				addFlag       = 0;
				addOkFlag     = 0;
				rmvAddErrFlag = 0;
				removeOkFlag  = 1;
				removeOkInit  = 0;
			}
		}
		else if (uart_data[1] == 't' && uart_data[3] == 'm' && uart_data[5] == 'o' && uart_data[7] == 't')/*$timeout#*/
		{
			if (power_ok_flag)
			{
				removeFlag    = 0;
				addFlag       = 0;
				addOkFlag     = 0;
				rmvAddErrFlag = 1;
				removeOkFlag  = 0;
				rmvAddErrInit = 0;
			}
		}
		else if (uart_data[1] == 'a' && uart_data[3] == 'd' && uart_data[5] == 0)/*$add#*/
		{
			if (power_ok_flag)
			{
				removeFlag    = 0;
				addFlag       = 1;
				addOkFlag     = 0;
				rmvAddErrFlag = 0;
				removeOkFlag  = 0;
				addInit       = 0;
			}
		}
		else if (uart_data[1] == 'a' && uart_data[3] == 'd' && uart_data[5] == 'k')/*$addok#*/
		{
			if (power_ok_flag)
			{
				removeFlag    = 0;
				addFlag       = 0;
				addOkFlag     = 1;
				rmvAddErrFlag = 0;
				removeOkFlag  = 0;
				addOkInit     = 0;
			}
		}
        //----------------DS.Chin
        else if(uart_data[1] == 'r' && uart_data[3] == 's' && uart_data[5] == 't')/*$reset#*/
        {
           uart_send();
           power_on_flag = 1;
           power_ok_flag = 0;
           power_err_flag = 0;
           conditionst_flag = 0;
           conditionsn_flag = 0;
           alarm_trigger_flag = 0;
           alarm_normal_flag = 0;
           sensor_trigger_flag = 0;
           sensor_normal_flag = 0;
           control_flag = 0;
           power_on_init = 0;
        }
  }
}

/*****************************
*名称:uart_send
*功能:发送字符窜“&ok#"
*输入:无
*输出:无
*修改记录:
*****************************/
void uart_send(void)
{
	
	UARTDR='$';
	while((UARTST&0x80)==0x00);
	UARTDR='o';
	while((UARTST&0x80)==0x00);
	UARTDR='k';
	while((UARTST&0x80)==0x00);
	UARTDR='#';
	while((UARTST&0x80)==0x00);

}

/*****************************
*名称:receive_init
*功能:判断接收到的字符串是那种类型指令
*输入:无
*输出:无
*修改记录:
*****************************/
//void receive_init(void)
//{
//  if(uartdr_buff_1==80){uart_type=1;uart_step=0;} //P
//  else if(uartdr_buff==87){uart_type=2;uart_step=0;} //W 
//  else if(uartdr_buff==83){uart_type=3;uart_step=0;} //S
//  else if(uartdr_buff==67){uart_type=4;uart_step=0;} //C
//  else if(uartdr_buff==65){uart_type=5;uart_step=0;}//A  
//  else {uart_type=0;uart_step=0;}
//}

/*****************************
*名称:receive_power
*功能:判断接收到的字符串是否为"POWER OK"
*输入:无
*输出:无
*修改记录:
*****************************/
//void receive_power(void)
//{
//  uart_step+=1;
//  if(uartdr_buff_1!=power_ok[uart_step]) uart_type=0;
//  if(uart_step>=7)
//  {
//    uart_type=0;
//    power_ok_flag=1;
//	power_ok_init=0;
//  }
//}

/*****************************
*名称:receive_wlan
*功能:判断接收到的字符串是否为"WLAN NG"或者"WLAN OK"
*输入:无
*输出:无
*修改记录:
*****************************/
//void receive_wlan(void)
//{
//  uart_step+=1;
//  if(uart_step<5)
//  {
//    if(uartdr_buff_1!=wlan_ng[uart_step]) uart_type=0;
//  }

//  if(uart_step==5)
//  {
//    if(uartdr_buff_1==78) wlan_type=0;
//	else if(uartdr_buff_1==79)wlan_type=1;
//	else uart_type=0;
//  }

//  if(uart_step==6)
//  {
//    if(wlan_type==0)
//	{
//	  if(uartdr_buff_1==71)
//	    if(power_ok_flag==1){wlan_ng_flag=1;wlan_ng_init=0;}
//	}
//	else
//	{
//	  if(uartdr_buff_1==75)
//	    if(power_ok_flag==1){wlan_ok_flag=1;wlan_ok_init=0;}
//	}

//	uart_type=0;
//  }
//}

/*****************************
*名称:receive_sensor
*功能:判断接收到的字符串是否为"SENSOR TRIGGER"或者"SENSOR NORMAL"
*输入:无
*输出:无
*修改记录:
*****************************/
//void receive_sensor(void)
//{
//  uart_step+=1;
//  if(uart_step<7)
//    if(uartdr_buff_1!=sensor_trigger[uart_step]) uart_type=0;


//  if(uart_step==7)
//  {
//    if(uartdr_buff_1==84) sensor_type=0;
//	else if(uartdr_buff_1==32) sensor_type=1;
//	else uart_type=0;
//  }

//  if(uart_step>7)
//  {
//    if(sensor_type==0)
//	{
//	  if(uartdr_buff_1!=sensor_trigger[uart_step]) uart_type=0;
//	  if(uart_step>=13)
//	  {
//	    uart_type=0;
//		if(power_ok_flag==1){sensor_trigger_flag=1;sensor_trigger_init=0;}
//	  }
//	}
//	else
//	{
//	  if(uartdr_buff_1!=sensor_normal[uart_step]) uart_type=0;
//	  if(uart_step>=13)
//	  {
//	    uart_type=0;
//		if(power_ok_flag==1){sensor_normal_flag=1;sensor_normal_init=0;}
//	  }
//	}
//  }
//}

/*****************************
*名称:receive_control
*功能:判断接收到的字符串是否为"CONTROL"
*输入:无
*输出:无
*修改记录:
*****************************/
//void receive_control(void)
//{
//  uart_step+=1;
//  if(uartdr_buff_1!=control[uart_step]) uart_type=0;

//  if(uart_step==6)
//  {
//    uart_type=0;
//	if(power_ok_flag==1){control_flag=1;control_init=0;}
//  }
//}


/*****************************
*名称:receive_alarm
*功能:判断接收到的字符串是否为"ALARM TRIGGER"或者"ALARM NORMAL"
*输入:无
*输出:无
*修改记录:
*****************************/
//void receive_alarm(void)
//{
//  uart_step+=1;
//  if(uart_step<6)
//    if(uartdr_buff_1!=alarm_trigger[uart_step]) 
//	uart_type=0;

//  if(uart_step==6)
//  {
//    if(uartdr_buff_1==84) alarm_type=0;
//	else if(uartdr_buff_1==32) alarm_type=1;
//	else uart_type=0;
//  }

//  if(uart_step>6)
//  {
//    if(sensor_type==0)
//	{
//	  if(uartdr_buff_1!=alarm_trigger[uart_step]) uart_type=0;
//	  if(uart_step>=12)
//	  {
//	    uart_type=0;
//		if(power_ok_flag==1){alarm_trigger_flag=1;alarm_trigger_init=0;}
//	  }
//	}
//	else
//	{
//	  if(uartdr_buff_1!=alarm_normal[uart_step]) uart_type=0;
//	  if(uart_step>=12)
//	  {
//	    uart_type=0;
//		if(power_ok_flag==1){alarm_normal_flag=1;alarm_normal_init=0;}
//	  }
//	}
//  }
//}

/**********************
*作者:chenyk
*日期:2014.10.29
***********************/
#include "mc96f6508a.h"
#include "mode.h"

uchar  step;
uchar led_step;
uchar mode_step;
bit mode_init=0;
bit power_on_flag;
bit power_ok_flag;
bit power_err_flag;
bit conditionst_flag;
bit conditionsn_flag;
bit sensor_trigger_flag;
bit sensor_normal_flag;
bit control_flag;
bit alarm_normal_flag;
bit alarm_trigger_flag;

//---------------------------
// @Modify 2015.10.13 DS.Chin
bit removeFlag;
bit removeOkFlag;
bit addFlag;
bit addOkFlag;
bit removeErrFlag;
bit rmvAddErrFlag;

void RemoveMode(void);
void RemoveOkMode(void);
void RmvAddErrMode(void);
void AddMode(void);
void AddOkMode(void);
//----------------------------

uchar  trans_number=0;
uchar  power_on_delay_1=0;
uchar  power_on_delay_2=0;
uchar  conditionst_delay_1=0x00;
uchar  conditionst_delay_2=0x00;
uchar  sensor_trigger_delay_1=0x00;
uchar  sensor_trigger_delay_2=0x00;
uchar  control_delay_1=0x00;
uchar  control_delay_2=0x00;
uchar  alarm_trigger_delay_1=0;
uchar  alarm_trigger_delay_2=0;
idata uchar duty_buff[17];
void power_on_mode(void);
void power_ok_mode(void);
void power_err_mode(void);
void conditionst_mode(void);
void conditionsn_mode(void);
void sensor_trigger_mode(void);
void sensor_normal_mode(void);
void control_mode(void);
void alarm_normal_mode(void);
void alarm_trigger_mode(void);
void horse_led(void);
void led_chase(void);

/***********************
*名称:mode_play
*功能:控制rgb亮法（6种）
*输入:无
*输出:无
*修改记录:
************************/
void mode_play(void)
{
//	RemoveMode();
//	RemoveOkMode();
//	RmvAddErrMode();
  if(power_on_flag && !power_ok_flag && !power_err_flag) //DS.Chin
        power_on_mode();
  if(power_ok_flag) 
        power_ok_mode();
  if(power_err_flag)
        power_err_mode();
   
  if(mode_step==0)
  {   
  if(conditionst_flag && !conditionst_init) {mode_step=1;conditionst_init=0;}
  else if(conditionsn_flag) {mode_step=2;conditionsn_init=0;}
  else if(alarm_normal_flag) {mode_step=3;alarm_normal_init=0;}
  else if(alarm_trigger_flag && !alarm_trigger_init) {mode_step=4;alarm_trigger_init=0;}
  else if(sensor_trigger_flag && !sensor_trigger_init) {mode_step=5;sensor_trigger_init=0;}
  else if(sensor_normal_flag) {mode_step=6;sensor_normal_init=0;}
  else if(control_flag) {mode_step=7;control_init=0;}
  //-----------2015.10.13 DS.Chin
	else if (removeFlag) 
	{
		mode_step = 8;
		removeInit = 0;
	}
	else if (removeOkFlag)
	{
		mode_step = 9;
		removeOkInit = 0;
	}
	else if (addFlag)
	{
		mode_step = 10;
		addInit = 0;
	}
	else if (addOkFlag)
	{
		mode_step = 11;
		addOkInit = 0;
	}
	else if (rmvAddErrFlag)
	{
		mode_step = 12;
		rmvAddErrInit = 0;
	}
  }

  if((conditionst_flag == 1)&&(mode_step==1)) conditionst_mode();
  if((conditionsn_flag == 1)&&(mode_step==2)) conditionsn_mode();
  if((alarm_normal_flag==1)&&(mode_step==3)) alarm_normal_mode();
  if((alarm_trigger_flag==1)&&(mode_step==4)) alarm_trigger_mode();
  if((sensor_trigger_flag==1)&&(mode_step==5)) sensor_trigger_mode();
  if((sensor_normal_flag==1)&&(mode_step==6)) sensor_normal_mode();
  if((control_flag==1)&&(mode_step==7)) control_mode();
  
  //----------2015.10.13 DS.Chin
  if (removeFlag && mode_step == 8)
  {
	  RemoveMode();
  }
  if (removeOkFlag && mode_step == 9)
  {
	  RemoveOkMode();
  }
  if (addFlag && mode_step == 10)
  {
	  AddMode();
  }
  if (addOkFlag && mode_step == 11)
  {
	  AddOkMode();
  }
  if (rmvAddErrFlag && mode_step == 12)
  {
	  RmvAddErrMode();
  }
}

/**********************
*名称:power_on_ok
*功能:上电自检，RED  LED1-- LED17  
      GREEN LED17--LED1 
	  BLUE LED1--LED17循环跑马灯
*输入:无
*输出:无
*修改备注:
***********************/
void power_on_mode(void)
{
  uchar i;

  if(!power_on_init)
  {
    power_on_init=1;
	  power_on_delay_1=0;	
	  step=0;
	  led_step=0;	
	  for(i=0;i<17;i++) 
	  {
	    r_duty[i]=0;
	    g_duty[i]=0;
	    b_duty[i]=0;
	  }
	  r_duty[0]=30;
  }

  power_on_delay_1+=1;
  if(power_on_delay_1>20)
  {
    power_on_delay_1=0;
	  switch(step)
	  {
	    case 0: 
	    for(i=0;i<17;i++)
	      duty_buff[i]=r_duty[i];		   //r
	    horse_led();
	    for(i=0;i<17;i++)
	      r_duty[i]=duty_buff[i];
	    break;

	    case 1:
	    g_duty[16]=30;
	    step+=1;
	    break;

	    case 2:
	    for(i=0;i<17;i++)
	      duty_buff[i]=g_duty[16-i];	//g
	    horse_led();
	    for(i=0;i<17;i++)
	      g_duty[16-i]=duty_buff[i];
	    break;

	    case 3:
	    b_duty[0]=30;
	    step+=1;
	    break;

	    case 4:
	    for(i=0;i<17;i++)
	      duty_buff[i]=b_duty[i];	      //b
	    horse_led();
	    for(i=0;i<17;i++)
	      b_duty[i]=duty_buff[i];
	    break;

	    case 5:
	    r_duty[16]=30;
	    step+=1;
	    break;

	    case 6:
	    for(i=0;i<17;i++)
	      duty_buff[i]=r_duty[16-i];	      //r
	    horse_led();
	    for(i=0;i<17;i++)
	      r_duty[16-i]=duty_buff[i];
	    break;
 
	    case 7:
	    g_duty[0]=30;
	    step+=1;
	    break;

	    case 8:
	    for(i=0;i<17;i++)
	      duty_buff[i]=g_duty[i];	      //g
	    horse_led();
	    for(i=0;i<17;i++)
	      g_duty[i]=duty_buff[i];
	    break;

	    case 9:
	    b_duty[16]=30;
	    step+=1;
	    break;

	    case 10:
	    for(i=0;i<17;i++)
	      duty_buff[i]=b_duty[16-i];	      //b
	    horse_led();
	    for(i=0;i<17;i++)
	      b_duty[16-i]=duty_buff[i];
	    break;

	    case 11:
	    r_duty[0]=30;
	    step=0;
	    break;

	  }
  }
}

/**********************
*名称:horse_led
*功能:
*输入:无
*输出:无
*修改备注:
***********************/
void horse_led(void)
{
  if(led_step==0)
  {
    duty_buff[0]-=1;
	  if(duty_buff[0]<25)
	  {
	    duty_buff[1]=30;
	    led_step+=1;
	  }
  }

  if(led_step==1)
  {
    duty_buff[0]-=1;
	  duty_buff[1]-=1;
	  if(duty_buff[1]<25)
	  {
	    duty_buff[2]=30;
	    led_step+=1;
	  }
  }

  if(led_step==2)
  {
    duty_buff[0]-=1;
	  duty_buff[1]-=1;
	  duty_buff[2]-=1;
	  if(duty_buff[2]<25)
	  {
	    duty_buff[3]=30;
	    led_step+=1;
	  }
  }

  if(led_step==3)
  {
    duty_buff[0]-=1;
    duty_buff[1]-=1;
	  duty_buff[2]-=1;
	  duty_buff[3]-=1;
	  if(duty_buff[3]<25)
	  {
	    duty_buff[4]=30;
	    led_step+=1;
	  }
  }

  if(led_step==4)
  {
    duty_buff[0]-=1;
	  duty_buff[1]-=1;
    duty_buff[2]-=1;
	  duty_buff[3]-=1;
	  duty_buff[4]-=1;
	  if(duty_buff[4]<25)
	  {
	    duty_buff[5]=30;
	    led_step+=1;
	  }
  }

  if(led_step==5)
  {
    duty_buff[1]-=1;
	  duty_buff[2]-=1;
	  duty_buff[3]-=1;
	  duty_buff[4]-=1;
	  duty_buff[5]-=1;
	  if(duty_buff[5]<25)
	  {
	    duty_buff[6]=30;
	    led_step+=1;
	  }
  }

  if(led_step==6)
  {
    duty_buff[2]-=1;
	  duty_buff[3]-=1;
	  duty_buff[4]-=1;
	  duty_buff[5]-=1;
	  duty_buff[6]-=1;
	  if(duty_buff[6]<25)
	  {
	    duty_buff[7]=30;
	    led_step+=1;
    }
  }
 
  if(led_step==7)
  {
    duty_buff[3]-=1;
	  duty_buff[4]-=1;
	  duty_buff[5]-=1;
	  duty_buff[6]-=1;
	  duty_buff[7]-=1;
	  if(duty_buff[7]<25)
	  {
	    duty_buff[8]=30;
	    led_step+=1;
   	}
  }

  if(led_step==8)
  {
    duty_buff[4]-=1;
    duty_buff[5]-=1;
	  duty_buff[6]-=1;
	  duty_buff[7]-=1;
	  duty_buff[8]-=1;
	  if(duty_buff[8]<25)
	  {
	    duty_buff[9]=30;
	    led_step+=1;
	  }   
  }

  if(led_step==9)
  {
    duty_buff[5]-=1;
    duty_buff[6]-=1;
	  duty_buff[7]-=1;
	  duty_buff[8]-=1;
	  duty_buff[9]-=1;
	  if(duty_buff[9]<25)
	  {
	    duty_buff[10]=30;
	    led_step+=1;
	  }
  }

  if(led_step==10)
  {
    duty_buff[6]-=1;
	  duty_buff[7]-=1;
	  duty_buff[8]-=1;
	  duty_buff[9]-=1;
	  duty_buff[10]-=1;
	  if(duty_buff[10]<25)
	  {
	    duty_buff[11]=30;
	    led_step+=1;
	  }
  }

  if(led_step==11)
  {
    duty_buff[7]-=1;
	  duty_buff[8]-=1;
	  duty_buff[9]-=1;
	  duty_buff[10]-=1;
	  duty_buff[11]-=1;
	  if(duty_buff[11]<25)
	  {
	    duty_buff[12]=30;
	    led_step+=1;
	  }
  }

  if(led_step==12)
  {
    duty_buff[8]-=1;
	  duty_buff[9]-=1;
	  duty_buff[10]-=1;
	  duty_buff[11]-=1;
	  duty_buff[12]-=1;
    if(duty_buff[12]<25)
	  {
	    duty_buff[13]=30;
	    led_step+=1;
	  }
  }

  if(led_step==13)
  {
    duty_buff[9]-=1;
    duty_buff[10]-=1;
	  duty_buff[11]-=1;
	  duty_buff[12]-=1;
	  duty_buff[13]-=1;
	  if(duty_buff[13]<25)
	  {
	    duty_buff[14]=30;
	    led_step+=1;
    }
  }

  if(led_step==14)
  {
    duty_buff[10]-=1;
	  duty_buff[11]-=1;
	  duty_buff[12]-=1;
	  duty_buff[13]-=1;
	  duty_buff[14]-=1;
	  if(duty_buff[14]<25)
	  {
	    duty_buff[15]=30;
	    led_step+=1;
  	}
  }

  if(led_step==15)
  {
    duty_buff[11]-=1;
	  duty_buff[12]-=1;
	  duty_buff[13]-=1;
	  duty_buff[14]-=1;
	  duty_buff[15]-=1;
	  if(duty_buff[15]<25)
	  {
	    duty_buff[16]=30;
	    led_step+=1;
	  }
  }

  if(led_step==16)
  {
    duty_buff[12]-=1;
    duty_buff[13]-=1;
	  duty_buff[14]-=1;
	  duty_buff[15]-=1;
	  duty_buff[16]-=1;
	  if(duty_buff[16]<25)
	  {
	  //duty_buff[17]=30;
	    led_step+=1;
	  }
  }

  if(led_step==17)
  {
    duty_buff[13]-=1;
    duty_buff[14]-=1;
    duty_buff[15]-=1;
    duty_buff[16]-=1;
    if(duty_buff[13]<1)
    {
      led_step+=1;
    }
  }

  if(led_step==18)
  {
    duty_buff[14]-=1;
	  duty_buff[15]-=1;
	  duty_buff[16]-=1;
	  if(duty_buff[14]<1)
	  {
	    led_step+=1;
	  }
  }

  if(led_step==19)
  {
	  duty_buff[15]-=1;
	  duty_buff[16]-=1;
  	if(duty_buff[15]<1)
  	{
	    led_step+=1;
	  }
  }

  if(led_step==20)
  {
    duty_buff[16]-=1;
	  if(duty_buff[16]<1)
	  {
	    led_step=0;
	    step+=1;
	  }
  }
} 
/******************************
*名称:power_err_mode
*功能:上电失败G:led1--led17--led1
*输入:无
*输出:无
*修改记录:
******************************/
void power_err_mode(void)
{
	uchar i;

  if(!power_err_init)
  {
    power_err_init=1;
		
		power_on_delay_1=0;	
	  step=0;
	  led_step=0;
		
	  for(i=0;i<17;i++)
	  {
	    r_duty[i]=0;
	    g_duty[i]=0;
	    b_duty[i]=0;
  	}
	
	  g_duty[0]=30;
	  power_ok_flag=0;
		power_on_flag=0;
		conditionst_flag=0;
    conditionsn_flag=0;
    sensor_trigger_flag=0;
    sensor_normal_flag=0;
		control_flag=0;
    alarm_normal_flag=0;
		alarm_trigger_flag=0;
		mode_step=0;
  }
	
	power_on_delay_1+=1;
  if(power_on_delay_1>20)
  {
    power_on_delay_1=0;
	  switch(step)
	  {
	    case 0: 
	    for(i=0;i<17;i++)
	      duty_buff[i]=g_duty[i];		   //g
	    horse_led();
	    for(i=0;i<17;i++)
	      g_duty[i]=duty_buff[i];
	    break;

	    case 1:
	    g_duty[16]=30;
	    step+=1;
	    break;

	    case 2:
	    for(i=0;i<17;i++)
	      duty_buff[i]=g_duty[16-i];	//g
	    horse_led();
	    for(i=0;i<17;i++)
	      g_duty[16-i]=duty_buff[i];
	    break;

	    case 3:
	    g_duty[0]=30;
	    step=0;
	    break;
		}
	}
}
/******************************
*名称:power_ok_mode
*功能:上电ok,red9常亮
*输入:无
*输出:无
*修改记录:
******************************/
void power_ok_mode(void)
{
  uchar i;

  if(!power_ok_init)
  {
    power_ok_init=1;
	  for(i=0;i<17;i++)
	  {
	    r_duty[i]=0;
	    g_duty[i]=0;
	    b_duty[i]=0;
  	}
	
	  g_duty[8]=30;
	  power_on_flag=0;
      power_err_flag=0;
  }
}

/*****************************
*名称:conditionst
*功能:red:led8--led1  led10--led17
*输入:无
*输出:无
*修改记录:
******************************/
void conditionst_mode(void)
{
  uchar i;

  if(!conditionst_init)
  {
    conditionst_init=1;
	step=0;
	led_step=0;
   	for(i=0;i<17;i++)
	{
	   r_duty[i]=0;
	   g_duty[i]=0;
	   b_duty[i]=0;
	}

	led_step=0;
	conditionst_delay_1=0x00;
  	conditionst_delay_2=0x00;
  	step=0x00;
  }
	
  conditionst_delay_1+=1;
  if(conditionst_delay_1>20)
  {
    conditionst_delay_1=0x00;
		
	switch(step)
	{
		case 0:
		r_duty[0]=30;
        step++;
        break;	
			
	    case 1: 
	    for(i=0;i<17;i++)
	      duty_buff[i]=r_duty[i];		   //r
	    horse_led();
	    for(i=0;i<17;i++)
	      r_duty[i]=duty_buff[i];
	    break;

	    case 2:
	    r_duty[16]=30;
	    step+=1;
	    break;

	    case 3:
	    for(i=0;i<17;i++)
	      duty_buff[i]=r_duty[16-i];	//r
	    horse_led();
	    for(i=0;i<17;i++)
	      r_duty[16-i]=duty_buff[i];
	    break;

	    case 4:
            step=0;
        //------DS.Chin--------------------------------------------------------
            if(sensor_trigger_flag) {mode_step=5;sensor_trigger_init=0;}
          else if(alarm_trigger_flag) {mode_step=4;alarm_trigger_init=0;}    
        //---------------------------------------------------------------------
        break;

		  default:
		  step=0;
		  break;	  
	  }
  }
}

/****************************
*名称:led_chase
*功能: 
*输入:无
*输出:无
*修改记录:
*****************************/
void led_chase(void)
{
    if (led_step == 0)
    {
        duty_buff[8] -= 1;
        if(duty_buff[8] < 25)
        {
            duty_buff[7] = 30;
            duty_buff[9] = 30;
            led_step++;
        }
    }
  if(led_step==1)
  {
      duty_buff[8] -= 1;
    duty_buff[7]-=1;
	  duty_buff[9]-=1;
	  if(duty_buff[7]<25)
	  {
	    duty_buff[6]=30;
	    duty_buff[10]=30;
	    led_step+=1;
	  }
  }

  if(led_step==2)
  {
      duty_buff[8] -= 1;
    duty_buff[7]-=1;
	  duty_buff[9]-=1;
	  duty_buff[6]-=1;
	  duty_buff[10]-=1;
	  if(duty_buff[6]<25)
	  {
	    duty_buff[5]=30;
	    duty_buff[11]=30;
	    led_step+=1;
  	}
  }

  if(led_step==3)
  {
      duty_buff[8] -= 1;
    duty_buff[7]-=1;
	  duty_buff[9]-=1;
	  duty_buff[6]-=1;
	  duty_buff[10]-=1;
	  duty_buff[5]-=1;
	  duty_buff[11]-=1;
	  if(duty_buff[5]<25)
	  {
	    duty_buff[4]=30;
	    duty_buff[12]=30;
	    led_step+=1;
	  }
  }

  if(led_step==4)
  {
      duty_buff[8] -= 1;
    duty_buff[7]-=1;
	  duty_buff[9]-=1;
	  duty_buff[6]-=1;
	  duty_buff[10]-=1;
	  duty_buff[5]-=1;
	  duty_buff[11]-=1;
	  duty_buff[4]-=1;
	  duty_buff[12]-=1;
	  if(duty_buff[4]<25)
	  {
	    duty_buff[3]=30;
	    duty_buff[13]=30;
	    led_step+=1;
	  }
  }

  if(led_step==5)
  {
    duty_buff[7]-=1;
	  duty_buff[9]-=1;
	  duty_buff[6]-=1;
	  duty_buff[10]-=1;
	  duty_buff[5]-=1;
	  duty_buff[11]-=1;
	  duty_buff[4]-=1;
	  duty_buff[12]-=1;
	  duty_buff[3]-=1;
	  duty_buff[13]-=1;
	  if(duty_buff[3]<25)
	  {
	    duty_buff[2]=30;
	    duty_buff[14]=30;
	    led_step+=1;
	  }
  }

  if(led_step==6)
  {
	  duty_buff[6]-=1;
	  duty_buff[10]-=1;
	  duty_buff[5]-=1;
	  duty_buff[11]-=1;
	  duty_buff[4]-=1;
	  duty_buff[12]-=1;
	  duty_buff[3]-=1;
	  duty_buff[13]-=1;
	  duty_buff[2]-=1;
	  duty_buff[14]-=1;
	  if(duty_buff[2]<25)
	  {
	    duty_buff[1]=30;
	    duty_buff[15]=30;
	    led_step+=1;
	  }
  }

  if(led_step==7)
  {
     
	  duty_buff[5]-=1;
	  duty_buff[11]-=1;
	  duty_buff[4]-=1;
	  duty_buff[12]-=1;
	  duty_buff[3]-=1;
	  duty_buff[13]-=1;
	  duty_buff[2]-=1;
	  duty_buff[14]-=1;
	  duty_buff[1]-=1;
	  duty_buff[15]-=1;
	  if(duty_buff[1]<25)
	  {
	    duty_buff[0]=30;
	    duty_buff[16]=30;
	    led_step+=1;
	  }
  }

  if(led_step==8)
  {
      
	  duty_buff[4]-=1;
	  duty_buff[12]-=1;
	  duty_buff[3]-=1;
	  duty_buff[13]-=1;
	  duty_buff[2]-=1;
	  duty_buff[14]-=1;
	  duty_buff[1]-=1;
	  duty_buff[15]-=1;
	  duty_buff[0]-=1;
	  duty_buff[16]-=1;
	  if(duty_buff[0]<25)
	  {
	    led_step+=1;
	  }
  }

  if(led_step==9)
  {
	  duty_buff[3]-=1;
	  duty_buff[13]-=1;
	  duty_buff[2]-=1;
	  duty_buff[14]-=1;
	  duty_buff[1]-=1;
	  duty_buff[15]-=1;
	  duty_buff[0]-=1;
	  duty_buff[16]-=1;
	  if(duty_buff[3]<1)
	  {
	    led_step+=1;
	  }
  }

  if(led_step==10)
  {
	  duty_buff[2]-=1;
	  duty_buff[14]-=1;
	  duty_buff[1]-=1;
	  duty_buff[15]-=1;
	  duty_buff[0]-=1;
	  duty_buff[16]-=1;
	  if(duty_buff[2]<1)
	  {
	    led_step+=1;
	  }
  }

  if(led_step==11)
  {
	  duty_buff[1]-=1;
	  duty_buff[15]-=1;
	  duty_buff[0]-=1;
	  duty_buff[16]-=1;
	  if(duty_buff[1]<1)
	  {
	    led_step+=1;
  	}
  }

  if(led_step==12)
  {
	  duty_buff[0]-=1;
	  duty_buff[16]-=1;
	  if(duty_buff[0]<1)
	  {
	    led_step=0;
	    step+=1;
	  }
  }
} 
/****************************
*名称:conditionsn_mode
*功能:red LED1--LED17 OFF 
*输入:无
*输出:无
*修改记录:
*****************************/
void conditionsn_mode(void)
{
  uchar i;
  if(!conditionsn_init)
  {
    conditionsn_init=1;
	  for(i=0;i<17;i++)
	    r_duty[i]=0;

        
	  conditionst_flag=0;
	  conditionsn_flag=0;
  }
  
    //------DS.Chin--------------------------------------------------------
            if(alarm_trigger_flag) {mode_step=4;alarm_trigger_init=0;}
            else if(sensor_trigger_flag) {mode_step=5;sensor_trigger_init=0;}
            else    g_duty[8]=30;
    //---------------------------------------------------------------------
 
/*DS.Chin  if(alarm_normal_flag) {mode_step=3;alarm_normal_init=0;}
  else if(alarm_trigger_flag) {mode_step=4;alarm_trigger_init=0;}
  else if(sensor_trigger_flag) {mode_step=5;sensor_trigger_init=0;}
  else if(sensor_normal_flag) {mode_step=6;sensor_normal_init=0;}
  else if(control_flag) {mode_step=7;control_init=0;}
  else if(conditionst_flag) {mode_step=1;conditionst_init=0;}
  else mode_step=0;*/
  //else if(wlan_ok_flag) {mode_step=1;wlan_ok_init=0;}
}

/*****************************
*名称:sensor_trigger_mode
*功能:BLUE LED1--LED17 同时0.5S ON/OFF
*输入:无
*输出:无
*修改记录:
******************************/
void sensor_trigger_mode(void)
{
  uchar i;

  if(!sensor_trigger_init)
  {
    sensor_trigger_init=1;
 	
    for(i=0;i<17;i++)
	  {
	    r_duty[i]=0;
	    g_duty[i]=0;
	    b_duty[i]=0;
	  }
	  //g_duty[8]=30;

      //r_duty[7]=30;
  	r_duty[8]=30;
	  //r_duty[9]=30;
	 
	  sensor_trigger_delay_1=0x00;
	  sensor_trigger_delay_2=0x00;
    led_step=0;
	  step=0x00;
  }

  sensor_trigger_delay_1+=1;
  if(sensor_trigger_delay_1>20)
  {
    sensor_trigger_delay_1=0x00;
	  sensor_trigger_delay_2+=1;
	  if(sensor_trigger_delay_2>0)
	  {
	    sensor_trigger_delay_2=0x00;
	    switch(step)
	    {
	      case 0:	 
            for(i=0;i<17;i++)
                duty_buff[i]=r_duty[i];
		    led_chase();
		    for(i=0;i<17;i++)
			  r_duty[i]=duty_buff[i];
		    break;
				
		    case 1:
            //    r_duty[7]=30;
            
           // r_duty[9]=30;
		    step=0;
//------DS.Chin---------------------------------------------------------------
            if(alarm_trigger_flag) 
            {
                mode_step=4;
                alarm_trigger_init=0;
            }
            else if(conditionst_flag) 
            {
                mode_step=1;
                conditionst_init=0;
            }
            else
                r_duty[8]=30;
//-----------------------------------------------------------------------------
/* DS.Chin		    if(sensor_normal_flag) {mode_step=6;sensor_normal_init=0;}
        else if(control_flag) {mode_step=7;control_init=0;}
        else if(conditionst_flag) {mode_step=1;conditionst_init=0;}
        else if(conditionsn_flag) {mode_step=2;conditionsn_init=0;}
        else if(alarm_normal_flag) {mode_step=3;alarm_normal_init=0;}
        else if(alarm_trigger_flag) {mode_step=4;alarm_trigger_init=0;}
		    else mode_step=0;*/
         //else if(sensor_trigger_flag) {mode_step=4;sensor_trigger_init=0;}
		  break;
		default:
		  step=0x00;
		  break;
   	  }
    }
  }
}


/****************************
*名称:sensor_normal_mode
*功能:BLUE LED1--LED17 OFF 
*输入:无
*输出:无
*修改记录:
*****************************/
void sensor_normal_mode(void)
{
  uchar i;
  if(!sensor_normal_init)
  {
    sensor_normal_init=1;
	  for(i=0;i<17;i++)
      r_duty[i] = 0; //DS.Chin
	  //  b_duty[i]=0; //DS.Chin
    
	  sensor_trigger_flag=0;
	  sensor_normal_flag=0;
  }
    
 //------DS.Chin---------------------------------------------------------------
            if(alarm_trigger_flag) 
            {
                mode_step=4;
                alarm_trigger_init=0;
            }
            else if(conditionst_flag) 
            {
                mode_step=1;
                conditionst_init=0;
            }
            else
                g_duty[8]=30;
//----------------------------------------------------------------------------- 
            
/* DS.Chin  if(control_flag) {mode_step=7;control_init=0;}
  else if(conditionst_flag) {mode_step=1;conditionst_init=0;}
  else if(conditionsn_flag) {mode_step=2;conditionsn_init=0;}
  else if(alarm_normal_flag) {mode_step=3;alarm_normal_init=0;}
  else if(alarm_trigger_flag) {mode_step=4;alarm_trigger_init=0;}
  else if(sensor_trigger_flag) {mode_step=5;sensor_trigger_init=0;}
  else mode_step=0;*/
}
/*****************************
*名称:control_mode();
*功能:RED LED8--LED1,LED10--LED17 跑马灯一次
*输入:无
*输出:无
*修改记录:
*****************************/
void control_mode(void)
{
  uchar i;
  if(!control_init)
  {
    control_init=1;

    for(i=0;i<17;i++)
	  {
	    r_duty[i]=0;
	    g_duty[i]=0;
	    b_duty[i]=0;
  	}
	 // g_duty[8]=30;

	  //g_duty[7]=30;
	  //g_duty[9]=30;
	  //b_duty[7]=30;
  	b_duty[8]=30;

	  control_delay_1=0x00;
	  control_delay_2=0x00;
	  led_step=0;
	  step=0;
  }
  control_delay_1+=1;
  if(control_delay_1>20)
  {
    control_delay_1=0x00;
	//control_delay_2+=1;
	//if(control_delay_2>50)
	//{
	  control_delay_2=0x00;
	  switch(step)
	  {
	    case 0:	 
	    for(i=0;i<17;i++)
		   duty_buff[i]=b_duty[i];
		  led_chase();
		  for(i=0;i<17;i++)
		  {
			  //g_duty[i]=duty_buff[i];
			  b_duty[i]=duty_buff[i];
			  //b_duty[8]=0;
		  }
		  break;
			
		  case 1:
		  control_flag=0;
 //--------------DS.Chin---------------------------------------------
            if(conditionst_flag) {mode_step=1;conditionst_init=0;}
            else if(alarm_trigger_flag) {mode_step=4;alarm_trigger_init=0;}
            else if(sensor_trigger_flag) {mode_step=5;sensor_trigger_init=0;}
            else    g_duty[8] =30;
		  break;
			
	  	default:
		  step=0x00;
		  break;
	 }
  }
}

/*****************************
*名称:alarm_trigger_mode();
*功能:RED LED1--LED17--LED1 跑马灯
*输入:无
*输出:无
*修改记录: DS.Chin 2015-5-5
*****************************/
void alarm_trigger_mode(void)
{
  uchar i;
  static uchar timeCnt1 = 0;
  static uchar timeCnt2 = 0;
  static uchar timeCnt3 = 0;
  static bit flagFlash = 0;
  if(!alarm_trigger_init)
  {
    alarm_trigger_init=1;
      timeCnt1  = 0;
      timeCnt2  = 0;
      timeCnt3  = 0;
      flagFlash = 0;
      
	  for(i=0;i<17;i++)
	  {
	    r_duty[i]=0;
	    g_duty[i]=0;
	    b_duty[i]=0;
	  }
	 // g_duty[8]=30;
  }
//-------DS.Chin -----------------------------------------------
      timeCnt1++;
      if (timeCnt1 > 40)
      {
          timeCnt1 = 0;
          timeCnt2++;
        
          flagFlash ^= 1;
          if (timeCnt2 < 9)
          {
              for (i = 0; i < 17 ; i++)
              {
                  if (flagFlash)
                      r_duty[i] = 30;
                  else
                      r_duty[i] = 0;
                  
              } 
          }
          else if (timeCnt2 > 20)
          {
              timeCnt3++;
              timeCnt2 = 0;  
              flagFlash = 0;

              if (timeCnt3 > 1)
              {
                  timeCnt3 = 0;
                 if(conditionst_flag) {mode_step=1;conditionst_init=0;}
                 else if(sensor_trigger_flag) {mode_step=5;sensor_trigger_init=0;}
              }
          }
                
       }
  
//---------------------------------------------------------------
	/*  r_duty[7]=30;
	  r_duty[9]=30;
	  led_step=0;
	  step=0;
	  alarm_trigger_delay_1=0x00;
	  alarm_trigger_delay_2=0x00;

  }

  alarm_trigger_delay_1+=1;
  if(alarm_trigger_delay_1>20)
  {
    alarm_trigger_delay_1=0;
	  switch(step)
	  {
	    case 0:	 
	    for(i=0;i<17;i++)
		  duty_buff[i]=r_duty[i];
		  led_chase();
		  for(i=0;i<17;i++)
	      r_duty[i]=duty_buff[i];
	    break;
			
	    case 1:
	    r_duty[7]=30;
      r_duty[9]=30;
		  step=0;--*/

      /*--DS.Chin if(sensor_trigger_flag) {mode_step=5;sensor_trigger_init=0;}
		  else if(sensor_normal_flag) {mode_step=6;sensor_normal_init=0;}
		  else if(control_flag) {mode_step=7;control_init=0;}
      else if(conditionst_flag) {mode_step=1;conditionst_init=0;}
      else if(conditionsn_flag) {mode_step=2;conditionsn_init=0;}
      else if(alarm_normal_flag) {mode_step=3;alarm_normal_init=0;}
		  else mode_step=0;--*/
	/* --   break;
			
	    default:
	    step=0x00;
	    break;
    }
  }--*/
}

/*****************************
*名称:alarm_trigger_mode();
*功能:RED LED1--LED17--LED1 跑马灯
*输入:无
*输出:无
*修改记录:
*****************************/
void alarm_normal_mode(void)
{
  uchar i;
  if(!alarm_normal_init)
  {
    alarm_normal_init=1;
	  for(i=0;i<17;i++)
	  r_duty[i]=0;
	  alarm_trigger_flag=0;
	  alarm_normal_flag=0;
  }
  
//------------DS.Chin--------------------------------------------------  
    if(sensor_trigger_flag) {mode_step=5;sensor_trigger_init=0;}
    else if(conditionst_flag) {mode_step=1;conditionst_init=0;}
    else     g_duty[8]=30;
//--------------------------------------------------------------------                 
  /* DS.Chin if(alarm_trigger_flag) {mode_step=4;alarm_trigger_init=0;}
  else if(sensor_trigger_flag) {mode_step=5;sensor_trigger_init=0;}
  else if(sensor_normal_flag) {mode_step=6;sensor_normal_init=0;}
  else if(control_flag) {mode_step=7;control_init=0;}
  else if(conditionst_flag) {mode_step=1;conditionst_init=0;}
  else if(conditionsn_flag) {mode_step=2;conditionsn_init=0;}
  else mode_step=0;*/
  //else if(alarm_normal_flag) {mode_step=2;alarm_normal_init=0;}
}

/*****************************************
 * FunctionName: RemoveMode
 * Date: 2015.10.13
 * Author:DS.Chin
 * Describe: remove模式，中间绿灯常亮，红灯慢闪
*******************************************************/
void RemoveMode(void) 
{
	uchar iCnt = 0;
	static unsigned int rmvCnt;
	static bit flashFlag;
	
	if (!removeInit)
	{
		removeInit = 1;
		rmvCnt = 0;
		flashFlag = 0;
		
		for (iCnt = 0; iCnt < 17; iCnt++)
		{
			r_duty[iCnt] = 0;
			g_duty[iCnt] = 0;
			b_duty[iCnt] = 0;
		}
	}
	else
	{
		rmvCnt++;
		if (rmvCnt > 500)
		{
			rmvCnt = 0;
			
			flashFlag = ~flashFlag;
			if (flashFlag)
			{
				r_duty[8] = 30;
			}
			else
			{
				r_duty[8] = 0;
			}
		}
	}
}

/*****************************************
 * FunctionName: RemoveOkMode
 * Date: 2015.10.13
 * Author:DS.Chin
 * Describe: remove模式，中间绿灯常亮，红灯慢闪
*******************************************************/
void RemoveOkMode(void)
{
	uchar				iCnt = 0;
	static uchar	 	rmvOkCnt;
	static bit 			flashFlag;
	static uchar 		flashCnt;
	static uchar		modeStep;
	
	if (!removeOkInit)
	{
		removeOkInit = 1;
		rmvOkCnt     = 0;
		flashFlag    = 0;
		flashCnt     = 0;
		modeStep     = 0;
		
		for (iCnt = 0; iCnt < 17; iCnt++)
		{
			r_duty[iCnt] = 0;
			g_duty[iCnt] = 0;
			b_duty[iCnt] = 0;
		}
	}
	else
	{
		rmvOkCnt++;
		if (rmvOkCnt > 180)
		{
			rmvOkCnt = 0;
			
			switch (modeStep)
			{
				case 0:
					flashFlag = ~flashFlag;
					if (!flashFlag)
					{
						r_duty[8] = 30;
						flashCnt++;
						if (flashCnt > 2)
						{
							flashCnt = 0;
							modeStep++;
						}
					}
					else
					{
						r_duty[8] = 0;
					}
					break;
				case 1:
					flashCnt++;
					if (flashCnt > 3)
					{
						modeStep ++;
						flashCnt = 0;
						r_duty[8] = 0;
					}
					break;
				case 2:
					if(conditionst_flag)
					{
						mode_step = 1;
						conditionst_init = 0;
					}
					else if(alarm_trigger_flag) 
					{
						mode_step = 4;
						alarm_trigger_init = 0;
					}
					else if(sensor_trigger_flag) 
					{
						mode_step = 5;
						sensor_trigger_init = 0;
					}
					else    
					{
						g_duty[8] =30;
					}
					break;
			}
		}
	}
}

/*****************************************
 * FunctionName: RemoveMode
 * Date: 2015.10.13
 * Author:DS.Chin
 * Describe: remove模式，中间绿灯常亮，红灯慢闪
*******************************************************/
void AddMode(void) 
{
	uchar iCnt = 0;
	static unsigned int addCnt;
	static bit flashFlag;
	
	if (!addInit)
	{
		addInit = 1;
		addCnt = 0;
		flashFlag = 0;
		
		for (iCnt = 0; iCnt < 17; iCnt++)
		{
			r_duty[iCnt] = 0;
			g_duty[iCnt] = 0;
			b_duty[iCnt] = 0;
		}
	}
	else
	{
		addCnt++;
		if (addCnt > 500)
		{
			addCnt = 0;
			
			flashFlag = ~flashFlag;
			if (flashFlag)
			{
				b_duty[8] = 30;
			}
			else
			{
				b_duty[8] = 0;
			}
		}
	}
}

/*****************************************
 * FunctionName: AddOkMode
 * Date: 2015.10.13
 * Author:DS.Chin
 * Describe: remove模式，中间绿灯常亮，红灯慢闪
*******************************************************/
void AddOkMode(void)
{
	uchar				iCnt = 0;
	static uchar	 	addOkCnt;
	static bit 			flashFlag;
	static uchar 		flashCnt;
	static uchar		modeStep;
	
	if (!addOkInit)
	{
		addOkInit = 1;
		addOkCnt     = 0;
		flashFlag    = 0;
		flashCnt     = 0;
		modeStep     = 0;
		
		for (iCnt = 0; iCnt < 17; iCnt++)
		{
			r_duty[iCnt] = 0;
			g_duty[iCnt] = 0;
			b_duty[iCnt] = 0;
		}
	}
	else
	{
		addOkCnt++;
		if (addOkCnt > 180)
		{
			addOkCnt = 0;
			
			switch (modeStep)
			{
				case 0:
					flashFlag = ~flashFlag;
					if (!flashFlag)
					{
						b_duty[8] = 30;
						flashCnt++;
						if (flashCnt > 2)
						{
							flashCnt = 0;
							modeStep++;
						}
					}
					else
					{
						b_duty[8] = 0;
					}
					break;
				case 1:
					flashCnt++;
					if (flashCnt > 3)
					{
						modeStep ++;
						flashCnt = 0;
						b_duty[8] = 0;
					}
					break;
				case 2:
					if(conditionst_flag)
					{
						mode_step = 1;
						conditionst_init = 0;
					}
					else if(alarm_trigger_flag) 
					{
						mode_step = 4;
						alarm_trigger_init = 0;
					}
					else if(sensor_trigger_flag) 
					{
						mode_step = 5;
						sensor_trigger_init = 0;
					}
					else    
					{
						g_duty[8] =30;
					}
					break;
			}
		}
	}
}

/*****************************************
 * FunctionName: RmvAddErrMode
 * Date: 2015.10.13
 * Author:DS.Chin
 * Describe: remove模式，中间绿灯常亮，红灯慢闪
*******************************************************/
void RmvAddErrMode(void)
{
	uchar				iCnt = 0;
	static uchar	 	rmvAddErrCnt;
	static bit 			flashFlag;
	static uchar 		flashCnt;
	static uchar		modeStep;
	
	if (!rmvAddErrInit)
	{
		rmvAddErrInit = 1;
		rmvAddErrCnt  = 0;
		flashFlag     = 0;
		flashCnt      = 0;
		modeStep      = 0;
		
		for (iCnt = 0; iCnt < 17; iCnt++)
		{
			r_duty[iCnt] = 0;
			g_duty[iCnt] = 0;
			b_duty[iCnt] = 0;
		}
	}
	else
	{
		rmvAddErrCnt++;
		if (rmvAddErrCnt > 100)
		{
			rmvAddErrCnt = 0;
			
			switch (modeStep)
			{
				case 0:
					flashFlag = ~flashFlag;
					if (!flashFlag)
					{
						r_duty[8] = 30;
						b_duty[8] = 0;
						flashCnt++;
						if (flashCnt > 10)
						{
							flashCnt = 0;
							modeStep++;
						}
					}
					else
					{
						r_duty[8] = 0;
						b_duty[8] = 30;
					}
					break;
				case 1:
					flashCnt++;
					if (flashCnt > 1)
					{
						modeStep ++;
						flashCnt = 0;
						r_duty[8] = 0;
						g_duty[8] = 30;
						b_duty[8] = 0;
					}
					break;
				case 2:
					if(conditionst_flag)
					{
						mode_step = 1;
						conditionst_init = 0;
					}
					else if(alarm_trigger_flag) 
					{
						mode_step = 4;
						alarm_trigger_init = 0;
					}
					else if(sensor_trigger_flag) 
					{
						mode_step = 5;
						sensor_trigger_init = 0;
					}
					else    
					{
						g_duty[8] =30;
					}
					break;
			}
		}
	}
}

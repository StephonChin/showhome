/*--------------------------------
*author:chenyk
*data:2015.5.4
*ver:ver1
--------------------------------*/
#include "stm8s003F3.h"
#include "stm8s_bitsdefine.h"
#include "ade7753.h"
#include "type.h"

#define ade7753_cs PC_ODR_4
#define sck PC_ODR_5
#define mosi PC_ODR_6
#define miso PC_IDR_7

extern u8 bstate;

uchar data_buf[3]={0,0,0};
uchar buf[3]={0,0,0};

u32 irms=0;
u32 vrms=0;
u32 waveform=0;
u32 lvaenergy=0;
u32 laenergy=0;
u32 laenergy_add_up=0;
u32 kwh=0;
u8  meter_updata_type=0;
u16 frequency;
u8  rate_choice;
//u16 rate_add_up=0;
//u16 frequency;

//extern u8 rate;
extern u16 rate;

void ade7753_write_byte(uchar val);
uchar ade7753_read_byte(void);
void	ade7753_write_bytes(uchar reg_name);
void	ade7753_read_bytes(uchar reg_name);
u8 offset_chanel1(void);
u8 offset_chanel2(void);

void delay_us(uchar ts)
{
	while(ts)ts--;
}
/********************************
*函数名:ade7753_config
*功能:
*输入参数:
*输出参数:
*********************************/
void ade7753_config(void)
{
	uchar i;
	
	u32 s;
	
	data_buf[0]=0x4d;
	data_buf[1]=0xd8;
	ade7753_write_bytes(MODE);
	
	delay_us(40);
	
	data_buf[0]=0x0d;
	data_buf[1]=0xd8;
	ade7753_write_bytes(MODE);
	
	delay_us(10);
	
	if(rate_choice==1)
	{
	  data_buf[0]=0x64;
	  data_buf[1]=0x00;
	  ade7753_write_bytes(LINECYC);
	}
	else
	{
		data_buf[0]=0x78;
	  data_buf[1]=0x00;
	  ade7753_write_bytes(LINECYC);
	}
	
	delay_us(10);
	
	data_buf[0]=0x02;
	ade7753_write_bytes(GAIN);
	
	delay_us(10);
	
	bstate=get_chanel1_waveform;
	while(offset_chanel1());
	
	data_buf[0]=0x0c;
	data_buf[1]=0xf8;
	ade7753_write_bytes(MODE);
	
	bstate=get_chanel2_waveform;
	while(offset_chanel2());
	
	delay_us(10);
	data_buf[0]=0x8c;
	data_buf[1]=0x18;
	ade7753_write_bytes(MODE);
	
	//for(s=0;s<65550;s++);
	
	//meter_rate_get();
	
	/*data_buf[0]=0x21;
	ade7753_write_bytes(CH2OS);
	
	delay_us(10);
	
	data_buf[0]=0x81;
	ade7753_write_bytes(CH1OS);
	
	delay_us(10);
	
	data_buf[0]=0xff;
	data_buf[1]=0x07;
	ade7753_write_bytes(VRMSOS);*/
	
	/*data_buf[0]=0x00;
	data_buf[1]=0x00;
	ade7753_write_bytes(IRMSOS);*/
	
	
	delay_us(10);
	
	data_buf[0]=0x14;
	data_buf[1]=0x00;
	ade7753_write_bytes(IRQEN);
	
	
	
	/*delay_us(30);
	ade7753_read_bytes(GAIN);
	delay_us(30);
	ade7753_read_bytes(CH1OS);
	delay_us(30);
	ade7753_read_bytes(CH2OS);
	delay_us(30);
	ade7753_read_bytes(MODE);
	delay_us(30);
	ade7753_read_bytes(IRQEN);*/
	
  delay_us(10);
	/*while(1)
	{
		ade7753_read_bytes(0x0c);
		delay_us(10);
	}*/
	
}

/********************************
*函数名:offset_chanel1
*功能:校正chanel1
*输入参数:
*输出参数:
*********************************/
u8 offset_chanel1(void)
{	
  u8 i;

	if(meter_updata_type==waveform_updata)
	{
		meter_updata_type=0;
		if((waveform&0x800000)==0x800000)
		{
			waveform=(waveform&0x7fffff);
			waveform=~waveform;
			waveform=(waveform+1);
			if(waveform<=1550)
			 return ok;
			 
			 for(i=0;i<30;)
			 {
				 if(waveform>=1550)
				 {
					 waveform=(waveform-1550);
					 i++;
				 }
				 else
				  break;
			 }
			 
			 data_buf[0]=i;
			 data_buf[0]|=0x80;
	     ade7753_write_bytes(CH1OS);
			 return no_ok;
		}
		else
		{
			if(waveform<=1550)
			 return ok;
			 
			 for(i=0;i<30;)
			 {
				 if(waveform>=1550)
				 {
					 waveform=(waveform-1550);
					 i++;
				 }
				 else
				  break;
			 }
			 
			 data_buf[0]=i;
			 data_buf[0]|=0xa0;
	     ade7753_write_bytes(CH1OS);
			 return no_ok;
		}
	}
}

/********************************
*函数名:offset_chanel2
*功能:校正chanel2
*输入参数:
*输出参数:
*********************************/
u8 offset_chanel2(void)
{	
  u8 i;

	if(meter_updata_type==waveform_updata)
	{
		meter_updata_type=0;
		if((waveform&0x800000)==0x800000)
		{
			waveform=(waveform&0x7fffff);
			waveform=~waveform;
			waveform=(waveform+1);
			if(waveform<=39)//392
			 return ok;
			 
			 for(i=0;i<30;)
			 {
				 if(waveform>=39)//392
				 {
					 waveform=(waveform-39);//392
					 i++;
				 }
				 else
				  break;
			 }
			 
			 data_buf[0]=i;
			 data_buf[0]|=0x20;
	     ade7753_write_bytes(CH1OS);
			 return no_ok;
		}
		else
		{
			if(waveform<=39)//392
			 return ok;
			 
			 for(i=0;i<30;)
			 {
				 if(waveform>=39)//392
				 {
					 waveform=(waveform-39);//392
					 i++;
				 }
				 else
				  break;
			 }
			 
			 data_buf[0]=i;
			 data_buf[0]|=0x20;
	     ade7753_write_bytes(CH1OS);
			 return no_ok;
		}
	}
}

/********************************
*函数名:ade7753_write_byte
*功能:
*输入参数:
*输出参数:
*********************************/
void ade7753_write_byte(uchar val)
{	
  uchar i;
	for(i=0;i<8;i++)
	{
		sck=1;
		if((val&0x80)==0x80) mosi=1;
		else mosi=0;
		sck=0;
		val=val<<1;
	}
}
/********************************
*函数名:ade7753_read_byte  
*功能:
*输入参数:
*输出参数:
*********************************/
uchar ade7753_read_byte(void)
{
	uchar i,j,val=0;
	for(i=0;i<8;i++)
	{
		val=val<<1;
		sck=1;
		if(miso) j=0x01;
		else j=0x00;
		sck=0;
		val=val|j;
	}
	return val;

}

/********************************
*函数名:ade7753_write_bytes
*功能:向ade7753中写入数据，可以是1～2个字节，由写入的寄存器
      决定
*输入参数:reg_name 要写入的寄存器名称既地址
        data_buf :写入的数据
*输出参数:
*********************************/
void	ade7753_write_bytes(uchar reg_name)		//
{
  uchar i;
	ade7753_cs=0;
 	i=reg_len[reg_name];	//取得需要写字节数
	ade7753_write_byte(0x80|reg_name);	//将地址写入通讯寄存器
	delay_us(30);
	switch(i)
	{
		case 2:
			ade7753_write_byte(data_buf[1]);
			delay_us(30);
		  ade7753_write_byte(data_buf[0]);
			break;
		case 1:
			ade7753_write_byte(data_buf[0]);
			break;
	}
	ade7753_cs=1;
}
/********************************
*函数名:ade7753_read_bytes
*功能:向ade7753中写入数据，可以是1～2个字节，由写入的寄存器
      决定
*输入参数:reg_name 要写入的寄存器名称既地址
*输出参数:
*********************************/
void	ade7753_read_bytes(uchar reg_name)		
{
  char i;
	
	buf[0]=0;
	buf[1]=0;
	buf[2]=0;
	
	ade7753_cs=0;
 	i=reg_len[reg_name];	//取得需要读取的字节数
	ade7753_write_byte(reg_name);	//将地址写入通讯寄存器
	delay_us(30);
	switch(i)
	{
		case 3:
			buf[2]=ade7753_read_byte();		//最高字节
			delay_us(30);
			buf[1]=ade7753_read_byte();
			delay_us(30);
			buf[0]=ade7753_read_byte();         //低字节
			break;
		case 2:							          	
			buf[1]=ade7753_read_byte();
			delay_us(30);
			buf[0]=ade7753_read_byte();
			break;
		case 1:
			buf[0]=ade7753_read_byte();
			break;
	}
  ade7753_cs=1;
}

/********************************
*函数名:meter_data_get
*功能:读reg_name寄存器数值
*输入参数:reg_name
*输出参数:
*********************************/

void meter_data_get (u8 reg_name)
{
	static u8 add_up_number=0;
  static u32 meter_data_buf=0;
	static u8 reg_name_buf=0;
	
	if(reg_name!=reg_name_buf)
	{
		reg_name_buf=reg_name;
		meter_data_buf=0;
		add_up_number=0;
	}

	ade7753_read_bytes(reg_name);

	meter_data_buf=(meter_data_buf+(u32)buf[0]);
	meter_data_buf=(meter_data_buf+((u32)buf[1]<<8));
	meter_data_buf=(meter_data_buf+((u32)buf[2]<<16));
			
	add_up_number+=1;
	if(add_up_number>63)
	{
		add_up_number=0;
		meter_data_buf=meter_data_buf/64;
		switch(reg_name)
		{
			case VRMS:
			  vrms=meter_data_buf;
				meter_updata_type=vrms_updata;
				break;
				
			case IRMS:
			  irms=meter_data_buf;
				meter_updata_type=irms_updata;
				break;
				
			case WAVEFORM:
			  waveform=meter_data_buf;
				meter_updata_type=waveform_updata;
				break;
				
				
			//case AENERGY:
			  //aenergy=meter_data_buf;
				//meter_updata_type=aenergy_updata;
				//break;	
				
			default:
			  break;
		}
		
		meter_data_buf=0;
	}

}


/********************************
*函数名:meter_watt_get
*功能:
*输入参数:
*输出参数:
*********************************/
void meter_watt(u8 val)
{
	static u32 laenergy_buf=0;
	ade7753_read_bytes(val);
	
	laenergy_buf=0;
	laenergy_buf=(u32)buf[0];
	laenergy_buf=(laenergy_buf+((u32)buf[1]<<8));
	laenergy_buf=(laenergy_buf+((u32)buf[2]<<16));
	
	
	if((laenergy_buf&0x00800000)==0x00800000)
	{
		laenergy_buf=~laenergy_buf;
		laenergy_buf&=0x007fffff;
		laenergy_buf+=1;
	}
	
	if(val==LVAENERGY) 
	{
		lvaenergy=laenergy_buf;
	}
	else
	{	
	  laenergy=laenergy_buf;
	  laenergy_add_up+=(laenergy*10/37);
	  if(laenergy_add_up>35999)
	  {
		  kwh+=1;
		  laenergy_add_up-=36000;
		  while((FLASH_IAPSR&0x04)==0x04);
		  eeprom_write(0x01,(u8)kwh);
		
		  while((FLASH_IAPSR&0x04)==0x04);
		  eeprom_write(0x02,(u8)(kwh>>8));
		
		  while((FLASH_IAPSR&0x04)==0x04);
		  eeprom_write(0x03,(u8)(kwh>>16));
	  }
	}
}

/********************************
*函数名:meter_rate_get
*功能:
*输入参数:
*输出参数:
*********************************/
void meter_rate_get(void)
{
	u32 temp;
	
	
	temp=(u32)rate;
	temp=(500000/temp-4);
	frequency=(u16)temp;
	
	/*if(frequency>550)
	{
		if(frequency>550)
		{
			if(rate_choice==1)
			{
				rate_choice=0;
				ade7753_config();
			}
		}
	}
	else
	{
		if(rate_choice==0)
		{
				rate_choice=1;
				ade7753_config();
		}
	}*/
	
	if(frequency>550)
	{
	 if(rate_choice==1)
	 {
	   //data_buf[0]=0x78;
	   //data_buf[1]=0x00;
	  // ade7753_write_bytes(LINECYC);
		
		ade7753_cs=0;
		ade7753_write_byte(0x80|MODE);
		delay_us(10);
		ade7753_write_byte(0x0d);
		delay_us(10);
		ade7753_write_byte(0xd8);
		delay_us(10);
		ade7753_cs=1;
		 
		 ade7753_cs=0;
		 ade7753_write_byte(0x80|LINECYC);	//将地址写入通讯寄存器
	   delay_us(10);
		 ade7753_write_byte(0x00);
		 delay_us(10);
		 ade7753_write_byte(0x78);
		 ade7753_cs=1;
		 
		 ade7753_cs=0;
		 ade7753_write_byte(0x80|MODE);
		 delay_us(10);
		 ade7753_write_byte(0x8c);
		 delay_us(10);
		 ade7753_write_byte(0x18);
		 delay_us(10);
		 ade7753_cs=1;
   }
	 
	 rate_choice=0;
  }
	else
	{
	  if(rate_choice==0)
		{
			//data_buf[0]=0x64;
	    //data_buf[1]=0x00;
	    //ade7753_write_bytes(LINECYC);
			
			ade7753_cs=0;
		  ade7753_write_byte(0x80|MODE);
		  delay_us(10);
		  ade7753_write_byte(0x0d);
		  delay_us(10);
		  ade7753_write_byte(0xd8);
		  delay_us(10);
		  ade7753_cs=1;
			
			ade7753_cs=0;
		  ade7753_write_byte(0x80|LINECYC);	//将地址写入通讯寄存器
	    delay_us(30);
		  ade7753_write_byte(0x00);
		  delay_us(30);
		  ade7753_write_byte(0x64);
		  ade7753_cs=1;
			
			ade7753_cs=0;
		  ade7753_write_byte(0x80|MODE);
		  delay_us(10);
		  ade7753_write_byte(0x8c);
		  delay_us(10);
		  ade7753_write_byte(0x18);
		  delay_us(10);
		  ade7753_cs=1;
		}
	
	  rate_choice=1;
 }
}


/******************
*文件:
*作者:
*日期:
******************/
#include "eeprom.h"
//uchar i2c_data;
//uchar i2c_data_buff;
//uchar addr;
//uchar send_data;
void i2c_start (void);
void i2c_stop(void);
uchar i2c_receive_ack(void);
void i2c_send_ack (void);
void i2c_send_nak (void);
void i2c_send8bit (uchar send_data);
uchar i2c_receive8bit (void);
/******************
*文件:void i2c_write(uchar addr,uchar data)
*输入:uchar addr,uchar data
*输出:无
*描述:
*修改备注:
******************/
void i2c_write(uchar addr,uchar send_data)
{
  i2c_start();  //发送起始信号

  //i2c_data_buff=0xa0; //发送写命令
  i2c_send8bit(0xa0); 
  if(i2c_receive_ack()==1) return; //没有有效应答退出

  //i2c_data_buff=addr;  //发送写地址 
  i2c_send8bit(addr);
  if(i2c_receive_ack()==1) return; //没有有效应答退出

  //i2c_data_buff=send_data;  //发送写数据 
  i2c_send8bit(send_data);
  if(i2c_receive_ack()==1) return; //没有有效应答退出

  i2c_stop();
  
}

/******************
*文件:void i2c_read(uchar addr, data)
*输入:uchar addr,uchar data
*输出:无
*描述:
*修改备注:
******************/
uchar i2c_read(uchar addr)
{
  uchar read_data;
  i2c_start();
  
  //i2c_data_buff=0xa0; //发送写命令
  i2c_send8bit(0xa0);
  if(i2c_receive_ack()==1) return 0; //没有有效应答退出

  //i2c_data_buff=addr; //发送读地址  
  i2c_send8bit(addr);
  if(i2c_receive_ack()==1) return 0; //没有有效应答退出
  
  i2c_start();  

  //i2c_data_buff=0xa1; //发送读命令
  i2c_send8bit(0xa1);   
  if(i2c_receive_ack()==1) return 0; //没有有效应答退出

  read_data=i2c_receive8bit(); //接收数据
  i2c_send_nak();

  i2c_stop ();

  return (read_data);
}

/******************
*文件:void i2c_start (void)
*输入:无
*输出:无
*描述:起始时序
*修改备注:
*******************/
void i2c_start (void)
{
  uchar i;
  scl=1;
  sda=1;
  for(i=2;i>0;i--);
  sda=0;
  for(i=2;i>0;i--);
  scl=0;
}
/*****************
*文件:void i2c_stop(void)
*输入:无
*输出:无
*描述:结束时序
*修改备注
*****************/
void i2c_stop(void)
{
  uchar i;
  sda=0;
  for(i=2;i>0;i--);
  scl=1;
  for(i=2;i>0;i--);
  sda=1;
}
/*****************
*文件:void i2c_receive_ack(void)
*输入:无
*输出:0或1 
*描述:接收应答信号
*修改备注:
*******************/
uchar i2c_receive_ack(void)
{
  uchar i;
  sda=1;
  scl=0;
  for(i=2;i>0;i--);
  sda_in;              //sda口变为输入
  for(i=2;i>0;i--);
  scl=1;
  if(sda) i=1;
  else i=0;
  scl=0;
  sda_out;
  
  if(i==1) return 1;
  else return 0;
  
}
/*******************
*文件:void i2c_send_ack (void)
*输入:无
*输出:无
*描述:发送有效应答信号
*修改备注
********************/
/*void i2c_send_ack (void)
{
  uchar i;
  scl=0;
  sda=0;
  for(i=2;i>0;i--);
  scl=1;
  for(i=2;i>0;i--);
}*/
/*******************
*文件:void i2c_send_ack (void)
*输入:无
*输出:无
*描述:发送非有效应答信号
*修改备注
********************/
void i2c_send_nak (void)
{
  uchar i;
  scl=0;
  sda=1;
  for(i=2;i>0;i--);
  scl=1;
  for(i=2;i>0;i--);
}
/********************
*文件:void i2c_send8bit(void)
*输入:i2c_data
*输出:
*描述:
*修改备注:
*********************/
void i2c_send8bit (uchar send_data)
{
  uchar i,j;
  uchar send_data_buf;

  send_data_buf=send_data;
  scl=0;
  for(i=8;i>0;i--)
  {
    if((send_data_buf&0x80)==0x80) sda=1;
    else sda=0;
    scl=1;
    for(j=2;j>0;j--);
    send_data_buf<<=1;
    scl=0;
  }
}

/********************
*文件:void i2c_receive8bit(void)
*输入:
*输出:i2c_data
*描述:
*修改备注:
*********************/
uchar i2c_receive8bit (void)
{
  uchar i,j;
  uchar receive_data;

  scl=0;
  sda=1;
  sda_in; //sda变为输入口
  for(i=8;i>0;i--)
  {
    scl=1;
    receive_data<<=1;
    if(sda) receive_data|=0x01;
    else receive_data&=0xfe;
    scl=0;
    for(j=2;j>0;j--);   
  }
  sda_out;//变为输出口

  return (receive_data);
}
/******************
*�ļ�:
*����:
*����:
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
*�ļ�:void i2c_write(uchar addr,uchar data)
*����:uchar addr,uchar data
*���:��
*����:
*�޸ı�ע:
******************/
void i2c_write(uchar addr,uchar send_data)
{
  i2c_start();  //������ʼ�ź�

  //i2c_data_buff=0xa0; //����д����
  i2c_send8bit(0xa0); 
  if(i2c_receive_ack()==1) return; //û����ЧӦ���˳�

  //i2c_data_buff=addr;  //����д��ַ 
  i2c_send8bit(addr);
  if(i2c_receive_ack()==1) return; //û����ЧӦ���˳�

  //i2c_data_buff=send_data;  //����д���� 
  i2c_send8bit(send_data);
  if(i2c_receive_ack()==1) return; //û����ЧӦ���˳�

  i2c_stop();
  
}

/******************
*�ļ�:void i2c_read(uchar addr, data)
*����:uchar addr,uchar data
*���:��
*����:
*�޸ı�ע:
******************/
uchar i2c_read(uchar addr)
{
  uchar read_data;
  i2c_start();
  
  //i2c_data_buff=0xa0; //����д����
  i2c_send8bit(0xa0);
  if(i2c_receive_ack()==1) return 0; //û����ЧӦ���˳�

  //i2c_data_buff=addr; //���Ͷ���ַ  
  i2c_send8bit(addr);
  if(i2c_receive_ack()==1) return 0; //û����ЧӦ���˳�
  
  i2c_start();  

  //i2c_data_buff=0xa1; //���Ͷ�����
  i2c_send8bit(0xa1);   
  if(i2c_receive_ack()==1) return 0; //û����ЧӦ���˳�

  read_data=i2c_receive8bit(); //��������
  i2c_send_nak();

  i2c_stop ();

  return (read_data);
}

/******************
*�ļ�:void i2c_start (void)
*����:��
*���:��
*����:��ʼʱ��
*�޸ı�ע:
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
*�ļ�:void i2c_stop(void)
*����:��
*���:��
*����:����ʱ��
*�޸ı�ע
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
*�ļ�:void i2c_receive_ack(void)
*����:��
*���:0��1 
*����:����Ӧ���ź�
*�޸ı�ע:
*******************/
uchar i2c_receive_ack(void)
{
  uchar i;
  sda=1;
  scl=0;
  for(i=2;i>0;i--);
  sda_in;              //sda�ڱ�Ϊ����
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
*�ļ�:void i2c_send_ack (void)
*����:��
*���:��
*����:������ЧӦ���ź�
*�޸ı�ע
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
*�ļ�:void i2c_send_ack (void)
*����:��
*���:��
*����:���ͷ���ЧӦ���ź�
*�޸ı�ע
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
*�ļ�:void i2c_send8bit(void)
*����:i2c_data
*���:
*����:
*�޸ı�ע:
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
*�ļ�:void i2c_receive8bit(void)
*����:
*���:i2c_data
*����:
*�޸ı�ע:
*********************/
uchar i2c_receive8bit (void)
{
  uchar i,j;
  uchar receive_data;

  scl=0;
  sda=1;
  sda_in; //sda��Ϊ�����
  for(i=8;i>0;i--)
  {
    scl=1;
    receive_data<<=1;
    if(sda) receive_data|=0x01;
    else receive_data&=0xfe;
    scl=0;
    for(j=2;j>0;j--);   
  }
  sda_out;//��Ϊ�����

  return (receive_data);
}
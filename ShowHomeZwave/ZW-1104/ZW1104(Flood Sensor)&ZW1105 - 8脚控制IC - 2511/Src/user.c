#include "user.h"

 /*
 * ��������user_init
 * ����  ����ʼ��user
 * ����  ����
 * ���  ����
 * ����  ���ⲿ����
 */
 void user_init(void)
 {
   if(i2c_read(0x00)==0xaa)
   {
     workfunction=i2c_read(0x01);   //ȡ�ϴ�����
	 workfunction+=1;
	 if(workfunction>3) workfunction=1;

	 i2c_write(0x01,workfunction);   //��ȫ����
   }
   else
   {
     i2c_write(0x00,0xaa);
	 i2c_write(0x01,0x01);
	 workfunction=1;
   }
 }
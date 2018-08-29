#include "user.h"

 /*
 * 函数名：user_init
 * 描述  ：初始化user
 * 输入  ：无
 * 输出  ：无
 * 调用  ：外部调用
 */
 void user_init(void)
 {
   if(i2c_read(0x00)==0xaa)
   {
     workfunction=i2c_read(0x01);   //取上次数据
	 workfunction+=1;
	 if(workfunction>3) workfunction=1;

	 i2c_write(0x01,workfunction);   //保全数据
   }
   else
   {
     i2c_write(0x00,0xaa);
	 i2c_write(0x01,0x01);
	 workfunction=1;
   }
 }
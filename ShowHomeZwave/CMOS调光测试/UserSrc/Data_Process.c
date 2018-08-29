/*******************************************************************************
	*
	* @FileName		  Data_Process.c
	* @Date					2018.03.29
	* @Author				DS.Chin
	* @CopyRight		(C) CopyRight  @2016 ~ 2026 Willis Ltd. Co.
	* @Description	This file contains all the function prototyped for the config
	*								fimer library
	*
*******************************************************************************/
#include "Data_Process.h"

xdata _Flag   UpDwnFlag1,UpDwnFlag2;
xdata _Flag   ChgFlag1, ChgFlag2;
xdata _Uint8  ChgTime;

/******************************************************************
  *
  * FunctionName    User_Data_Init
  *
*******************************************************************/
void User_Data_Init(void)
{
  Duty1 = 0;
  Duty2 = 0;
  UpDwnFlag1 = FALSE;
  UpDwnFlag2 = FALSE;
  ChgFlag1 = FALSE;
  ChgFlag2 = FALSE;
}


/******************************************************************
  *
  * FunctionName    Data_Process
  *
*******************************************************************/
void Data_Process(void)
{
  
}





/*******************************************************************************
	*
	* @File Name		Key_Scan.h
	* @Date					2016.12.23
	* @Description	按键扫描头文件
	*
*******************************************************************************/

#ifndef __KEY_SCAN_H__
#define	__KEY_SCAN_H__


/*Include---------------------------------------------------------------------*/
#include "Type_Def.h"
#include "Port_Def.h"


/**
	* @Key Data Type
	*/
typedef enum
{
	KEY_IDLE,
	KEY_SHORT,
	KEY_LONG
}_TypeEnumKey;


/**
	* @Key_Scan Exported Function
	*/
void Key_Scan(void);


/**
	*@Key_Scan Exported Parameters
	*/
extern _TypeEnumKey		KeyStatus;


#endif

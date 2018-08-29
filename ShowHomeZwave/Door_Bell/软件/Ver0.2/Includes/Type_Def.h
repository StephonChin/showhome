/*******************************************************************************
	*
	* @File Name		Type_Def.h
	* @Date					2016.12.23
	* @Author				DS.Chin
	* @Description	基本数据类型重定义
	*
*******************************************************************************/

#ifndef __TYPE_DEF_H__
#define __TYPE_DEF_H__

/*Include---------------------------------------------------------------------*/
#include "iostm8s003f3.h"

typedef unsigned char		_Uint8;
typedef unsigned short	_Uint16;
typedef unsigned long		_Uint32;
typedef signed char			_Sint8;
typedef signed short		_Sint16;
typedef signed long			_Sint32;
typedef enum
{
	FALSE,
	TRUE
}_Flag;


#define		SET			1
#define		RESET		0


#endif

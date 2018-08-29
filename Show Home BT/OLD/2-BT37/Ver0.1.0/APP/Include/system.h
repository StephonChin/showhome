#ifndef __SYSTEM_H__
#define __SYSTEM_H__

typedef     unsigned char       				_Uchar,_Uint8;
typedef     unsigned int        				_Uint,_Uint16;
typedef     enum
{
	FALSE=0,
	TRUE=!FALSE
} _Flag,_FlagStatus,_BitStatus;

/* 接收数据类型 */
typedef	struct  RCV_DATA_TYPE
{
	_Uchar	Header;
	_Uchar	GroupClass;
	_Uchar	RcvOpt[4];
}_TypeRcvData;

/*发送数据类型*/
typedef 	struct 	TYPE_REPLY
{
  	_Uchar	ReplyNum;
  	_Uchar	ReplyCmd;
  	_Uchar	ReplyOpt[7];
}_TypeReply;

/* 实时时钟类型 */
typedef 	struct 	TYPE_TIME
{
	_Uchar 	Hour;
	_Uchar 	Minute;
	_Uchar 	Second;
}_TypeRealTime;

/* 定时类型 */
typedef		struct TYPE_ALARM
{
	_Uchar 	OnHour;
	_Uchar	OnMinute;
	_Uchar	OffHour;
	_Uchar	OffMinute;
	_Uchar	CheckSum;
}_TypeAlarm;

/* 开关状态类型 */
#define		_TypeSwitchStatus(x)	union\
																{\
																	_Uchar x;\
																	struct\
																	{\
																		_Uchar x##_One 		:1;\
																		_Uchar x##_Two 		:1;\
																		_Uchar x##_Three 	:1;\
																		_Uchar x##_Four 	:1;\
																		_Uchar x##_Five 	:1;\
																		_Uchar x##_Six 		:1;\
																		_Uchar x##_Seven	:1;\
																		_Uchar x##_Eight 	:1;\
																	};\
																}

/********************************************************
 *
 * 设备类型选择 
 * 只可选择一种
 *
********************************************************/ 
/* 设备类型定义 */
//#define		DEVICE_NUM				1			/* 设备类型  1  选择 */
#define 		DEVICE_NUM				2			/* 设备类型  2  选择 */
//#define		DEVICE_NUM				3			/* 设备类型  3  选择 */
//#define 		DEVICE_NUM				4			/* 设备类型  4  选择 */
//#define		DEVICE_NUM				5			/* 设备类型  5  选择 */
//#define 		DEVICE_NUM				6			/* 设备类型  6  选择 */
//#define		DEVICE_NUM				7			/* 设备类型  7  选择 */
//#define 		DEVICE_NUM				8			/* 设备类型  8  选择 */
//#define		DEVICE_NUM				9			/* 设备类型  9  选择 */
//#define 		DEVICE_NUM				10			/* 设备类型  10  选择 */
//#define		DEVICE_NUM				11			/* 设备类型  11  选择 */
//#define 		DEVICE_NUM				12			/* 设备类型  12  选择 */
//#define		DEVICE_NUM				13			/* 设备类型  13  选择 */
//#define		DEVICE_NUM				14			/* 设备类型  14  选择 */
//#define		DEVICE_NUM				15			/* 设备类型  15  选择 */

/* 设备类型名定义 */
#define 		DEVICE_NAME_ONE			('S')
#define 		DEVICE_NAME_TWO 		('T')


/* 设备类型1*/
#if				DEVICE_NUM == 1			
	#define			DEVICE_ID		((_Uint)0x0001)
	#define 		DEVICE_TYPE		'1'
	
/* 设备类型2*/	
#elif			DEVICE_NUM == 2
	#define			DEVICE_ID		((_Uint)0x0002)
	#define 		DEVICE_TYPE		'2'
	
/* 设备类型3*/	
#elif			DEVICE_NUM == 3
	#define			DEVICE_ID		((_Uint)0x0004)
	#define 		DEVICE_TYPE		'3'
	
/* 设备类型4*/
#elif			DEVICE_NUM == 4
	#define			DEVICE_ID		((_Uint)0x0008)
	#define 		DEVICE_TYPE		'4'
	
/* 设备类型5*/
#elif			DEVICE_NUM == 5
	#define			DEVICE_ID		((_Uint)0x0010)
	#define 		DEVICE_TYPE		'5'
	
/* 设备类型6*/
#elif			DEVICE_NUM == 6
	#define			DEVICE_ID		((_Uint)0x0020)
	#define 		DEVICE_TYPE		'6'
	
/* 设备类型7*/
#elif			DEVICE_NUM == 7
	#define			DEVICE_ID		((_Uint)0x0040)
	#define 		DEVICE_TYPE		'7'
	
/* 设备类型8*/
#elif			DEVICE_NUM == 8
	#define			DEVICE_ID		((_Uint)0x0080)
	#define 		DEVICE_TYPE		'8'
	
/* 设备类型9*/
#elif			DEVICE_NUM == 9
	#define			DEVICE_ID		((_Uint)0x0100)
	#define 		DEVICE_TYPE		'9'
	
/* 设备类型10*/
#elif			DEVICE_NUM == 10
	#define			DEVICE_ID		((_Uint)0x0200)
	#define 		DEVICE_TYPE		'A'
	
/* 设备类型11*/
#elif			DEVICE_NUM == 11
	#define			DEVICE_ID		((_Uint)0x0400)
	#define 		DEVICE_TYPE		'B'
/* 设备类型12*/
#elif			DEVICE_NUM == 12
	#define			DEVICE_ID		((_Uint)0x0800)
	#define 		DEVICE_TYPE		'C'
	
/* 设备类型13*/
#elif			DEVICE_NUM == 13
	#define			DEVICE_ID		((_Uint)0x1000)
	#define 		DEVICE_TYPE		'D'
	
/* 设备类型14*/
#elif			DEVICE_NUM == 14
	#define			DEVICE_ID		((_Uint)0x2000)
	#define 		DEVICE_TYPE		'E'
	
/* 设备类型15*/
#elif			DEVICE_NUM == 15
	#define			DEVICE_ID		((_Uint)0x4000)
	#define 		DEVICE_TYPE		'F'
	
#endif

#endif
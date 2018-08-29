#ifndef __SYSTEM_H__
#define __SYSTEM_H__

typedef     unsigned char       				_Uchar,_Uint8;
typedef     unsigned int        				_Uint,_Uint16;
typedef     enum
{
	FALSE=0,
	TRUE=!FALSE
} _Flag,_FlagStatus,_BitStatus;

/* ������������ */
typedef	struct  RCV_DATA_TYPE
{
	_Uchar	Header;
	_Uchar	GroupClass;
	_Uchar	RcvOpt[4];
}_TypeRcvData;

/*������������*/
typedef 	struct 	TYPE_REPLY
{
  	_Uchar	ReplyNum;
  	_Uchar	ReplyCmd;
  	_Uchar	ReplyOpt[7];
}_TypeReply;

/* ʵʱʱ������ */
typedef 	struct 	TYPE_TIME
{
	_Uchar 	Hour;
	_Uchar 	Minute;
	_Uchar 	Second;
}_TypeRealTime;

/* ��ʱ���� */
typedef		struct TYPE_ALARM
{
	_Uchar 	OnHour;
	_Uchar	OnMinute;
	_Uchar	OffHour;
	_Uchar	OffMinute;
	_Uchar	CheckSum;
}_TypeAlarm;

/* ����״̬���� */
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
 * �豸����ѡ�� 
 * ֻ��ѡ��һ��
 *
********************************************************/ 
/* �豸���Ͷ��� */
//#define		DEVICE_NUM				1			/* �豸����  1  ѡ�� */
#define 		DEVICE_NUM				2			/* �豸����  2  ѡ�� */
//#define		DEVICE_NUM				3			/* �豸����  3  ѡ�� */
//#define 		DEVICE_NUM				4			/* �豸����  4  ѡ�� */
//#define		DEVICE_NUM				5			/* �豸����  5  ѡ�� */
//#define 		DEVICE_NUM				6			/* �豸����  6  ѡ�� */
//#define		DEVICE_NUM				7			/* �豸����  7  ѡ�� */
//#define 		DEVICE_NUM				8			/* �豸����  8  ѡ�� */
//#define		DEVICE_NUM				9			/* �豸����  9  ѡ�� */
//#define 		DEVICE_NUM				10			/* �豸����  10  ѡ�� */
//#define		DEVICE_NUM				11			/* �豸����  11  ѡ�� */
//#define 		DEVICE_NUM				12			/* �豸����  12  ѡ�� */
//#define		DEVICE_NUM				13			/* �豸����  13  ѡ�� */
//#define		DEVICE_NUM				14			/* �豸����  14  ѡ�� */
//#define		DEVICE_NUM				15			/* �豸����  15  ѡ�� */

/* �豸���������� */
#define 		DEVICE_NAME_ONE			('S')
#define 		DEVICE_NAME_TWO 		('T')


/* �豸����1*/
#if				DEVICE_NUM == 1			
	#define			DEVICE_ID		((_Uint)0x0001)
	#define 		DEVICE_TYPE		'1'
	
/* �豸����2*/	
#elif			DEVICE_NUM == 2
	#define			DEVICE_ID		((_Uint)0x0002)
	#define 		DEVICE_TYPE		'2'
	
/* �豸����3*/	
#elif			DEVICE_NUM == 3
	#define			DEVICE_ID		((_Uint)0x0004)
	#define 		DEVICE_TYPE		'3'
	
/* �豸����4*/
#elif			DEVICE_NUM == 4
	#define			DEVICE_ID		((_Uint)0x0008)
	#define 		DEVICE_TYPE		'4'
	
/* �豸����5*/
#elif			DEVICE_NUM == 5
	#define			DEVICE_ID		((_Uint)0x0010)
	#define 		DEVICE_TYPE		'5'
	
/* �豸����6*/
#elif			DEVICE_NUM == 6
	#define			DEVICE_ID		((_Uint)0x0020)
	#define 		DEVICE_TYPE		'6'
	
/* �豸����7*/
#elif			DEVICE_NUM == 7
	#define			DEVICE_ID		((_Uint)0x0040)
	#define 		DEVICE_TYPE		'7'
	
/* �豸����8*/
#elif			DEVICE_NUM == 8
	#define			DEVICE_ID		((_Uint)0x0080)
	#define 		DEVICE_TYPE		'8'
	
/* �豸����9*/
#elif			DEVICE_NUM == 9
	#define			DEVICE_ID		((_Uint)0x0100)
	#define 		DEVICE_TYPE		'9'
	
/* �豸����10*/
#elif			DEVICE_NUM == 10
	#define			DEVICE_ID		((_Uint)0x0200)
	#define 		DEVICE_TYPE		'A'
	
/* �豸����11*/
#elif			DEVICE_NUM == 11
	#define			DEVICE_ID		((_Uint)0x0400)
	#define 		DEVICE_TYPE		'B'
/* �豸����12*/
#elif			DEVICE_NUM == 12
	#define			DEVICE_ID		((_Uint)0x0800)
	#define 		DEVICE_TYPE		'C'
	
/* �豸����13*/
#elif			DEVICE_NUM == 13
	#define			DEVICE_ID		((_Uint)0x1000)
	#define 		DEVICE_TYPE		'D'
	
/* �豸����14*/
#elif			DEVICE_NUM == 14
	#define			DEVICE_ID		((_Uint)0x2000)
	#define 		DEVICE_TYPE		'E'
	
/* �豸����15*/
#elif			DEVICE_NUM == 15
	#define			DEVICE_ID		((_Uint)0x4000)
	#define 		DEVICE_TYPE		'F'
	
#endif

#endif
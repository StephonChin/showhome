#ifndef __SYSTEM_H__
#define __SYSTEM_H__

typedef     unsigned char       _Uchar;
typedef     unsigned int        _Uint;
typedef     enum{FALSE=0,TRUE=!FALSE}        _Flag;
typedef	struct  RCV_DATA_TYPE
{
	_Uchar		Header;
	_Uchar		TypeH;
	_Uchar		TypeL;
	_Uchar		GroupClass;
	_Uchar		FirstCmd;
	_Uchar		SecondCmd;
}_RcvDataType;

#define     TRUE        1
#define     FALSE       0


//#define			TEST_CODE			1

/* equipment type */
#define			DEVICE_NUM				4

#if				DEVICE_NUM == 1			
	#define			DEVICE_ID		(_Uint)0x0001
#elif			DEVICE_NUM == 2
	#define			DEVICE_ID		(_Uint)0x0002
#elif			DEVICE_NUM == 3
	#define			DEVICE_ID		(_Uint)0x0004
#elif			DEVICE_NUM == 4
	#define			DEVICE_ID		(_Uint)0x0008
#endif

#endif
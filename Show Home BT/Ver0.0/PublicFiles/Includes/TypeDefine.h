/*******************************************************************************
	*
	* FILE NAME
	*            TypeDefine.h
	* DATE
	*            19-May-2017
	* AUTHOR
	*            DS.Chin
	* BRIEF
	*						 Type Define
	*            Device type define
	* 					 
*******************************************************************************/
#ifndef _TYPEDEFINE_H_
#define _TYPEDEFINE_H_

/* <-- Include Files -------------------------------------------------------> */
#include "iostm8s003f3.h"
#include "Attribute.h"

/* <-- Redefine the basic data type ----------------------------------------> */
typedef 		unsigned char						_Uint8;
typedef 		unsigned int						_Uint16;
typedef 		signed short						_Sint8;
typedef 		signed long							_Sint16;
typedef 		enum
{
	FALSE,
	TRUE = !FALSE
} _Flag;

/* <-- Constant Define -----------------------------------------------------> */
#define			SET										(1)
#define			RESET									(0)



/* <-- Device Type Define-------------------------------------------------------
 *
 * CONTANT VECTOR TABLE ABOUT THE DEVICE TYPE *
 * BT36    ------  LT1												*
 * BT37    ------  LT2												*
 * BT38    ------  LT3												*
 * BT39    ------  LT4												*
 * BT1502  ------  LT5												*
 * BT1505  ------  LT6												*
 * BT30    ------  LT7												*
 * BT31    ------  LT8												*
 *
 * -------------------------------------------------------------------------> */
#ifndef DEVICE_NAME
	#define	DEVICE_NAME						1
	#define	DEVICE_NAME_ONE				'L'
	#define DEVICE_NAME_TWO				'T'
#else
	#error "------<ERR(1)>------ The device name redefine!!!"
#endif

// BT36 = LT1
#ifdef BT36
	#if	BT37 | BT38 | BT39 | BT1502 | BT1505 | BT30 | BT31	
		#error "------<ERR(2)>------ The device type redefine at < BT36 > !!!"
	#endif

	#define	DEVICE_NAME_THREE			'1'
#endif

// BT37 = LT2
#ifdef BT37
	#if	BT36 | BT38 | BT39 | BT1502 | BT1505 | BT30 | BT31
		#error "------<ERR(2)>------ The device type redefine at < BT37 > !!!"
	#endif

	#define	DEVICE_NAME_THREE			'2'
#endif

// BT38 = LT3
#ifdef BT38
	#if	BT36 | BT37 | BT39 | BT1502 | BT1505 | BT30 | BT31
		#error "------<ERR(2)>------ The device type redefine at < BT38 > !!!"
	#endif

	#define	DEVICE_NAME_THREE			'3'
#endif

// BT39 = LT4
#ifdef BT39
	#if	BT36 | BT37 | BT38 | BT1502 | BT1505 | BT30 | BT31
		#error "------<ERR(2)>------ The device type redefine at < BT39 > !!!"
	#endif

	#define	DEVICE_NAME_THREE			'4'
#endif

// BT1502 = LT5
#ifdef BT1502
	#if	BT36 | BT37 | BT38 | BT39 | BT1505 | BT30 | BT31
		#error "------<ERR(2)>------ The device type redefine at < BT1502 > !!!"
	#endif

	#define	DEVICE_NAME_THREE			'5'
#endif

// BT1505 = LT6
#ifdef BT1505
	#if	BT36 | BT37 | BT38 | BT39 | BT1502 | BT30 | BT31
		#error "------<ERR(2)>------ The device type redefine at < BT1505 > !!!"
	#endif

	#define	DEVICE_NAME_THREE			'6'
#endif

// BT30 = LT7
#ifdef BT30
	#if	BT36 | BT37 | BT38 | BT39 | BT1502 | BT1505 | BT31
		#error "------<ERR(2)>------ The device type redefine at < BT30 > !!!"
	#endif

	#define	DEVICE_NAME_THREE			'7'
#endif

// BT31 = LT8
#ifdef BT30
	#if	BT36 | BT37 | BT38 | BT39 | BT1502 | BT1505 | BT30
		#error "------<ERR(2)>------ The device type redefine at < BT31 > !!!"
	#endif

	#define	DEVICE_NAME_THREE			'8'
#endif


#ifndef DEVICE_NAME_THREE
	#error	"------<ERR(3)>------ There is no type defined !!!"
#endif



#endif /* _TYPEDEFINE_H_ */


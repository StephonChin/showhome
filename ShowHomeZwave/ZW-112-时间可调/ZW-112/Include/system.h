#ifndef	__SYSTEM_H__
#define	__SYSTEM_H__

#include "sn8p2711b.h"

typedef	unsigned char uchar;
typedef unsigned long  uint;
typedef bit		  BitStatus;

extern uchar	sysForbidTime;			//��ֹ����ʱ��

extern BitStatus sysKeyStatusFlag;		//����״̬��־λ,״̬�����仯ʱ�������ź�
extern BitStatus sysPirStatusFlag;		//PIR�źż�⵽��־λ
extern BitStatus sysTriacInit;			//����źų�ʼ����־
extern BitStatus sysTriacFlag;			//����źű�־λ
extern BitStatus forbidFlag;

#endif
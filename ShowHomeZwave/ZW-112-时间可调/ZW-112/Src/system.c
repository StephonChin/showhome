/*********************************************
 * @ FileName: system.c
 * @ Date: 2015.10.15
 * @ Author: DS.Chin
 * @ Describe: ȫ�ֱ���
*********************************************/
#include "system.h"

uchar	sysForbidTime;			//��ֹ����ʱ��

BitStatus 		sysKeyStatusFlag;		//����״̬��־λ,״̬�����仯ʱ�������ź�
BitStatus 		sysPirStatusFlag;		//PIR�źż�⵽��־λ
BitStatus 		sysTriacInit;			//����źų�ʼ����־
BitStatus 		sysTriacFlag;			//����źű�־λ
BitStatus		forbidFlag;
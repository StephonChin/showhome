#ifndef __KEY_SCAN_H__
#define __KEY_SCAN_H__

/* data_send.c */
extern _TypeReply		ReplyData;
extern _Flag				RepeatFlag;						//�ظ����ͱ�־λ
extern _Uchar   		RepeatCnt;						//�ظ�������������
extern _Uchar   		RepeatDelayTime;			//�ظ������ӳٲ���


/* switch_control.c */
extern _TypeSwitchStatus(AllStatus);
extern _Uchar				OneStatus;

#endif
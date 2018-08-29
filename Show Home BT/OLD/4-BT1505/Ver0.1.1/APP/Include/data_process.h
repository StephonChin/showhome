#ifndef __DATA_PROCESS_H__
#define __DATA_PROCESS_H__

/* data_rcv.c */
extern _TypeRcvData	RcvData;
extern _Flag       	RcvStatus;                        //Received status DISABLE | ENABLE

/* data_send.c */
extern _Flag				TypeReply;
extern _TypeReply		ReplyData;
extern _Flag				RepeatFlag;						//�ظ����ͱ�־λ
extern _Uchar   		RepeatCnt;						//�ظ�������������
extern _Uchar   		RepeatDelayTime;			//�ظ������ӳٲ���


/* timer_program.c */
extern 	_TypeAlarm				PrgTimer[5][10];
extern 	_TypeRealTime			RealTime;
extern	_Uchar						AllPrgCheckSum[5];


/* key_scan.c */
extern _Flag 			KeyShortFlag;



#endif
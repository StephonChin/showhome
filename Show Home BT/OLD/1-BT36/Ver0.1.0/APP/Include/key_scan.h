#ifndef __KEY_SCAN_H__
#define __KEY_SCAN_H__

/* data_send.c */
extern _TypeReply		ReplyData;
extern _Flag				RepeatFlag;						//重复发送标志位
extern _Uchar   		RepeatCnt;						//回复次数计数参数
extern _Uchar   		RepeatDelayTime;			//回复次数延迟参数


/* switch_control.c */
extern _TypeSwitchStatus(AllStatus);
extern _Uchar				OneStatus;

#endif
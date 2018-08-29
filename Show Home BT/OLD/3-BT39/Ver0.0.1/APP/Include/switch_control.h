#ifndef __SWITCH_CONTROL_H__
#define __SWITCH_CONTROL_H__

extern _Flag       StatusReplyFlag;         //flag about equipment is ready to send the status information
extern _Flag       ReplyRepeatFlag;        //flag about send repeat
extern _Uchar      StatusReplyCommand;      // ReplyCommand

extern _Uchar   RepeatCnt;
extern _Uchar   RepeatDelayTime;

extern _Flag       AppControlFlag;


extern _Uchar		ReplyStatus;
extern _Uchar		ReplyGroup;
#endif
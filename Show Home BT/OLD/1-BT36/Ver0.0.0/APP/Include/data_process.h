#ifndef __DATA_PROCESS_H__
#define __DATA_PROCESS_H__

/* data_rcv.c */
//extern _Uchar      RcvData[5];                       //Received data 0: ID 1: Mode 2: Color
extern _RcvDataType		RcvData;
extern _Flag       RcvStatus;                        //Received status DISABLE | ENABLE

extern _Flag       ReplyRepeatFlag;        //flag about send repeat
extern _Flag       PowerReplyFlag;         //replay flag when power on
extern _Flag       StatusReplyFlag;         //flag about equipment is ready to send the status information
extern _Flag       NormalReplyFlag;        //respond 's flag

extern _Uchar      StatusReplyCommand;      // ReplyCommand
extern _Uchar      NormalReplyCommand;

extern _Uchar   RepeatCnt;
extern _Uchar   RepeatDelayTime;

extern _Uchar		ReplyStatus;
extern _Uchar		ReplyGroup;

extern _Uchar      SwitchStatus;
extern _Flag       SwitchInit;

extern  _Uchar SecondCnt1;
extern _Uchar  SecondCnt2;
extern _Flag   SecondFlag;

extern _Uchar  RealSecond;     //current second
extern _Uchar  RealMinute;     //current minute
extern _Uchar  RealHour;       //current hour

extern _Uchar  GroupOneOnHour;
extern _Uchar  GroupOneOnMinute;
extern _Uchar  GroupTwoOnHour;
extern _Uchar  GroupTwoOnMinute;
extern _Uchar  GroupThreeOnHour;
extern _Uchar  GroupThreeOnMinute;

extern _Uchar  GroupOneOffHour;
extern _Uchar  GroupOneOffMinute;
extern _Uchar  GroupTwoOffHour;
extern _Uchar  GroupTwoOffMinute;
extern _Uchar  GroupThreeOffHour;
extern _Uchar  GroupThreeOffMinute;

extern _Flag   ADActivedFlag;

extern _Uchar ShakeTime;
extern _Flag  StatusChgFlag;
extern _Flag   ADActivedFlag;

#endif
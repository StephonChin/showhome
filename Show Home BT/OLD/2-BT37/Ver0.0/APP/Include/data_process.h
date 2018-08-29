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
extern _Flag		StatusBothReplyFlag;

extern _Uchar      StatusReplyCommand;      // ReplyCommand
extern _Uchar      NormalReplyCommand;

extern _Uchar   RepeatCnt;
extern _Uchar   RepeatDelayTime;

extern _Uchar		ReplyStatus;
extern _Uchar		ReplyGroup;

extern _Uchar      SwitchStatus[2];
extern _Flag       SwitchInit[2];

extern  _Uchar SecondCnt1;
extern _Uchar  SecondCnt2;
extern _Flag   SecondFlag;

extern _Uchar  RealSecond;     //current second
extern _Uchar  RealMinute;     //current minute
extern _Uchar  RealHour;       //current hour

extern _Uchar  GroupOneOnHour[2];
extern _Uchar  GroupOneOnMinute[2];
extern _Uchar  GroupTwoOnHour[2];
extern _Uchar  GroupTwoOnMinute[2];
extern _Uchar  GroupThreeOnHour[2];
extern _Uchar  GroupThreeOnMinute[2];

extern _Uchar  GroupOneOffHour[2];
extern _Uchar  GroupOneOffMinute[2];
extern _Uchar  GroupTwoOffHour[2];
extern _Uchar  GroupTwoOffMinute[2];
extern _Uchar  GroupThreeOffHour[2];
extern _Uchar  GroupThreeOffMinute[2];

extern _Flag   ADActivedFlag;

extern _Uchar ShakeTime;
extern _Flag  StatusChgFlag;
extern _Flag   ADActivedFlag;

#endif
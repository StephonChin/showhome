#ifndef __led_h
#define __led_h
#define uchar unsigned char
extern uchar red_group_1;
extern uchar red_group_2;
extern uchar red_group_3;
extern uchar green_group_1;
extern uchar green_group_2;
extern uchar green_group_3;
extern uchar blue_group_1;
extern uchar blue_group_2;
extern uchar blue_group_3;
#define sck P63
#define sda P64

#define red_1 P02
#define red_2 P11
#define red_3 P14
#define red_4 P17
#define red_5 P62
#define red_6 P22
#define red_7 P25
#define red_8 P30
#define red_9 P37
#define red_10 P42
#define red_11 P45
#define red_12 P50
#define red_13 P53
//#define red_14 P54
//#define red_15
//#define red_16
//#define red_17

#define green_1 P01
#define green_2 P10
#define green_3	P13
#define green_4	P16
#define green_5	P61
#define green_6	P21
#define green_7	P24
#define green_8	P27
#define green_9	P32
#define green_10 P41
#define green_11 P44
#define green_12 P47
#define green_13 P52
#define green_14 P55
//#define green_15
//#define green_16
//#define green_17

#define blue_1 P00
#define blue_2 P03
#define blue_3 P12
#define blue_4 P15
#define blue_5 P60
#define blue_6 P20
#define blue_7 P23
#define blue_8 P26
#define blue_9 P31
#define blue_10 P40
#define blue_11	P43
#define blue_12	P46
#define blue_13	P51
#define blue_14 P54
//#define blue_15
//#define blue_16
//#define blue_17
void led_control(void);
#endif
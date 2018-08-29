#ifndef __ade7753_h
#define __ade7753_h

#define uchar unsigned char 
#define u8    unsigned char
#define u16   unsigned short
#define u32   unsigned long

//ade7753、63中的寄存器名称及地址
//		寄存器		地址
#define WAVEFORM	0x01 
#define AENERGY		0x02 
#define RAENERGY	0x03 
#define LAENERGY	0x04 
#define VAENERGY	0x05 
#define RVAENERGY	0x06 
#define LVAENERGY	0x07 
#define RESERVED	0x08 
#define MODE		0x09 
#define IRQEN		0x0A 
#define STATUS		0x0B 
#define RSTSTATUS	0x0C 
#define CH1OS		0x0D 
#define CH2OS		0x0E 
#define GAIN		0x0F 
#define PHCAL		0x10 
#define APOS		0x11 
#define WGAIN		0x12 
#define WDIV		0x13 
#define CFNUM		0x14 
#define CFDEN		0x15 
#define IRMS		0x16 
#define VRMS		0x17 
#define IRMSOS		0x18 
#define VRMSOS		0x19 
#define VAGAIN		0x1A 
#define VADIV		0x1B 
#define LINECYC		0x1C 
#define ZXTOUT		0x1D 
#define SAGCYC		0x1E 
#define SAGLVL		0x1F 
#define IPKLVL		0x20 
#define VPKLVL		0x21 
#define IPEAK		0x22 
#define RSTIPEAK	0x23 
#define VPEAK		0x24 
#define RSTVPEAK	0x25 
#define TEMP		0x26 
#define PERIOD		0x27 
#define TMODE		0x3D 
#define CHKSUM		0x3E 
#define DIEREV		0x3F 

//定义对应地址中寄存器的字节数
char	const reg_len[]={
//			0 1 2 3 4 5 6 7 8 9 A B	C D	E F
/*0x0	*/0,3,3,3,3,3,3,3,3,2,2,2,2,1,1,1,
/*0x10*/1,2,2,1,2,2,3,3,2,2,2,1,2,2,1,1,
/*0x20*/1,1,3,3,3,3,1,2,0,0,0,0,0,0,0,0,
/*0x30*/0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1
};

//定义可读写的寄存器，标定时需要保存的寄存器可定义再此处，顺序不限。
char	const wr_rd_reg[]={
MODE,
IRQEN,
CH1OS,	
CH2OS,	
GAIN,	
PHCAL,	
APOS,	
WGAIN,	
WDIV,	
CFNUM,	
CFDEN,	
IRMSOS,	
VRMSOS,	
VAGAIN,	
VADIV,	
LINECYC,	
ZXTOUT,	
SAGCYC,	
SAGLVL,	
IPKLVL,	
VPKLVL,	
TMODE,	
};

//用于读取寄存器列表
char const rd_reg[]={
 WAVEFORM,
 AENERGY,	
 RAENERGY,
 LAENERGY,
 VAENERGY,
 RVAENERGY,
 LVAENERGY,
 RESERVED,
 MODE,	
 IRQEN,	
 STATUS,	
 RSTSTATUS,
 CH1OS,	
 CH2OS,	
 GAIN,	
 PHCAL,	
 APOS,	
 WGAIN,	
 WDIV,	
 CFNUM,	
 CFDEN,	
 IRMS,	
 VRMS,	
 IRMSOS,	
 VRMSOS,	
 VAGAIN,	
 VADIV,	
 LINECYC,	
 ZXTOUT,	
 SAGCYC,	
 SAGLVL,	
 IPKLVL,	
 VPKLVL,	
 IPEAK,	
 RSTIPEAK,
 VPEAK,	
 RSTVPEAK,
 TEMP,	
 PERIOD,	
 TMODE,	
 CHKSUM,	
 DIEREV,	
};


typedef	struct{
	long	waveform;		//波形寄存器电压电流
	long	anergy;			//有功功率
	long	ranergy;		//有功功率，读取后自动清零
	long	laenergy;		//线累计有功功率，N个lincyc半周期上的累计值
	u32	vaenergy;		//视在功率
	u32	rvaenergy;		//视在功率，读取后自动清零
	u32	lvaenergy;		//线视在功率，N个lincyc半周期上的累计值
	long	lvarenergy;		//
	u8	mode;			//模式寄存器，配置采样速率、校准模式、滤波使能等，任何时间都能读取。
	u8	irqen;			//中断使能寄存器
	u8	status;			//中断状态寄存器
	u8	rststatus;		//中断状态寄存器，读取后自动清零
	char	ch1os;			//通道1的偏移调节寄存器
	char	ch2os;			//通道2的偏移调节寄存器
	uchar	gain;			//增益调节寄存器，控制CH1和CH2的通道增益
	char	phcal;			//相位校准寄存器，通道1和通道2之间的相位差，0x1d～0x21之间有效
	int		apos;			//有效功率偏移校准寄存器，可以移去较小的有效功率偏移量
	int		wgain;			//有功功率校准寄存器，偏移量+-50％
	uchar	wdiv;			//有功功率除数寄存器，有功功率＝内部有功功率/wdiv
	u8	cfnum;			//CF频率除数分子寄存器，写入值可调节CF引脚输出频率
	u8	cfden;			//CF频率除数分母寄存器，写入值可调节CF引脚输出频率
	u32	irms;			//CH1电流有效值
	u32	vrms;			//CH2电压有效值
	int		irmsos;			//CH1电流有效值偏移量调节寄存器
	int		vrmsos;			//CH2电压有效值偏移量调节寄存器
	int		vgain;			//视在功率增益调节寄存器，+-50％范围
	uchar	vadiv;			//视在功率除数寄存器，视在功率＝内部视在功率/vadiv
	u8	linecyc;		//线周期能力累计模式累计周期寄存器，能量累计半周期个数。
	u8	zxtout;			//过零超时寄存器，一段时间内在ch2上没有检测的过零信号，可产生中断
	uchar	sagcyc;			//线电压跌落周期寄存器，SAG信号输出前通道2的线电压跌落到saglvl的连续周期数
	uchar	saglvl;			//线电压跌落电平寄存器。
	uchar	ipklvl;			//通道1最大电流脉冲值
	uchar	vpklvl;			//通道2最大电压脉冲值
	u32	ipeak;			//CH1电流最大值
	u32	rstipeak;		//CH1电流最大值,读取后自动清零
	u32	vpeak;			//CH2电压最大值
	u32	rstvpeak;		//CH2电压最大值,读取后自动清零
	char	temp;			//温度寄存器，有最新的温度转换值
	u8	period;			//CH2的周期，由过零评估得来。最高位总为0
	uchar	tmode;			//测试模式寄存器
	uchar	chksum;			//校验和以上字节的和
	uchar	dierev;			//芯片硬件版本

}energy_registers;

typedef		union{
	long	long_val;
	int		int_val;
	char	char_val;
	char	rddata[4];			//最高字节
}valchange;


void ade7753_config(void);
void	ade7753_write_bytes(uchar reg_name);
void	ade7753_read_bytes(uchar reg_name);
void meter_data_get (u8 reg_name);
void meter_watt(u8 val);
void meter_rate_get(void);


extern void eeprom_write(u8 addr,u8 data);

//void vrms_get (void);
#endif
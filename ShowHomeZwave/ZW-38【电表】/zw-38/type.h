#ifndef __type_h
#define __type_h

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


#define vrms_updata 1
#define irms_updata 2
#define waveform_updata 3
#define aenergy_updata 4

#define get_vrms 1
#define get_irms 2
#define get_chanel1_waveform 3
#define get_chanel2_waveform 4
#define get_aenergy 5

#define report_w 1
#define report_v 2
#define report_a 3
#define report_k 4
#define report_d 5
#define report_r 6
#define report_va 7
#define report_rate 8

#define  ok 0
#define  no_ok 1


#endif
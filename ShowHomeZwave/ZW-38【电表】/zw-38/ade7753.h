#ifndef __ade7753_h
#define __ade7753_h

#define uchar unsigned char 
#define u8    unsigned char
#define u16   unsigned short
#define u32   unsigned long

//ade7753��63�еļĴ������Ƽ���ַ
//		�Ĵ���		��ַ
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

//�����Ӧ��ַ�мĴ������ֽ���
char	const reg_len[]={
//			0 1 2 3 4 5 6 7 8 9 A B	C D	E F
/*0x0	*/0,3,3,3,3,3,3,3,3,2,2,2,2,1,1,1,
/*0x10*/1,2,2,1,2,2,3,3,2,2,2,1,2,2,1,1,
/*0x20*/1,1,3,3,3,3,1,2,0,0,0,0,0,0,0,0,
/*0x30*/0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1
};

//����ɶ�д�ļĴ������궨ʱ��Ҫ����ļĴ����ɶ����ٴ˴���˳���ޡ�
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

//���ڶ�ȡ�Ĵ����б�
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
	long	waveform;		//���μĴ�����ѹ����
	long	anergy;			//�й�����
	long	ranergy;		//�й����ʣ���ȡ���Զ�����
	long	laenergy;		//���ۼ��й����ʣ�N��lincyc�������ϵ��ۼ�ֵ
	u32	vaenergy;		//���ڹ���
	u32	rvaenergy;		//���ڹ��ʣ���ȡ���Զ�����
	u32	lvaenergy;		//�����ڹ��ʣ�N��lincyc�������ϵ��ۼ�ֵ
	long	lvarenergy;		//
	u8	mode;			//ģʽ�Ĵ��������ò������ʡ�У׼ģʽ���˲�ʹ�ܵȣ��κ�ʱ�䶼�ܶ�ȡ��
	u8	irqen;			//�ж�ʹ�ܼĴ���
	u8	status;			//�ж�״̬�Ĵ���
	u8	rststatus;		//�ж�״̬�Ĵ�������ȡ���Զ�����
	char	ch1os;			//ͨ��1��ƫ�Ƶ��ڼĴ���
	char	ch2os;			//ͨ��2��ƫ�Ƶ��ڼĴ���
	uchar	gain;			//������ڼĴ���������CH1��CH2��ͨ������
	char	phcal;			//��λУ׼�Ĵ�����ͨ��1��ͨ��2֮�����λ�0x1d��0x21֮����Ч
	int		apos;			//��Ч����ƫ��У׼�Ĵ�����������ȥ��С����Ч����ƫ����
	int		wgain;			//�й�����У׼�Ĵ�����ƫ����+-50��
	uchar	wdiv;			//�й����ʳ����Ĵ������й����ʣ��ڲ��й�����/wdiv
	u8	cfnum;			//CFƵ�ʳ������ӼĴ�����д��ֵ�ɵ���CF�������Ƶ��
	u8	cfden;			//CFƵ�ʳ�����ĸ�Ĵ�����д��ֵ�ɵ���CF�������Ƶ��
	u32	irms;			//CH1������Чֵ
	u32	vrms;			//CH2��ѹ��Чֵ
	int		irmsos;			//CH1������Чֵƫ�������ڼĴ���
	int		vrmsos;			//CH2��ѹ��Чֵƫ�������ڼĴ���
	int		vgain;			//���ڹ���������ڼĴ�����+-50����Χ
	uchar	vadiv;			//���ڹ��ʳ����Ĵ��������ڹ��ʣ��ڲ����ڹ���/vadiv
	u8	linecyc;		//�����������ۼ�ģʽ�ۼ����ڼĴ����������ۼư����ڸ�����
	u8	zxtout;			//���㳬ʱ�Ĵ�����һ��ʱ������ch2��û�м��Ĺ����źţ��ɲ����ж�
	uchar	sagcyc;			//�ߵ�ѹ�������ڼĴ�����SAG�ź����ǰͨ��2���ߵ�ѹ���䵽saglvl������������
	uchar	saglvl;			//�ߵ�ѹ�����ƽ�Ĵ�����
	uchar	ipklvl;			//ͨ��1����������ֵ
	uchar	vpklvl;			//ͨ��2����ѹ����ֵ
	u32	ipeak;			//CH1�������ֵ
	u32	rstipeak;		//CH1�������ֵ,��ȡ���Զ�����
	u32	vpeak;			//CH2��ѹ���ֵ
	u32	rstvpeak;		//CH2��ѹ���ֵ,��ȡ���Զ�����
	char	temp;			//�¶ȼĴ����������µ��¶�ת��ֵ
	u8	period;			//CH2�����ڣ��ɹ����������������λ��Ϊ0
	uchar	tmode;			//����ģʽ�Ĵ���
	uchar	chksum;			//У��������ֽڵĺ�
	uchar	dierev;			//оƬӲ���汾

}energy_registers;

typedef		union{
	long	long_val;
	int		int_val;
	char	char_val;
	char	rddata[4];			//����ֽ�
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
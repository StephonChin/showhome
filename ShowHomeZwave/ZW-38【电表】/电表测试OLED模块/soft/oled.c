/*********************************************************************
 * FileName: oled.c
 * Describe: display the data: temperature/humidity/light intensity
 * !!!本程序主要参考信意电子科技OLED演示程序V1.0[GuoKaiyi]
**********************************************************************/
#include "oled.h"

const u8t F6x8[][6] =
{
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },   //sp0
    { 0x00, 0x00, 0x00, 0x2f, 0x00, 0x00 },   // !1
    { 0x00, 0x00, 0x07, 0x00, 0x07, 0x00 },   // "2
    { 0x00, 0x14, 0x7f, 0x14, 0x7f, 0x14 },   // #3
    { 0x00, 0x24, 0x2a, 0x7f, 0x2a, 0x12 },   // $4
    { 0x00, 0x62, 0x64, 0x08, 0x13, 0x23 },   // %5
    { 0x00, 0x36, 0x49, 0x55, 0x22, 0x50 },   // &6
    { 0x00, 0x00, 0x05, 0x03, 0x00, 0x00 },   // '7
    { 0x00, 0x00, 0x1c, 0x22, 0x41, 0x00 },   // (8
    { 0x00, 0x00, 0x41, 0x22, 0x1c, 0x00 },   // )9
    { 0x00, 0x14, 0x08, 0x3E, 0x08, 0x14 },   // *10
    { 0x00, 0x08, 0x08, 0x3E, 0x08, 0x08 },   // +11
    { 0x00, 0x00, 0x00, 0xA0, 0x60, 0x00 },   // ,12
    { 0x00, 0x08, 0x08, 0x08, 0x08, 0x08 },   // -13
    { 0x00, 0x00, 0x60, 0x60, 0x00, 0x00 },   // .14
    { 0x00, 0x20, 0x10, 0x08, 0x04, 0x02 },   // /15
    { 0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E },   // 016
    { 0x00, 0x00, 0x42, 0x7F, 0x40, 0x00 },   // 117
    { 0x00, 0x42, 0x61, 0x51, 0x49, 0x46 },   // 218
    { 0x00, 0x21, 0x41, 0x45, 0x4B, 0x31 },   // 319
    { 0x00, 0x18, 0x14, 0x12, 0x7F, 0x10 },   // 420
    { 0x00, 0x27, 0x45, 0x45, 0x45, 0x39 },   // 521
    { 0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30 },   // 622
    { 0x00, 0x01, 0x71, 0x09, 0x05, 0x03 },   // 723
    { 0x00, 0x36, 0x49, 0x49, 0x49, 0x36 },   // 824
    { 0x00, 0x06, 0x49, 0x49, 0x29, 0x1E },   // 925
    { 0x00, 0x00, 0x36, 0x36, 0x00, 0x00 },   // :26
    { 0x00, 0x00, 0x56, 0x36, 0x00, 0x00 },   // ;27
    { 0x00, 0x08, 0x14, 0x22, 0x41, 0x00 },   // <28
    { 0x00, 0x14, 0x14, 0x14, 0x14, 0x14 },   // =29
    { 0x00, 0x00, 0x41, 0x22, 0x14, 0x08 },   // >30
    { 0x00, 0x02, 0x01, 0x51, 0x09, 0x06 },   // ?31
    { 0x00, 0x32, 0x49, 0x59, 0x51, 0x3E },   // @32
    { 0x00, 0x7C, 0x12, 0x11, 0x12, 0x7C },   // A33
    { 0x00, 0x7F, 0x49, 0x49, 0x49, 0x36 },   // B34
    { 0x00, 0x3E, 0x41, 0x41, 0x41, 0x22 },   // C35
    { 0x00, 0x7F, 0x41, 0x41, 0x22, 0x1C },   // D36
    { 0x00, 0x7F, 0x49, 0x49, 0x49, 0x41 },   // E37
    { 0x00, 0x7F, 0x09, 0x09, 0x09, 0x01 },   // F38
    { 0x00, 0x3E, 0x41, 0x49, 0x49, 0x7A },   // G39
    { 0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F },   // H40
    { 0x00, 0x00, 0x41, 0x7F, 0x41, 0x00 },   // I41
    { 0x00, 0x20, 0x40, 0x41, 0x3F, 0x01 },   // J42
    { 0x00, 0x7F, 0x08, 0x14, 0x22, 0x41 },   // K43
    { 0x00, 0x7F, 0x40, 0x40, 0x40, 0x40 },   // L44
    { 0x00, 0x7F, 0x02, 0x0C, 0x02, 0x7F },   // M45
    { 0x00, 0x7F, 0x04, 0x08, 0x10, 0x7F },   // N46
    { 0x00, 0x3E, 0x41, 0x41, 0x41, 0x3E },   // O47
    { 0x00, 0x7F, 0x09, 0x09, 0x09, 0x06 },   // P48
    { 0x00, 0x3E, 0x41, 0x51, 0x21, 0x5E },   // Q49
    { 0x00, 0x7F, 0x09, 0x19, 0x29, 0x46 },   // R50
    { 0x00, 0x46, 0x49, 0x49, 0x49, 0x31 },   // S51
    { 0x00, 0x01, 0x01, 0x7F, 0x01, 0x01 },   // T52
    { 0x00, 0x3F, 0x40, 0x40, 0x40, 0x3F },   // U53
    { 0x00, 0x1F, 0x20, 0x40, 0x20, 0x1F },   // V54
    { 0x00, 0x3F, 0x40, 0x38, 0x40, 0x3F },   // W55
    { 0x00, 0x63, 0x14, 0x08, 0x14, 0x63 },   // X56
    { 0x00, 0x07, 0x08, 0x70, 0x08, 0x07 },   // Y57
    { 0x00, 0x61, 0x51, 0x49, 0x45, 0x43 },   // Z58
    { 0x00, 0x00, 0x7F, 0x41, 0x41, 0x00 },   // [59
    { 0x00, 0x02, 0x04, 0x08, 0x10, 0x20 },   // \60
    { 0x00, 0x00, 0x41, 0x41, 0x7F, 0x00 },   // ]61
    { 0x00, 0x04, 0x02, 0x01, 0x02, 0x04 },   // ^62
    { 0x00, 0x40, 0x40, 0x40, 0x40, 0x40 },   // _63
    { 0x00, 0x00, 0x01, 0x02, 0x04, 0x00 },   // '64
    { 0x00, 0x20, 0x54, 0x54, 0x54, 0x78 },   // a65
    { 0x00, 0x7F, 0x48, 0x44, 0x44, 0x38 },   // b66
    { 0x00, 0x38, 0x44, 0x44, 0x44, 0x20 },   // c67
    { 0x00, 0x38, 0x44, 0x44, 0x48, 0x7F },   // d68
    { 0x00, 0x38, 0x54, 0x54, 0x54, 0x18 },   // e69
    { 0x00, 0x08, 0x7E, 0x09, 0x01, 0x02 },   // f70
    { 0x00, 0x18, 0xA4, 0xA4, 0xA4, 0x7C },   // g71
    { 0x00, 0x7F, 0x08, 0x04, 0x04, 0x78 },   // h72
    { 0x00, 0x00, 0x44, 0x7D, 0x40, 0x00 },   // i73
    { 0x00, 0x40, 0x80, 0x84, 0x7D, 0x00 },   // j74
    { 0x00, 0x7F, 0x10, 0x28, 0x44, 0x00 },   // k75
    { 0x00, 0x00, 0x41, 0x7F, 0x40, 0x00 },   // l76
    { 0x00, 0x7C, 0x04, 0x18, 0x04, 0x78 },   // m77
    { 0x00, 0x7C, 0x08, 0x04, 0x04, 0x78 },   // n78
    { 0x00, 0x38, 0x44, 0x44, 0x44, 0x38 },   // o79
    { 0x00, 0xFC, 0x24, 0x24, 0x24, 0x18 },   // p80
    { 0x00, 0x18, 0x24, 0x24, 0x18, 0xFC },   // q81
    { 0x00, 0x7C, 0x08, 0x04, 0x04, 0x08 },   // r82
    { 0x00, 0x48, 0x54, 0x54, 0x54, 0x20 },   // s83
    { 0x00, 0x04, 0x3F, 0x44, 0x40, 0x20 },   // t84
    { 0x00, 0x3C, 0x40, 0x40, 0x20, 0x7C },   // u85
    { 0x00, 0x1C, 0x20, 0x40, 0x20, 0x1C },   // v86
    { 0x00, 0x3C, 0x40, 0x30, 0x40, 0x3C },   // w87
    { 0x00, 0x44, 0x28, 0x10, 0x28, 0x44 },   // x88
    { 0x00, 0x1C, 0xA0, 0xA0, 0xA0, 0x7C },   // y89
    { 0x00, 0x44, 0x64, 0x54, 0x4C, 0x44 },   // z90
    { 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 }    // horiz lines91
};

/*----------------------------------------------------------
 * FunctionName: LED_WrDat
 * Describe: write one byte data to led
 */
void LED_WrDat(u8t ucData)
{
    u8t i = 8;
    LED_DC   = 1;
    LED_SCL  = 0;
    
    while (i--)
    {
        if (ucData & 0x80)
            LED_SDA = 1;
        else
            LED_SDA = 0;
        
        LED_SCL = 1; 
        _asm("nop");
				_asm("nop");
        LED_SCL = 0;    
        ucData <<= 1;    
    }

    return;
}

/*-------------------------------------------------------------
 * FunctionName: LED_WrCmd
 * Describe: write on byte command to LED
 */
void LED_WrCmd(u8t ucCmd)
{
    u8t i = 8;
    LED_DC   = 0;
    LED_SCL  = 0;
    while (i--)
    {
			if (ucCmd & 0x80)
				LED_SDA = 1;
			else
				LED_SDA = 0;
			LED_SCL = 1;
			_asm("nop");
			_asm("nop");
			LED_SCL = 0;    
			ucCmd <<= 1;   
    }  

    return;
}


/*--------------------------------------------------
 * FunctionName: LED_SetPos
 * Describe: set the led display position
 */
void LED_SetPos(u8t ucIdxX, u8t ucIdxY)
{ 
    LED_WrCmd(0xb0 + ucIdxY);
    LED_WrCmd(((ucIdxX & 0xf0) >> 4) | 0x10);
    LED_WrCmd((ucIdxX & 0x0f) | 0x00); 
} 

/*****************************************************************************
 *FunctionName: LED_Fill
*****************************************************************************/
void LED_Fill(u8t ucData)
{
    u8t ucPage,ucColumn;
    
    for(ucPage = 0; ucPage < 8; ucPage++)
    {
        LED_WrCmd(0xb0 + ucPage);  //0xb0+0~7±íê?ò30~7
        LED_WrCmd(0x00);           //0x00+0~16±íê???128áD·?3é16×é??μ??·?ú?3×é?Dμ?μú??áD
        LED_WrCmd(0x10);           //0x10+0~16±íê???128áD·?3é16×é??μ??·?ù?úμú??×é
        for(ucColumn = 0; ucColumn < 128; ucColumn++)
        {
            LED_WrDat(ucData);
        }
    }
} 

void SetStartColumn(u8t ucData)
{
    LED_WrCmd(0x00+ucData % 16);   // Set Lower Column Start Address for Page Addressing Mode
                                   // Default => 0x00
    LED_WrCmd(0x10+ucData / 16);   // Set Higher Column Start Address for Page Addressing Mode
                                   // Default => 0x10
}

void SetAddressingMode(u8t ucData)
{
    LED_WrCmd(0x20);        // Set Memory Addressing Mode
    LED_WrCmd(ucData);      // Default => 0x02
                            // 0x00 => Horizontal Addressing Mode
                            // 0x01 => Vertical Addressing Mode
                            // 0x02 => Page Addressing Mode
}

void SetColumnAddress(u8t a, u8t b)
{
    LED_WrCmd(0x21);        // Set Column Address
    LED_WrCmd(a);           // Default => 0x00 (Column Start Address)
    LED_WrCmd(b);           // Default => 0x7F (Column End Address)
}

void SetPageAddress(u8t a, u8t b)
{
    LED_WrCmd(0x22);        // Set Page Address
    LED_WrCmd(a);           // Default => 0x00 (Page Start Address)
    LED_WrCmd(b);           // Default => 0x07 (Page End Address)
}

void SetStartLine(u8t ucData)
{
    LED_WrCmd(0x40|ucData); // Set Display Start Line
                            // Default => 0x40 (0x00)
}

void SetContrastControl(u8t ucData)
{
    LED_WrCmd(0x81);        // Set Contrast Control
    LED_WrCmd(ucData);      // Default => 0x7F
}

void SetChargePump(u8t ucData)
{
    LED_WrCmd(0x8D);        // Set Charge Pump
    LED_WrCmd(0x10|ucData); // Default => 0x10
                            // 0x10 (0x00) => Disable Charge Pump
                            // 0x14 (0x04) => Enable Charge Pump
}

void SetSegmentRemap(u8t ucData)
{
    LED_WrCmd(0xA0|ucData); // Set Segment Re-Map
                            // Default => 0xA0
                            // 0xA0 (0x00) => Column Address 0 Mapped to SEG0
                            // 0xA1 (0x01) => Column Address 0 Mapped to SEG127
}

void SetEntireDisplay(u8t ucData)
{
    LED_WrCmd(0xA4|ucData); // Set Entire Display On / Off
                            // Default => 0xA4
                            // 0xA4 (0x00) => Normal Display
                            // 0xA5 (0x01) => Entire Display On
}

void SetInverseDisplay(u8t ucData)
{
    LED_WrCmd(0xA6|ucData); // Set Inverse Display On/Off
                            // Default => 0xA6
                            // 0xA6 (0x00) => Normal Display
                            // 0xA7 (0x01) => Inverse Display On
}

void SetMultiplexRatio(u8t ucData)
{
    LED_WrCmd(0xA8);        // Set Multiplex Ratio
    LED_WrCmd(ucData);      // Default => 0x3F (1/64 Duty)
}

void SetDisplayOnOff(u8t ucData)
{
    LED_WrCmd(0xAE|ucData); // Set Display On/Off
                            // Default => 0xAE
                            // 0xAE (0x00) => Display Off
                            // 0xAF (0x01) => Display On
}

void SetStartPage(u8t ucData)
{
    LED_WrCmd(0xB0|ucData); // Set Page Start Address for Page Addressing Mode
                            // Default => 0xB0 (0x00)
}

void SetCommonRemap(u8t ucData)
{
    LED_WrCmd(0xC0|ucData); // Set COM Output Scan Direction
                            // Default => 0xC0
                            // 0xC0 (0x00) => Scan from COM0 to 63
                            // 0xC8 (0x08) => Scan from COM63 to 0
}

void SetDisplayOffset(u8t ucData)
{
    LED_WrCmd(0xD3);        // Set Display Offset
    LED_WrCmd(ucData);      // Default => 0x00
}

void SetDisplayClock(u8t ucData)
{
    LED_WrCmd(0xD5);        // Set Display Clock Divide Ratio / Oscillator Frequency
    LED_WrCmd(ucData);      // Default => 0x80
                            // D[3:0] => Display Clock Divider
                            // D[7:4] => Oscillator Frequency
}

void SetPrechargePeriod(u8t ucData)
{
    LED_WrCmd(0xD9);        // Set Pre-Charge Period
    LED_WrCmd(ucData);      // Default => 0x22 (2 Display Clocks [Phase 2] / 2 Display Clocks [Phase 1])
                            // D[3:0] => Phase 1 Period in 1~15 Display Clocks
                            // D[7:4] => Phase 2 Period in 1~15 Display Clocks
}

void SetCommonConfig(u8t ucData)
{
    LED_WrCmd(0xDA);        // Set COM Pins Hardware Configuration
    LED_WrCmd(0x02|ucData); // Default => 0x12 (0x10)
                            // Alternative COM Pin Configuration
                            // Disable COM Left/Right Re-Map
}

void SetVCOMH(u8t ucData)
{
    LED_WrCmd(0xDB);        // Set VCOMH Deselect Level
    LED_WrCmd(ucData);      // Default => 0x20 (0.77*VCC)
}

void SetNop(void)
{
    LED_WrCmd(0xE3);        // Command for No Operation
}

/*----------------------------------------------------
 * FunctionName: LED_Init
 * Describe: oled initialize
 */
void LED_Init(void)        
{
		u8t i = 10;
    LED_SCL = 1;      
    LED_RST = 0;

		while (i--);
    
    LED_RST = 1;

    SetDisplayOnOff(0x00);     // Display Off (0x00/0x01)
    SetDisplayClock(0x80);     // Set Clock as 100 Frames/Sec
    SetMultiplexRatio(0x3F);   // 1/64 Duty (0x0F~0x3F)
    SetDisplayOffset(0x00);    // Shift Mapping RAM Counter (0x00~0x3F)
    SetStartLine(0x00);        // Set Mapping RAM Display Start Line (0x00~0x3F)
    SetChargePump(0x04);       // Enable Embedded DC/DC Converter (0x00/0x04)
    SetAddressingMode(0x02);   // Set Page Addressing Mode (0x00/0x01/0x02)
    SetSegmentRemap(0x01);     // Set SEG/Column Mapping     0x00×óóò·′?? 0x01?y3￡
    SetCommonRemap(0x08);      // Set COM/Row Scan Direction 0x00é???·′?? 0x08?y3￡
    SetCommonConfig(0x10);     // Set Sequential Configuration (0x00/0x10)
    SetContrastControl(0xCF);  // Set SEG Output Current
    SetPrechargePeriod(0xF1);  // Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
    SetVCOMH(0x40);            // Set VCOM Deselect Level
    SetEntireDisplay(0x00);    // Disable Entire Display On (0x00/0x01)
    SetInverseDisplay(0x00);   // Disable Inverse Display On (0x00/0x01)  
    SetDisplayOnOff(0x01);     // Display On (0x00/0x01)
    LED_Fill(0x00);            // 3?ê????á
    LED_SetPos(0,0);

    return;
} 
 
/*****************************************************************************
 oˉ êy ??  : LED_P6x8Char
 1|?ü?èê?  : ??ê?ò???6x8±ê×?ASCII×?·?
 ê?è?2?êy  : u8t ucIdxX  ??ê?μ?oá×?±ê0~122
             u8t ucIdxY  ò3·??§0??7
             u8t ucData  ??ê?μ?×?·?
 ê?3?2?êy  : NONE
 ·μ ?? ?μ  : NONE
*****************************************************************************/
void LED_P6x8Char(u8t ucIdxX, u8t ucIdxY, u8t ucData)
{
    u8t i, ucDataTmp;     
       
    ucDataTmp = ucData-32;
    if(ucIdxX > 122)
    {
        ucIdxX = 0;
        ucIdxY++;
    }
    
    LED_SetPos(ucIdxX, ucIdxY);
    
    for(i = 0; i < 6; i++)
    {     
        LED_WrDat(F6x8[ucDataTmp][i]);  
    }
}

/*****************************************************************************
 oˉ êy ??  : LED_P6x8Str
 1|?ü?èê?  : D′è?ò?×é6x8±ê×?ASCII×?·?′?
 ê?è?2?êy  : u8t ucIdxX       ??ê?μ?oá×?±ê0~122
             u8t ucIdxY       ò3·??§0??7
             u8t ucDataStr[]  ??ê?μ?×?·?′?
 ê?3?2?êy  : NONE
 ·μ ?? ?μ  : NONE
*****************************************************************************/
void LED_P6x8Str(u8t ucIdxX, u8t ucIdxY, u8t ucDataStr[])
{
    u8t i, j, ucDataTmp; 

    for (j = 0; ucDataStr[j] != '\0'; j++)
    {    
        ucDataTmp = ucDataStr[j] - 32;
        if(ucIdxX > 122)
        {
            ucIdxX = 0;
            ucIdxY++;
        }
        
        LED_SetPos(ucIdxX,ucIdxY); 
        
        for(i = 0; i < 6; i++)
        {     
            LED_WrDat(F6x8[ucDataTmp][i]);  
        }
        ucIdxX += 6;
    }

    return;
}

void LedDisplayChs(void)
{
	LED_Init();
	LED_P6x8Str(4, 1, (u8t *)"   W: ");
	LED_P6x8Str(4, 2, (u8t *)"   V: ");
	LED_P6x8Str(4, 3, (u8t *)"   A: ");
	LED_P6x8Str(4, 4, (u8t *)" KWH: ");
	LED_P6x8Str(4, 5, (u8t *)" KWA: ");
	LED_P6x8Str(4, 6, (u8t *)"FREQ: ");
	LED_P6x8Str(4, 7, (u8t *)"   D: ");
	
	LED_P6x8Str(84, 1, (u8t *)"W");
	LED_P6x8Str(84, 2, (u8t *)"V");
	LED_P6x8Str(84, 3, (u8t *)"A");
	LED_P6x8Str(84, 4, (u8t *)"KWH");
	LED_P6x8Str(84, 5, (u8t *)"KWA");
	LED_P6x8Str(84, 6, (u8t *)"Hz");
	LED_P6x8Str(84, 7, (u8t *)"s");
}
/*-------------------------------------------------------
 * FunctionName: LedDisplay
 * Parameters: 
 * Return: void
 * Describe:
 */
void LedDisplay(u8t dataPostion)
{
	u8t xPostion = 36;
	if (dataPostion == 3 || dataPostion ==4)
	{
		xPostion = 42;
		if (dataReceive2[0] == 0)
			LED_P6x8Char(xPostion, dataPostion, ' ');
		else
			LED_P6x8Char(xPostion, dataPostion, dataReceive2[0] + 48);
			
		if (dataReceive2[0] == 0 && dataReceive2[1] == 0)
			LED_P6x8Char(xPostion + 6, dataPostion, ' ');
		else
			LED_P6x8Char(xPostion + 6, dataPostion, dataReceive2[1] + 48);
			
		LED_P6x8Char(xPostion + 12, dataPostion, dataReceive2[2] + 48);
		LED_P6x8Char(xPostion + 18, dataPostion, '.');
		LED_P6x8Char(xPostion + 24, dataPostion, dataReceive2[3] + 48);
		LED_P6x8Char(xPostion + 30, dataPostion, dataReceive2[4] + 48);
	}
	else
	{
		xPostion = 36;
		if (dataReceive2[0] == 0)
			LED_P6x8Char(xPostion, dataPostion, ' ');
		else
			LED_P6x8Char(xPostion, dataPostion, dataReceive2[0] + 48);
			
		if (dataReceive2[0] == 0 && dataReceive2[1] == 0)
			LED_P6x8Char(xPostion + 6, dataPostion, ' ');
		else
			LED_P6x8Char(xPostion + 6, dataPostion, dataReceive2[1] + 48);
			
		if (dataReceive2[0] == 0 && dataReceive2[1] == 0 && dataReceive2[2] == 0)
			LED_P6x8Char(xPostion + 12, dataPostion, ' ');
		else
			LED_P6x8Char(xPostion + 12, dataPostion, dataReceive2[2] + 48);
			
	
		LED_P6x8Char(xPostion + 18, dataPostion, dataReceive2[3] + 48);
		LED_P6x8Char(xPostion + 24, dataPostion, '.');
		LED_P6x8Char(xPostion + 30, dataPostion, dataReceive2[4] + 48);
	}
}

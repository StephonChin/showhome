/*--------------------------------
*author:chenyk
*data:2015.5.4
*ver:ver1
--------------------------------*/
#include "stm8s.h"
#include "spi.h"

/********************************
*函数名:spi_config
*功能:
*输入参数:
*输出参数:
*********************************/
void spi_config(void)
{
	SPI_DeInit();
  SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_256, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_SOFT, 0x00);
	//SPI_ITConfig(SPI_IT_RXNE, ENABLE);
	SPI_Cmd(ENABLE);
}
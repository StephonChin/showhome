#ifndef UART_WITH_ZWAVE_H
#define UART_WITH_ZWAVE_H

#include "system_config.h"
#include "string.h"

#define flagUartTransmit   (UART1_SR & 0xC0)

#define uartDataRegistor   UART1_DR

void RespondStr(u8t *pStr);
void DataGet(void);

extern FlagStatus flagCmdStart;
extern FlagStatus flagCmdEnd;

extern u8t dataReceive2[5];

#endif  
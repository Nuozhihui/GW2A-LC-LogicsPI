#ifndef __USART_H
#define __USART_H

#include "gd32f30x.h"
#include "systick.h"

#define RX_LEN 100	//�������ݳ���

extern uint8_t rx_buf[RX_LEN];
extern uint8_t rx_flag;

void Init_Usart0(uint32_t baud);

#endif


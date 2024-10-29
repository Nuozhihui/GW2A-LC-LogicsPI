#include "usart.h"
#include "stdio.h"

uint8_t rx_buf[RX_LEN] = {0};
uint8_t rx_cnt = 0;
uint8_t rx_flag = 0;

/*
*		函数内容：串口0初始化函数
*		函数参数：uint32_t baud---波特率
*		返回值：	无
*/
void Init_Usart0(uint32_t baud)
{
	rcu_periph_clock_enable(RCU_USART0);	//使能串口0时钟
	rcu_periph_clock_enable(RCU_GPIOA);
	gpio_init(GPIOA, GPIO_MODE_AF_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_9);
	gpio_init(GPIOA, GPIO_MODE_IN_FLOATING, GPIO_OSPEED_50MHZ, GPIO_PIN_10);
	usart_deinit(USART0);
	usart_baudrate_set(USART0,baud);
	usart_receive_config(USART0,USART_RECEIVE_ENABLE);	//串口0接收使能
	usart_transmit_config(USART0,USART_TRANSMIT_ENABLE);
	usart_enable(USART0);
	usart_interrupt_enable(USART0, USART_INT_RBNE);	//使能接收数据中断
	usart_interrupt_enable(USART0, USART_INT_IDLE);	//使能空闲中断
}

/*
*		函数内容：串口0中断服务函数
*		函数参数：无
*		返回值：	无
*/
void USART0_IRQHandler(void)
{
	if(RESET != usart_interrupt_flag_get(USART0, USART_INT_FLAG_RBNE))	//如果是接收数据中断
	{
		if(rx_cnt < RX_LEN)		//如果接收数据长度小于最大值
		{
			rx_buf[rx_cnt] = USART_DATA(USART0)&0x1ff;	//读数据
			rx_cnt++;
		}
		usart_interrupt_flag_clear(USART0, USART_INT_FLAG_RBNE);		//清除中断标志位	
	}else if(RESET != usart_interrupt_flag_get(USART0, USART_INT_FLAG_IDLE))	//如果是空闲中断，代表接收完成
	{
		rx_flag = 1;
		rx_buf[rx_cnt] = '\0';	//加入结束符
		rx_cnt = 0;
		USART_DATA(USART0);
		usart_interrupt_flag_clear(USART0, USART_INT_FLAG_IDLE);		//清除中断标志位	
	}
}

/*
*		函数内容：重定向c语言发送函数
*		函数参数：int ch, FILE *f--固定样式
*		返回值：	int--固定样式
*/
int fputc(int ch, FILE *f)
{
	  usart_data_transmit(USART0, (uint8_t)ch);
    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
    return ch;
}



#include "usart.h"
#include "stdio.h"

uint8_t rx_buf[RX_LEN] = {0};
uint8_t rx_cnt = 0;
uint8_t rx_flag = 0;

/*
*		�������ݣ�����0��ʼ������
*		����������uint32_t baud---������
*		����ֵ��	��
*/
void Init_Usart0(uint32_t baud)
{
	rcu_periph_clock_enable(RCU_USART0);	//ʹ�ܴ���0ʱ��
	rcu_periph_clock_enable(RCU_GPIOA);
	gpio_init(GPIOA, GPIO_MODE_AF_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_9);
	gpio_init(GPIOA, GPIO_MODE_IN_FLOATING, GPIO_OSPEED_50MHZ, GPIO_PIN_10);
	usart_deinit(USART0);
	usart_baudrate_set(USART0,baud);
	usart_receive_config(USART0,USART_RECEIVE_ENABLE);	//����0����ʹ��
	usart_transmit_config(USART0,USART_TRANSMIT_ENABLE);
	usart_enable(USART0);
	usart_interrupt_enable(USART0, USART_INT_RBNE);	//ʹ�ܽ��������ж�
	usart_interrupt_enable(USART0, USART_INT_IDLE);	//ʹ�ܿ����ж�
}

/*
*		�������ݣ�����0�жϷ�����
*		������������
*		����ֵ��	��
*/
void USART0_IRQHandler(void)
{
	if(RESET != usart_interrupt_flag_get(USART0, USART_INT_FLAG_RBNE))	//����ǽ��������ж�
	{
		if(rx_cnt < RX_LEN)		//����������ݳ���С�����ֵ
		{
			rx_buf[rx_cnt] = USART_DATA(USART0)&0x1ff;	//������
			rx_cnt++;
		}
		usart_interrupt_flag_clear(USART0, USART_INT_FLAG_RBNE);		//����жϱ�־λ	
	}else if(RESET != usart_interrupt_flag_get(USART0, USART_INT_FLAG_IDLE))	//����ǿ����жϣ�����������
	{
		rx_flag = 1;
		rx_buf[rx_cnt] = '\0';	//���������
		rx_cnt = 0;
		USART_DATA(USART0);
		usart_interrupt_flag_clear(USART0, USART_INT_FLAG_IDLE);		//����жϱ�־λ	
	}
}

/*
*		�������ݣ��ض���c���Է��ͺ���
*		����������int ch, FILE *f--�̶���ʽ
*		����ֵ��	int--�̶���ʽ
*/
int fputc(int ch, FILE *f)
{
	  usart_data_transmit(USART0, (uint8_t)ch);
    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
    return ch;
}



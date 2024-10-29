#include "led.h"

/*
*		�������ݣ���ʼ��LED GPIO����
*		������������
*		����ֵ��	��
*/
void Init_LED_GPIO(void)
{
	rcu_periph_clock_enable(RCU_GPIOB);
	gpio_init(GPIOB, GPIO_MODE_OUT_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_6|GPIO_PIN_7|GPIO_PIN_8);
	gpio_bit_write(GPIOB, GPIO_PIN_6,SET);
	gpio_bit_write(GPIOB, GPIO_PIN_7,SET);
	gpio_bit_write(GPIOB, GPIO_PIN_8,SET);
}

/*
*		�������ݣ��򿪰���LED��
*		����������
							uint8_t value---Ϊ1ʱ�򿪺��
													----Ϊ2ʱ���̵�
*		����ֵ��	��
*/
void Open_LED(enum LED_E value)
{
	switch(value)
	{
		case Red:
				gpio_bit_write(GPIOB, GPIO_PIN_7,RESET);
			break;
		case Green:
				gpio_bit_write(GPIOB, GPIO_PIN_6,RESET);
			break;
		case Blue:
				gpio_bit_write(GPIOB, GPIO_PIN_8,RESET);
			break;
		default:
			break;
	}
}

/*
*		�������ݣ��رհ���LED��
*		����������
							uint8_t value---Ϊ1ʱ�رպ��
													----Ϊ2ʱ�ر��̵�
*		����ֵ��	��
*/
void Close_LED(enum LED_E value)
{
	switch(value)
	{
		case Red:
				gpio_bit_write(GPIOB, GPIO_PIN_7,SET);
			break;
		case Green:
				gpio_bit_write(GPIOB, GPIO_PIN_6,SET);
			break;
		case Blue:
				gpio_bit_write(GPIOB, GPIO_PIN_8,SET);
			break;
		default:
			break;
	}
}


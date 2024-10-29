#include "led.h"

/*
*		函数内容：初始化LED GPIO引脚
*		函数参数：无
*		返回值：	无
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
*		函数内容：打开板载LED灯
*		函数参数：
							uint8_t value---为1时打开红灯
													----为2时打开绿灯
*		返回值：	无
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
*		函数内容：关闭板载LED灯
*		函数参数：
							uint8_t value---为1时关闭红灯
													----为2时关闭绿灯
*		返回值：	无
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


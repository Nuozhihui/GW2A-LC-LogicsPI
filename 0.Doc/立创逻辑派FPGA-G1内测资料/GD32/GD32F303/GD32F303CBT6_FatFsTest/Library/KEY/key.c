#include "key.h"

/*
*		函数内容：初始化按键GPIO-PA8
*		函数参数：无
*		返回值：	无
*/
void Init_KEY_GPIO(void)
{
	rcu_periph_clock_enable(RCU_GPIOA);
	gpio_init(GPIOA, GPIO_MODE_IPU, GPIO_OSPEED_50MHZ, GPIO_PIN_8);
}

/*
*		函数内容：扫描按键，使用状态机的方式
*		函数参数：uint8_t *value--按键值
*		返回值：	无
*/
void KEY_Scanf(uint16_t *value)
{
	static uint16_t num = 0;								//消抖延时计数
	static uint16_t longpresscnt = 0;				//长按延时计数
	static uint16_t state = KEY_NO_PRESS;		//按键状态
	static uint16_t keyvalue = KEY_NO_PRESS;						//按键值
	delay_1ms(1);														//延时1ms
	num = num + 1;													//延时变量自增
	longpresscnt = longpresscnt + 1;				//长按延时自增
	if(longpresscnt > 65530){								//防止溢出
		longpresscnt = 0;	
	}
	if(num < 10){														//如果没有10ms，直接返回
		return ;															
	}
	num = 0;																//10ms一到，清除变量
	switch(state)
	{
		case KEY_NO_PRESS:										//默认是按键未按下的状态
				if(gpio_input_bit_get(GPIOA,GPIO_PIN_8) == RESET)	//如果此时有按键按下
				{
					state = KEY_DITHERING;					//设置状态为消抖状态
				}
			break;
		case KEY_DITHERING:										//按键状态为消抖状态
				if(gpio_input_bit_get(GPIOA,GPIO_PIN_8) == RESET)	//如果此时按键仍然是按下的
				{
					keyvalue = KEY_SHORT_PRESS; 		//按键是短按
					state = KEY_STABILIZE;					//状态为稳定状态
					longpresscnt = 0;												
				}
				else															//是扰动，重新回到未按下的状态
				{
					state = KEY_NO_PRESS;
				}
			break;
		case KEY_STABILIZE:										//稳定状态
				if(gpio_input_bit_get(GPIOA,GPIO_PIN_8) == RESET)	//如果一直是按下的状态
				{
					if(longpresscnt > 1500)					//超过1.5s
					{
						keyvalue = KEY_LONG_PRESS;		//按键是长按
						longpresscnt = 0;							//清除计时变量
					}
				}
				else															//如果是高电平，此时证明已经送上
				{
					state = KEY_CPLT;								//状态为完成状态
				}
			break;
		case KEY_CPLT:												//完成状态
			if(gpio_input_bit_get(GPIOA,GPIO_PIN_8) == SET)	//如果确实是高电平
			{
				*value = keyvalue;								//对按键值进行赋值
				state = KEY_NO_PRESS;							//重新回到未按下状态
				keyvalue = KEY_NO_PRESS;											//清除按键值
			}
			else																//如果还是低电平，证明是稳定状态下的扰动
			{
				state = KEY_STABILIZE;
			}
			break;
	}
}

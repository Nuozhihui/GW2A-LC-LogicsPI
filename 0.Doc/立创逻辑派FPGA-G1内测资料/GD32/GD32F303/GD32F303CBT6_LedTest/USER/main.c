#include "gd32f30x.h"
#include "stdio.h"
#include "systick.h"
#include "led.h"
int main(void)
{
	//系统时钟初始化
	systick_config();

	//初始化LED
	Init_LED_GPIO();
	
	while(1)
	{
		Open_LED(Red);Close_LED(Green);Close_LED(Blue);
		delay_1ms(1000);
		Open_LED(Green);Close_LED(Red);Close_LED(Blue);
		delay_1ms(1000);
		Open_LED(Blue);Close_LED(Red);Close_LED(Green);
		delay_1ms(1000);
	}
}

#include "gd32f30x.h"
#include "stdio.h"
#include "systick.h"
#include "led.h"
#include "key.h"

int main(void)
{
	uint8_t keyvalue = 0;
	//系统时钟初始化
	systick_config();

	//初始化LED
	Init_LED_GPIO();
	
	//初始化按键
	Init_KEY_GPIO();
	while(1)
	{
		KEY_Scanf(&keyvalue);	//按键扫描函数
		if(keyvalue == KEY_SHORT_PRESS){	//如果按键SW1是短按
			Open_LED(Red);Close_LED(Green);Close_LED(Blue);	//只打开红灯
		}else if(keyvalue == KEY_LONG_PRESS){	//如果按键SW1是长按
			Open_LED(Green);Close_LED(Red);Close_LED(Blue);	//只打开绿灯
		}
	}
}

#include "gd32f30x.h"
#include "stdio.h"
#include "systick.h"
#include "led.h"
#include "key.h"
#include "usart.h"
#include "lcd_init.h"
#include "lcd.h"

// 定义三色灯引脚
#define LED_PIN_R GPIO_PIN_7  // B7 (Red)
#define LED_PIN_G GPIO_PIN_6  // B6 (Green)
#define LED_PIN_B GPIO_PIN_8  // B8 (Blue)


void delay_ms(uint32_t ms) {
    uint32_t i, j;
    for (i = 0; i < ms; i++) {
        for (j = 0; j < 6000; j++); // 简单的延时
    }
}

uint16_t colors[] = {LIGHTGREEN, BLUE, YELLOW, MAGENTA, WHITE};
int i=0;
int main(void)
{	
	//系统时钟初始化
	systick_config();

	//中断优先级设置
	nvic_irq_enable(USART0_IRQn, 0, 0);
	
//	//初始化LED
	Init_LED_GPIO();
//	
//	//初始化按键
//	Init_KEY_GPIO();
	
	//初始化串口0
//	Init_Usart0(115200);
	
	//LCD初始化
	Lcd_Init();
	
	TFT_Fill(0,0,240,320,LIGHTGREEN);
	while(1)
	{
		TFT_Fill(0,0,240,320,colors[i]);
		if(i>=4)
		{
			i=0;
			
		}else{
			i++;
		}
		TFT_ShowString(0,0,"Logic pie LCD test",RED,WHITE,24,0);
		TFT_ShowString(24,30,"LCD_W:",RED,WHITE,16,0);
		TFT_ShowIntNum(72,30,240,3,RED,WHITE,16);
		TFT_ShowString(24,50,"LCD_H:",RED,WHITE,16,0);
		TFT_ShowIntNum(72,50,320,3,RED,WHITE,16);
		TFT_ShowFloatNum1(20,80,3.14,4,RED,WHITE,16);
		
		// 点亮红色LED
		gpio_bit_set(GPIOB, LED_PIN_R);
		delay_ms(500);
		gpio_bit_reset(GPIOB, LED_PIN_R);

		// 点亮绿色LED
		gpio_bit_set(GPIOB, LED_PIN_G);
		delay_ms(500);
		gpio_bit_reset(GPIOB, LED_PIN_G);

		// 点亮蓝色LED
		gpio_bit_set(GPIOB, LED_PIN_B);
		delay_ms(500);
		gpio_bit_reset(GPIOB, LED_PIN_B);
				
	}
}

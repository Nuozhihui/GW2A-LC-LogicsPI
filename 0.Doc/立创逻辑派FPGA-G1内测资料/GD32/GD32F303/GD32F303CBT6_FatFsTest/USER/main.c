#include "gd32f30x.h"
#include "stdio.h"
#include "systick.h"
#include "led.h"
#include "key.h"
#include "usart.h"
#include "lcd_init.h"
#include "lcd.h"
#include "sdcard.h"
#include "ff.h"

FATFS fs;					   						/* FatFs文件系统对象 */
FIL fnew;					   						/* 文件对象 */
FRESULT res_sd;      						/* 文件操作结果 */
UINT fnum;            		   		/* 文件成功读写数量 */
BYTE ReadBuffer[256]={0};     	/* 读缓冲区 */
BYTE WriteBuffer[] = "JLC-EDA"; /* 写缓冲区*/

int main(void)
{
	uint16_t keyvalue = KEY_NO_PRESS;
	
	//系统时钟初始化
	systick_config();

	//中断优先级设置
	nvic_irq_enable(USART0_IRQn, 0, 0);
	
	//初始化LED
	Init_LED_GPIO();
	
	//初始化按键
	Init_KEY_GPIO();
	
	//初始化串口0
	Init_Usart0(115200);
	
	//LCD初始化
	Lcd_Init();
	TFT_Fill(0,0,240,320,WHITE);
	
	//在外部SPI Flash挂载文件系统，文件系统挂载时会对SPI设备初始化
	res_sd = f_mount(&fs,"0:",1);
	
	/* 如果没有文件系统就格式化创建创建文件系统 */
	if(res_sd == FR_NO_FILESYSTEM)
	{
		/* 格式化 */
		res_sd=f_mkfs("0:",0,0);
		if(res_sd == FR_OK)
		{
			/* 格式化后，先取消挂载 */
			res_sd = f_mount(NULL,"0:",1);	
			/* 重新挂载	*/			
			res_sd = f_mount(&fs,"0:",1);
		}
		else
		{
			TFT_ShowString(0,0,(uint8_t *)"f_mkfs fail",RED,WHITE,24,0);
		}
	}
	else if(res_sd!=FR_OK)
  {
		TFT_ShowString(0,0,(uint8_t *)"f_mount fail",RED,WHITE,24,0);
	}
	else
	{
		TFT_ShowString(0,0,(uint8_t *)"f_mount sucessed",RED,WHITE,24,0);
	}
	while(1)
	{
		//扫描按键
		KEY_Scanf(&keyvalue);
		
		//如果按键短按
		if(keyvalue == KEY_SHORT_PRESS){
			keyvalue = KEY_NO_PRESS;
			//打开文件，如果文件不存在则创建它
			//注意：Fatfs如果使用中文支持的话，占用内存较多，这里需要移除中文支持。
			//https://blog.csdn.net/Mark_md/article/details/108386706
			res_sd = f_open(&fnew, "0:abc.txt",FA_CREATE_ALWAYS | FA_WRITE );	//创建一个新文件，如果文件以存在，则截断并覆盖
			if ( res_sd == FR_OK )
			{
				// 将指定存储区内容写入到文件内 
        res_sd=f_write(&fnew,WriteBuffer,sizeof(WriteBuffer),&fnum);
				if(res_sd==FR_OK)
				{
					TFT_ShowString(0,48,(uint8_t *)"txt write sucessed",RED,WHITE,24,0);
				}
				else
				{
					TFT_ShowString(0,48,(uint8_t *)"txt write fail",RED,WHITE,24,0);
				}
				//关闭文件
				f_close(&fnew);
			}
			else
			{
				TFT_ShowString(0,24,(uint8_t *)"open/create txt fail",RED,WHITE,24,0);
			}
		}
		if(keyvalue == KEY_LONG_PRESS)	//如果按键长按
		{
			keyvalue = KEY_NO_PRESS;
			res_sd = f_open(&fnew, "0:abc.txt", FA_OPEN_EXISTING | FA_READ); 	//打开文件，如果文件不存在则打开失败
			if(res_sd == FR_OK)
			{
				res_sd = f_read(&fnew, ReadBuffer, sizeof(ReadBuffer), &fnum);	//读文件内容
				if(res_sd==FR_OK)
				{
					TFT_Fill(0,0,240,320,WHITE);
					TFT_ShowString(0,48,(uint8_t *)ReadBuffer,RED,WHITE,24,0);
				}
				else
				{
					TFT_ShowString(0,48,(uint8_t *)"txt read fail",RED,WHITE,24,0);
				}
			}		
			else
			{
				TFT_ShowString(0,24,(uint8_t *)"open/create txt fail",RED,WHITE,24,0);
			}
			//不再读写，关闭文件
			f_close(&fnew);	
			//不再使用文件系统，取消挂载文件系统
			//f_mount(NULL,"0:",1);
		}
	}
}

#include "gd32f30x.h"
#include "stdio.h"
#include "systick.h"
#include "led.h"
#include "key.h"
#include "usart.h"
#include "lcd_init.h"
#include "lcd.h"
#include "sdcard.h"

//块大小
#define BLOCK_SIZE            512

//块数据
uint8_t Buffer_Block_Tx[BLOCK_SIZE],Buffer_Block_Rx[BLOCK_SIZE];
	
/*
	函数内容：往指定数据区域填充指定内容
	函数参数：uint8_t *pBuffer---------数据指针
						uint32_t BufferLength----数据长度
						uint32_t Offset----------偏移量
	返回值：
*/
void Fill_Buffer(uint8_t *pBuffer, uint32_t BufferLength, uint32_t Offset)
{
  uint16_t index = 0;

  /* Put in global buffer same values */
  for (index = 0; index < BufferLength; index++)
  {
    pBuffer[index] = index + Offset;
  }
}

/*
	函数内容：比较两个数据区域的内容
	函数参数：uint8_t* pBuffer1---------数据1指针
						uint8_t* pBuffer2---------数据2指针
						uint32_t BufferLength-----数据长度
	返回值：
*/
uint8_t Buffercmp(uint8_t* pBuffer1, uint8_t* pBuffer2, uint32_t BufferLength)
{
  while (BufferLength--)
  {
    if (*pBuffer1 != *pBuffer2)
    {
      return 0;
    }

    pBuffer1++;
    pBuffer2++;
  }

  return 1;
}


int main(void)
{
	uint8_t err_str = 0;
	SD_Error Status = SD_RESPONSE_NO_ERROR;
	uint8_t keyvalue = KEY_NO_PRESS;
	
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
	
	//SD卡初始化
	Status = SD_Init();
	if(Status != SD_RESPONSE_NO_ERROR){
		TFT_ShowString(0,0,(uint8_t *)"SD Init Error",RED,WHITE,24,0);
	}else
	{
		TFT_ShowString(0,0,(uint8_t *)"SD Init Success",RED,WHITE,24,0);
	}
	while(1)
	{
		//扫描按键
		KEY_Scanf(&keyvalue);
		
		//如果按键短按
		if(keyvalue == KEY_SHORT_PRESS){
			keyvalue = KEY_NO_PRESS;
			Fill_Buffer(Buffer_Block_Tx,BLOCK_SIZE,0x1000);	//填充数据
			if (Status == SD_RESPONSE_NO_ERROR)
			{
				Status = SD_WriteBlock(Buffer_Block_Tx, 0x00, BLOCK_SIZE);	//写入数据
				TFT_ShowString(0,24,(uint8_t *)"SD Write Success",RED,WHITE,24,0);
			}
		}
		if(keyvalue == KEY_LONG_PRESS)	//如果按键长按
		{
			keyvalue = KEY_NO_PRESS;
			Status = SD_ReadBlock(Buffer_Block_Rx, 0x00, BLOCK_SIZE);	//读数据
			if(Status == SD_RESPONSE_NO_ERROR)
			{
				err_str = Buffercmp(Buffer_Block_Tx,Buffer_Block_Rx,BLOCK_SIZE);	//比较数据
				if(err_str == 1)
				{
					TFT_ShowString(0,48,(uint8_t *)"Data Compare Success",RED,WHITE,24,0);
				}
				else
				{
					TFT_ShowString(0,48,(uint8_t *)"Data Compare Fail",RED,WHITE,24,0);
				}
			}
		}
	}
}

#include "gd32f30x.h"
#include "stdio.h"
#include "systick.h"
#include "led.h"
#include "key.h"
#include "usart.h"
#include "lcd_init.h"
#include "lcd.h"
#include "sdcard.h"

//���С
#define BLOCK_SIZE            512

//������
uint8_t Buffer_Block_Tx[BLOCK_SIZE],Buffer_Block_Rx[BLOCK_SIZE];
	
/*
	�������ݣ���ָ�������������ָ������
	����������uint8_t *pBuffer---------����ָ��
						uint32_t BufferLength----���ݳ���
						uint32_t Offset----------ƫ����
	����ֵ��
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
	�������ݣ��Ƚ������������������
	����������uint8_t* pBuffer1---------����1ָ��
						uint8_t* pBuffer2---------����2ָ��
						uint32_t BufferLength-----���ݳ���
	����ֵ��
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
	
	//ϵͳʱ�ӳ�ʼ��
	systick_config();

	//�ж����ȼ�����
	nvic_irq_enable(USART0_IRQn, 0, 0);
	
	//��ʼ��LED
	Init_LED_GPIO();
	
	//��ʼ������
	Init_KEY_GPIO();
	
	//��ʼ������0
	Init_Usart0(115200);
	
	//LCD��ʼ��
	Lcd_Init();
	TFT_Fill(0,0,240,320,WHITE);
	
	//SD����ʼ��
	Status = SD_Init();
	if(Status != SD_RESPONSE_NO_ERROR){
		TFT_ShowString(0,0,(uint8_t *)"SD Init Error",RED,WHITE,24,0);
	}else
	{
		TFT_ShowString(0,0,(uint8_t *)"SD Init Success",RED,WHITE,24,0);
	}
	while(1)
	{
		//ɨ�谴��
		KEY_Scanf(&keyvalue);
		
		//��������̰�
		if(keyvalue == KEY_SHORT_PRESS){
			keyvalue = KEY_NO_PRESS;
			Fill_Buffer(Buffer_Block_Tx,BLOCK_SIZE,0x1000);	//�������
			if (Status == SD_RESPONSE_NO_ERROR)
			{
				Status = SD_WriteBlock(Buffer_Block_Tx, 0x00, BLOCK_SIZE);	//д������
				TFT_ShowString(0,24,(uint8_t *)"SD Write Success",RED,WHITE,24,0);
			}
		}
		if(keyvalue == KEY_LONG_PRESS)	//�����������
		{
			keyvalue = KEY_NO_PRESS;
			Status = SD_ReadBlock(Buffer_Block_Rx, 0x00, BLOCK_SIZE);	//������
			if(Status == SD_RESPONSE_NO_ERROR)
			{
				err_str = Buffercmp(Buffer_Block_Tx,Buffer_Block_Rx,BLOCK_SIZE);	//�Ƚ�����
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

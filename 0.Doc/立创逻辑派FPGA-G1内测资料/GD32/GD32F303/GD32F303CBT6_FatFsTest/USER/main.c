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

FATFS fs;					   						/* FatFs�ļ�ϵͳ���� */
FIL fnew;					   						/* �ļ����� */
FRESULT res_sd;      						/* �ļ�������� */
UINT fnum;            		   		/* �ļ��ɹ���д���� */
BYTE ReadBuffer[256]={0};     	/* �������� */
BYTE WriteBuffer[] = "JLC-EDA"; /* д������*/

int main(void)
{
	uint16_t keyvalue = KEY_NO_PRESS;
	
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
	
	//���ⲿSPI Flash�����ļ�ϵͳ���ļ�ϵͳ����ʱ���SPI�豸��ʼ��
	res_sd = f_mount(&fs,"0:",1);
	
	/* ���û���ļ�ϵͳ�͸�ʽ�����������ļ�ϵͳ */
	if(res_sd == FR_NO_FILESYSTEM)
	{
		/* ��ʽ�� */
		res_sd=f_mkfs("0:",0,0);
		if(res_sd == FR_OK)
		{
			/* ��ʽ������ȡ������ */
			res_sd = f_mount(NULL,"0:",1);	
			/* ���¹���	*/			
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
		//ɨ�谴��
		KEY_Scanf(&keyvalue);
		
		//��������̰�
		if(keyvalue == KEY_SHORT_PRESS){
			keyvalue = KEY_NO_PRESS;
			//���ļ�������ļ��������򴴽���
			//ע�⣺Fatfs���ʹ������֧�ֵĻ���ռ���ڴ�϶࣬������Ҫ�Ƴ�����֧�֡�
			//https://blog.csdn.net/Mark_md/article/details/108386706
			res_sd = f_open(&fnew, "0:abc.txt",FA_CREATE_ALWAYS | FA_WRITE );	//����һ�����ļ�������ļ��Դ��ڣ���ضϲ�����
			if ( res_sd == FR_OK )
			{
				// ��ָ���洢������д�뵽�ļ��� 
        res_sd=f_write(&fnew,WriteBuffer,sizeof(WriteBuffer),&fnum);
				if(res_sd==FR_OK)
				{
					TFT_ShowString(0,48,(uint8_t *)"txt write sucessed",RED,WHITE,24,0);
				}
				else
				{
					TFT_ShowString(0,48,(uint8_t *)"txt write fail",RED,WHITE,24,0);
				}
				//�ر��ļ�
				f_close(&fnew);
			}
			else
			{
				TFT_ShowString(0,24,(uint8_t *)"open/create txt fail",RED,WHITE,24,0);
			}
		}
		if(keyvalue == KEY_LONG_PRESS)	//�����������
		{
			keyvalue = KEY_NO_PRESS;
			res_sd = f_open(&fnew, "0:abc.txt", FA_OPEN_EXISTING | FA_READ); 	//���ļ�������ļ����������ʧ��
			if(res_sd == FR_OK)
			{
				res_sd = f_read(&fnew, ReadBuffer, sizeof(ReadBuffer), &fnum);	//���ļ�����
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
			//���ٶ�д���ر��ļ�
			f_close(&fnew);	
			//����ʹ���ļ�ϵͳ��ȡ�������ļ�ϵͳ
			//f_mount(NULL,"0:",1);
		}
	}
}

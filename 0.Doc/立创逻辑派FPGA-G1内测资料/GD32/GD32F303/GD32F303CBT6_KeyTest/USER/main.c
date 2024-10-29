#include "gd32f30x.h"
#include "stdio.h"
#include "systick.h"
#include "led.h"
#include "key.h"

int main(void)
{
	uint8_t keyvalue = 0;
	//ϵͳʱ�ӳ�ʼ��
	systick_config();

	//��ʼ��LED
	Init_LED_GPIO();
	
	//��ʼ������
	Init_KEY_GPIO();
	while(1)
	{
		KEY_Scanf(&keyvalue);	//����ɨ�躯��
		if(keyvalue == KEY_SHORT_PRESS){	//�������SW1�Ƕ̰�
			Open_LED(Red);Close_LED(Green);Close_LED(Blue);	//ֻ�򿪺��
		}else if(keyvalue == KEY_LONG_PRESS){	//�������SW1�ǳ���
			Open_LED(Green);Close_LED(Red);Close_LED(Blue);	//ֻ���̵�
		}
	}
}

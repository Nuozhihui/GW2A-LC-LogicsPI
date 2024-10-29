#include "key.h"

/*
*		�������ݣ���ʼ������GPIO-PA8
*		������������
*		����ֵ��	��
*/
void Init_KEY_GPIO(void)
{
	rcu_periph_clock_enable(RCU_GPIOA);
	gpio_init(GPIOA, GPIO_MODE_IPU, GPIO_OSPEED_50MHZ, GPIO_PIN_8);
}

/*
*		�������ݣ�ɨ�谴����ʹ��״̬���ķ�ʽ
*		����������uint8_t *value--����ֵ
*		����ֵ��	��
*/
void KEY_Scanf(uint16_t *value)
{
	static uint16_t num = 0;								//������ʱ����
	static uint16_t longpresscnt = 0;				//������ʱ����
	static uint16_t state = KEY_NO_PRESS;		//����״̬
	static uint16_t keyvalue = KEY_NO_PRESS;						//����ֵ
	delay_1ms(1);														//��ʱ1ms
	num = num + 1;													//��ʱ��������
	longpresscnt = longpresscnt + 1;				//������ʱ����
	if(longpresscnt > 65530){								//��ֹ���
		longpresscnt = 0;	
	}
	if(num < 10){														//���û��10ms��ֱ�ӷ���
		return ;															
	}
	num = 0;																//10msһ�����������
	switch(state)
	{
		case KEY_NO_PRESS:										//Ĭ���ǰ���δ���µ�״̬
				if(gpio_input_bit_get(GPIOA,GPIO_PIN_8) == RESET)	//�����ʱ�а�������
				{
					state = KEY_DITHERING;					//����״̬Ϊ����״̬
				}
			break;
		case KEY_DITHERING:										//����״̬Ϊ����״̬
				if(gpio_input_bit_get(GPIOA,GPIO_PIN_8) == RESET)	//�����ʱ������Ȼ�ǰ��µ�
				{
					keyvalue = KEY_SHORT_PRESS; 		//�����Ƕ̰�
					state = KEY_STABILIZE;					//״̬Ϊ�ȶ�״̬
					longpresscnt = 0;												
				}
				else															//���Ŷ������»ص�δ���µ�״̬
				{
					state = KEY_NO_PRESS;
				}
			break;
		case KEY_STABILIZE:										//�ȶ�״̬
				if(gpio_input_bit_get(GPIOA,GPIO_PIN_8) == RESET)	//���һֱ�ǰ��µ�״̬
				{
					if(longpresscnt > 1500)					//����1.5s
					{
						keyvalue = KEY_LONG_PRESS;		//�����ǳ���
						longpresscnt = 0;							//�����ʱ����
					}
				}
				else															//����Ǹߵ�ƽ����ʱ֤���Ѿ�����
				{
					state = KEY_CPLT;								//״̬Ϊ���״̬
				}
			break;
		case KEY_CPLT:												//���״̬
			if(gpio_input_bit_get(GPIOA,GPIO_PIN_8) == SET)	//���ȷʵ�Ǹߵ�ƽ
			{
				*value = keyvalue;								//�԰���ֵ���и�ֵ
				state = KEY_NO_PRESS;							//���»ص�δ����״̬
				keyvalue = KEY_NO_PRESS;											//�������ֵ
			}
			else																//������ǵ͵�ƽ��֤�����ȶ�״̬�µ��Ŷ�
			{
				state = KEY_STABILIZE;
			}
			break;
	}
}

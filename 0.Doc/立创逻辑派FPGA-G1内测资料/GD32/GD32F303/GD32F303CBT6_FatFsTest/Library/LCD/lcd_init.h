#ifndef __LCD_INIT_H
#define __LCD_INIT_H

#include "gd32f30x.h"

#define LCD_WIDTH  240
#define LCD_HEIGHT 320   //������Ļ��Ӧ�޸ķֱ��� 

//ɨ�跽����
#define L2R_U2D  0 //������,���ϵ���
#define L2R_D2U  1 //������,���µ���
#define R2L_U2D  2 //���ҵ���,���ϵ���
#define R2L_D2U  3 //���ҵ���,���µ���

#define U2D_L2R  4 //���ϵ���,������
#define U2D_R2L  5 //���ϵ���,���ҵ���
#define D2U_L2R  6 //���µ���,������
#define D2U_R2L  7 //���µ���,���ҵ���

//�������л�
#define Landscape  0 //1:����ʾ  0������ʾ  PS:��������FPC�ĳ��߷�������  

	
//LCD��Ҫ������
typedef struct  
{										    
	uint16_t 	width;			//LCD ���
	uint16_t 	height;			//LCD �߶�
	uint16_t 	id;				  //LCD ID
	uint8_t  	dir;			  //���������������ƣ�0��������1��������	
	uint8_t		wramcmd;		//��ʼдgramָ��
	uint8_t  	setxcmd;		//����x����ָ��
	uint8_t  	setycmd;		//����y����ָ��	 
}_lcd_dev; 

extern _lcd_dev lcddev;

void LCD_WR_REG(uint8_t regval);
void LCD_WR_DATA8(uint8_t data);
void LCD_WR_DATA16(uint16_t data);
void Lcd_Address_Set(uint16_t x1,uint16_t y1,uint16_t x2,uint16_t y2);
void Lcd_Init(void);
#endif


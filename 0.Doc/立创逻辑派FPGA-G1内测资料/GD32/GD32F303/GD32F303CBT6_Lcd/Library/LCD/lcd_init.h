#ifndef __LCD_INIT_H
#define __LCD_INIT_H

#include "gd32f30x.h"

#define LCD_WIDTH  240
#define LCD_HEIGHT 320   //更换屏幕对应修改分辨率 

//扫描方向定义
#define L2R_U2D  0 //从左到右,从上到下
#define L2R_D2U  1 //从左到右,从下到上
#define R2L_U2D  2 //从右到左,从上到下
#define R2L_D2U  3 //从右到左,从下到上

#define U2D_L2R  4 //从上到下,从左到右
#define U2D_R2L  5 //从上到下,从右到左
#define D2U_L2R  6 //从下到上,从左到右
#define D2U_R2L  7 //从下到上,从右到左

//横竖屏切换
#define Landscape  0 //1:横显示  0：竖显示  PS:横竖按照FPC的出线方向来看  

	
//LCD重要参数集
typedef struct  
{										    
	uint16_t 	width;			//LCD 宽度
	uint16_t 	height;			//LCD 高度
	uint16_t 	id;				  //LCD ID
	uint8_t  	dir;			  //横屏还是竖屏控制：0，竖屏；1，横屏。	
	uint8_t		wramcmd;		//开始写gram指令
	uint8_t  	setxcmd;		//设置x坐标指令
	uint8_t  	setycmd;		//设置y坐标指令	 
}_lcd_dev; 

extern _lcd_dev lcddev;

void LCD_WR_REG(uint8_t regval);
void LCD_WR_DATA8(uint8_t data);
void LCD_WR_DATA16(uint16_t data);
void Lcd_Address_Set(uint16_t x1,uint16_t y1,uint16_t x2,uint16_t y2);
void Lcd_Init(void);
#endif


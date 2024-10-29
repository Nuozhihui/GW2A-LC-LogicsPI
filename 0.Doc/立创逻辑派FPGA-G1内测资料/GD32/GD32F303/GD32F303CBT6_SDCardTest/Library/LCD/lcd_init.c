#include "lcd_init.h"
#include "systick.h"

//管理LCD重要参数
//默认为竖屏
_lcd_dev lcddev;

static void Init_SPI1_GPIO(void)
{
	spi_parameter_struct spi_init_struct;
	rcu_periph_clock_enable(RCU_SPI1);
	gpio_init(GPIOB, GPIO_MODE_AF_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_13 | GPIO_PIN_15);
	
	gpio_bit_write(GPIOB, GPIO_PIN_13 | GPIO_PIN_15,SET);
	
	spi_init_struct.trans_mode           = SPI_BIDIRECTIONAL_TRANSMIT;
	spi_init_struct.device_mode          = SPI_MASTER;
	spi_init_struct.frame_size           = SPI_FRAMESIZE_8BIT;
	spi_init_struct.clock_polarity_phase = SPI_CK_PL_HIGH_PH_2EDGE;
	spi_init_struct.nss                  = SPI_NSS_SOFT;
	spi_init_struct.prescale             = SPI_PSC_8;
	spi_init_struct.endian               = SPI_ENDIAN_MSB;
	spi_init(SPI1, &spi_init_struct);
	
	spi_enable(SPI1);
}

static void Init_LCD_GPIO(void)
{
	rcu_periph_clock_enable(RCU_GPIOB);
	rcu_periph_clock_enable(RCU_GPIOC);
	gpio_init(GPIOB, GPIO_MODE_OUT_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_2  | GPIO_PIN_12 | GPIO_PIN_1);
	gpio_init(GPIOB, GPIO_MODE_IN_FLOATING, GPIO_OSPEED_50MHZ, GPIO_PIN_14);
	
	gpio_init(GPIOC, GPIO_MODE_OUT_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_13);
	
	gpio_bit_write(GPIOB, GPIO_PIN_2 | GPIO_PIN_12  | GPIO_PIN_1,SET);
	
	gpio_bit_write(GPIOC, GPIO_PIN_13,SET);
}

static uint8_t SPI1_ReadWriteByte(uint8_t TxData)
{
	/* loop while data register in not emplty */
	while (RESET == spi_i2s_flag_get(SPI1,SPI_FLAG_TBE));

	/* send byte through the SPI0 peripheral */
	spi_i2s_data_transmit(SPI1,TxData);

	/* wait to receive a byte */
	while(RESET == spi_i2s_flag_get(SPI1,SPI_FLAG_RBNE));

	/* return the byte read from the SPI bus */
	return(spi_i2s_data_receive(SPI1));	
}


//LCD初始化放在这个函数中
static void LCD_INIT_CODE(void)
{
	//************* Start Initial Sequence **********// 
	LCD_WR_REG(0x11);
	delay_1ms(120); //Delay 120ms
	//--------------------------------ST7789S Frame rate setting----------------------------------//
	LCD_WR_REG(0xb2);
	LCD_WR_DATA8(0x0c);
	LCD_WR_DATA8(0x0c);
	LCD_WR_DATA8(0x00);
	LCD_WR_DATA8(0x33);
	LCD_WR_DATA8(0x33);
	LCD_WR_REG(0xb7);
	LCD_WR_DATA8(0x35);
	//---------------------------------ST7789S Power setting--------------------------------------//
	LCD_WR_REG(0xbb);
	LCD_WR_DATA8(0x2b);
	LCD_WR_REG(0xc0);
	LCD_WR_DATA8(0x2c);
	LCD_WR_REG(0xc2);
	LCD_WR_DATA8(0x01);
	LCD_WR_REG(0xc3);
	LCD_WR_DATA8(0x17);
	LCD_WR_REG(0xc4);
	LCD_WR_DATA8(0x20);
	LCD_WR_REG(0xc6);
	LCD_WR_DATA8(0x0f);
	LCD_WR_REG(0xca);
	LCD_WR_DATA8(0x0f);
	LCD_WR_REG(0xc8);
	LCD_WR_DATA8(0x08);
	LCD_WR_REG(0x55);
	LCD_WR_DATA8(0x90);
	LCD_WR_REG(0xd0);
	LCD_WR_DATA8(0xa4);
	LCD_WR_DATA8(0xa1);
	
	LCD_WR_REG(0x3A);
	LCD_WR_DATA8(0x05); 
	
	LCD_WR_REG(0x36);
	LCD_WR_DATA8(0x08); 
	
	//--------------------------------ST7789S gamma setting---------------------------------------//
	LCD_WR_REG(0xe0);
	LCD_WR_DATA8(0xF0);
	LCD_WR_DATA8(0x00);
	LCD_WR_DATA8(0x0A);
	LCD_WR_DATA8(0x10);
	LCD_WR_DATA8(0x12);
	LCD_WR_DATA8(0x1b);
	LCD_WR_DATA8(0x39);
	LCD_WR_DATA8(0x44);
	LCD_WR_DATA8(0x47);
	LCD_WR_DATA8(0x28);
	LCD_WR_DATA8(0x12);
	LCD_WR_DATA8(0x10);
	LCD_WR_DATA8(0x16);
	LCD_WR_DATA8(0x1b);
	
	LCD_WR_REG(0xe1);
	LCD_WR_DATA8(0xf0);
	LCD_WR_DATA8(0x00);
	LCD_WR_DATA8(0x0a);
	LCD_WR_DATA8(0x10);
	LCD_WR_DATA8(0x11);
	LCD_WR_DATA8(0x1a);
	LCD_WR_DATA8(0x3b);
	LCD_WR_DATA8(0x34);
	LCD_WR_DATA8(0x4e);
	LCD_WR_DATA8(0x3a);
	LCD_WR_DATA8(0x17);
	LCD_WR_DATA8(0x16);
	LCD_WR_DATA8(0x21);
	LCD_WR_DATA8(0x22);
	
	LCD_WR_REG(0x29);
	LCD_WR_REG(0x2c);	
}

static void LCD_WriteReg(uint8_t LCD_Reg, uint16_t LCD_RegValue)
{	
	LCD_WR_REG(LCD_Reg);
	LCD_WR_DATA8(LCD_RegValue);
}	

//设置LCD的自动扫描方向
//dir:0~7,代表8个方向(具体定义见lcd.h)   
static void LCD_Scan_Dir(uint8_t dir)
{
	uint16_t regval=0;
	uint8_t dirreg=0;
	//u16 temp;  
	switch(dir)//方向转换
	{
		case 0:dir=6;break;
		case 1:dir=7;break;
		case 2:dir=4;break;
		case 3:dir=5;break;
		case 4:dir=1;break;
		case 5:dir=0;break;
		case 6:dir=3;break;
		case 7:dir=2;break;	     
	}
	switch(dir)
	{
		case L2R_U2D://从左到右,从上到下
			regval|=(0<<7)|(0<<6)|(0<<5); 
			break;
		case L2R_D2U://从左到右,从下到上
			regval|=(1<<7)|(0<<6)|(0<<5); 
			break;
		case R2L_U2D://从右到左,从上到下
			regval|=(0<<7)|(1<<6)|(0<<5); 
			break;
		case R2L_D2U://从右到左,从下到上
			regval|=(1<<7)|(1<<6)|(0<<5); 
			break;	 
		case U2D_L2R://从上到下,从左到右
			regval|=(0<<7)|(0<<6)|(1<<5); 
			break;
		case U2D_R2L://从上到下,从右到左
			regval|=(0<<7)|(1<<6)|(1<<5); 
			break;
		case D2U_L2R://从下到上,从左到右
			regval|=(1<<7)|(0<<6)|(1<<5); 
			break;
		case D2U_R2L://从下到上,从右到左
			regval|=(1<<7)|(1<<6)|(1<<5); 
			break;	 
	}
	dirreg=0X36; 
  regval|=0x00;	//0x08 0x00  红蓝反色可以通过这里修改
	LCD_WriteReg(dirreg,regval);
			
	LCD_WR_REG(lcddev.setxcmd); 
	LCD_WR_DATA8(0);LCD_WR_DATA8(0);
	LCD_WR_DATA8((lcddev.width-1)>>8);LCD_WR_DATA8((lcddev.width-1)&0XFF);
	LCD_WR_REG(lcddev.setycmd); 
	LCD_WR_DATA8(0);LCD_WR_DATA8(0);
	LCD_WR_DATA8((lcddev.height-1)>>8);LCD_WR_DATA8((lcddev.height-1)&0XFF);  
}   

//设置LCD显示方向（6804不支持横屏显示）
//dir:0,竖屏；1,横屏
uint8_t DFT_SCAN_DIR; //扫描方向变量
static void LCD_Display_Dir(uint8_t dir)
{
	if(dir==0)			 
	{
		lcddev.dir=0;	//竖屏
		lcddev.width=LCD_WIDTH;
		lcddev.height=LCD_HEIGHT;

		lcddev.wramcmd=0X2C;
		lcddev.setxcmd=0X2A;
		lcddev.setycmd=0X2B;  
    DFT_SCAN_DIR=U2D_R2L;	    //竖显-设定显示方向	

	}else 				  //横屏
	{	  				
		lcddev.dir=1;	 
		lcddev.width=LCD_HEIGHT;
		lcddev.height=LCD_WIDTH;

		lcddev.wramcmd=0X2C;
		lcddev.setxcmd=0X2A;
		lcddev.setycmd=0X2B;  
    DFT_SCAN_DIR=L2R_U2D;     //横显-设定显示方向		
		
	} 
	LCD_Scan_Dir(DFT_SCAN_DIR);	//默认扫描方向
}

void LCD_WR_REG(uint8_t regval)
{ 
	gpio_bit_write(GPIOC,GPIO_PIN_13,RESET);
	gpio_bit_write(GPIOB,GPIO_PIN_12,RESET);
	SPI1_ReadWriteByte(regval);
	gpio_bit_write(GPIOB,GPIO_PIN_12,SET);
	gpio_bit_write(GPIOC,GPIO_PIN_13,SET);
}

void LCD_WR_DATA8(uint8_t data)
{										    	   
	gpio_bit_write(GPIOC,GPIO_PIN_13,SET);
	gpio_bit_write(GPIOB,GPIO_PIN_12,RESET);
	SPI1_ReadWriteByte(data);
	gpio_bit_write(GPIOB,GPIO_PIN_12,SET);
}

void LCD_WR_DATA16(uint16_t data)
{										    	   
	gpio_bit_write(GPIOC,GPIO_PIN_13,SET);
	gpio_bit_write(GPIOB,GPIO_PIN_12,RESET);
	SPI1_ReadWriteByte(data>>8);
	SPI1_ReadWriteByte(data);
	gpio_bit_write(GPIOB,GPIO_PIN_12,SET);
}

void Lcd_Address_Set(uint16_t x1,uint16_t y1,uint16_t x2,uint16_t y2)
{
	LCD_WR_REG(lcddev.setxcmd); 
	LCD_WR_DATA16(x1); 
	LCD_WR_DATA16(x2); 
  	
	LCD_WR_REG(lcddev.setycmd); 
	LCD_WR_DATA16(y1); 
	LCD_WR_DATA16(y2);
	LCD_WR_REG(0x2c);
}

void Lcd_Init(void)
{
	Init_LCD_GPIO();
	Init_SPI1_GPIO();
	gpio_bit_write(GPIOB, GPIO_PIN_2,SET);
	delay_1ms(10);
	gpio_bit_write(GPIOB, GPIO_PIN_2,RESET);
	delay_1ms(20);
	gpio_bit_write(GPIOB, GPIO_PIN_2,SET);
	delay_1ms(20);
	
	gpio_bit_write(GPIOB, GPIO_PIN_15,SET);
	gpio_bit_write(GPIOB, GPIO_PIN_1,SET);
	
	LCD_INIT_CODE();
	LCD_Display_Dir(Landscape);		 	//1:竖屏；0:横屏   横竖屏从这里切换
}

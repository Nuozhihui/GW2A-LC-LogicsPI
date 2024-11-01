#include "lcd.h"
#include "lcd_init.h"
#include "font.h"


/*
*   函数内容：  在指定区域填充颜色
*   函数参数：  xsta,ysta---起始坐标
*               xend，yend---终止坐标
*               color--------要填充的颜色
*   返回值：    无
*/
void TFT_Fill(uint16_t xsta,uint16_t ysta,uint16_t xend,uint16_t yend,uint16_t color)
{
    uint16_t i=0,j=0;
    Lcd_Address_Set(xsta,ysta,xend-1,yend-1);   //设置显示范围
    for(i=ysta;i<yend;i++)
    {
        for(j=xsta;j<xend;j++)
        {
            LCD_WR_DATA16(color);
        }
    }
}

/*
*   函数内容：  在指定位置画点
*   函数参数：  x,y---画点坐标
*               color--------要填充的颜色
*   返回值：    无
*/
void TFT_DrawPoint(uint16_t x,uint16_t y, uint16_t color)
{
    Lcd_Address_Set(x,y,x,y);   //设置显示范围
    LCD_WR_DATA16(color);
}

/*
*   函数内容：  画线
*   函数参数：  x1,y1   起始坐标
*               x2,y2   终止坐标
*               color   要填充的颜色
*   返回值：    无
*/
void TFT_DrawLine(uint16_t x1,uint16_t y1,uint16_t x2,uint16_t y2,uint16_t color)
{ 
	uint16_t t=0; 
	int xerr=0,yerr=0,delta_x=0,delta_y=0,distance=0;
	int incx=0,incy=0,uRow=0,uCol=0;
	delta_x=x2-x1; //计算坐标增量 
	delta_y=y2-y1;
	uRow=x1;//画线起点坐标
	uCol=y1;
	if(delta_x>0){
        incx=1; //设置单步方向 
    }
	else if (delta_x==0){
        incx=0;//垂直线 
    }
	else {
        incx=-1;
        delta_x=-delta_x;
    }
	if(delta_y>0){
        incy=1;
    }
	else if (delta_y==0){
        incy=0;//水平线 
    }
	else {
        incy=-1;
        delta_y=-delta_y;
    }
	if(delta_x>delta_y){
        distance=delta_x; //选取基本增量坐标轴 
    }
	else {
        distance=delta_y;
    }
	for(t=0;t<distance+1;t++)
	{
		TFT_DrawPoint(uRow,uCol,color);//画点       
		xerr+=delta_x;
		yerr+=delta_y;
		if(xerr>distance)
		{
			xerr-=distance;
			uRow+=incx;
		}
		if(yerr>distance)
		{
			yerr-=distance;
			uCol+=incy;
		}
	}
}

/*
*   函数内容：  画矩形
*   函数参数：  x1,y1   起始坐标
*               x2,y2   终止坐标
*               color   矩形的颜色
*   返回值：    无
*/
void TFT_DrawRectangle(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2,uint16_t color)
{
	TFT_DrawLine(x1,y1,x2,y1,color);
	TFT_DrawLine(x1,y1,x1,y2,color);
	TFT_DrawLine(x1,y2,x2,y2,color);
	TFT_DrawLine(x2,y1,x2,y2,color);
}

/*
*   函数内容：  画圆
*   函数参数：  x0,y0   圆心坐标
*               r       半径
*               color   矩形的颜色
*   返回值：    无
*/
void Draw_Circle(uint16_t x0,uint16_t y0,uint8_t r,uint16_t color)
{
	uint16_t a=0,b=0;
	a=0;b=r;	  
	while(a<=b)
	{
		TFT_DrawPoint(x0-b,y0-a,color);             //3           
		TFT_DrawPoint(x0+b,y0-a,color);             //0           
		TFT_DrawPoint(x0-a,y0+b,color);             //1                
		TFT_DrawPoint(x0-a,y0-b,color);             //2             
		TFT_DrawPoint(x0+b,y0+a,color);             //4               
		TFT_DrawPoint(x0+a,y0-b,color);             //5
		TFT_DrawPoint(x0+a,y0+b,color);             //6 
		TFT_DrawPoint(x0-b,y0+a,color);             //7
		a++;
		if((a*a+b*b)>(r*r))//判断要画的点是否过远
		{
			b--;
		}
	}
}

/*
*   函数内容：显示字符
*   函数参数：  x,y---起始坐标
*               num 要显示的字符
*               fc 字的颜色
*               bc 字的背景色
*               sizey 字号
*               mode:  0非叠加模式  1叠加模式
*   返回值：    无
*/
void TFT_ShowChar(uint16_t x,uint16_t y,uint8_t num,uint16_t fc,uint16_t bc,uint8_t sizey,uint8_t mode)
{
	uint8_t temp,sizex,t,m=0;
	uint16_t i,TypefaceNum;//一个字符所占字节大小
	uint16_t x0=x;
	sizex=sizey/2;
	TypefaceNum=(sizex/8+((sizex%8)?1:0))*sizey;
	num=num-' ';    //得到偏移后的值
	Lcd_Address_Set(x,y,x+sizex-1,y+sizey-1);  //设置光标位置 
	for(i=0;i<TypefaceNum;i++)
	{ 
		if(sizey==16){
            temp=ascii_1608[num][i];		       //调用12x24字体
		}
        else if(sizey==24){
            temp=ascii_2412[num][i];		       //调用12x24字体
        }
		else {
            return;
        }
		for(t=0;t<8;t++)
		{
			if(!mode)//非叠加模式
			{
				if(temp&(0x01<<t)){
                    LCD_WR_DATA16(fc);
                }
				else {
                    LCD_WR_DATA16(bc);
                }
				m++;
				if(m%sizex==0)
				{
					m=0;
					break;
				}
			}
			else//叠加模式
			{
				if(temp&(0x01<<t)){
                    TFT_DrawPoint(x,y,fc);//画一个点
                }
				x++;
				if((x-x0)==sizex)
				{
					x=x0;
					y++;
					break;
				}
			}
		}
	}   	 	  
}

/*
*   函数内容：  显示字符串
*   函数参数：  x,y---起始坐标
*               *p 要显示的字符串
*               fc 字的颜色
*               bc 字的背景色
*               sizey 字号
*               mode:  0非叠加模式  1叠加模式
*   返回值：    无
*/
void TFT_ShowString(uint16_t x,uint16_t y,const uint8_t *p,uint16_t fc,uint16_t bc,uint8_t sizey,uint8_t mode)
{         
	while(*p!='\0')
	{       
		TFT_ShowChar(x,y,*p,fc,bc,sizey,mode);
		x+=sizey/2;
		p++;
	}  
}

/******************************************************************************
      函数说明：显示汉字串
      入口数据：x,y显示坐标
                *s 要显示的汉字串
                fc 字的颜色
                bc 字的背景色
                sizey 字号 可选 16 24 32
                mode:  0非叠加模式  1叠加模式
      返回值：  无
******************************************************************************/
void TFT_ShowChinese(uint16_t x,uint16_t y,uint8_t *s,uint16_t fc,uint16_t bc,uint8_t sizey,uint8_t mode)
{
	while(*s!=0)
	{
		if(sizey == 16) {
            TFT_ShowChinese16x16(x,y,s,fc,bc,sizey,mode);
        }
        else if(sizey == 24){
            TFT_ShowChinese24x24(x,y,s,fc,bc,sizey,mode);
        }
		s+=2;
		x+=sizey;
	}
}

/******************************************************************************
      函数说明：显示单个16x16汉字
      入口数据：x,y显示坐标
                *s 要显示的汉字
                fc 字的颜色
                bc 字的背景色
                sizey 字号
                mode:  0非叠加模式  1叠加模式
      返回值：  无
******************************************************************************/
void TFT_ShowChinese16x16(uint16_t x,uint16_t y,uint8_t *s,uint16_t fc,uint16_t bc,uint8_t sizey,uint8_t mode)
{
	uint8_t i=0,j=0,m=0;
	uint16_t k=0;
	uint16_t HZnum=0;//汉字数目
	uint16_t TypefaceNum=0;//一个字符所占字节大小
	uint16_t x0=x;
    TypefaceNum=(sizey/8+((sizey%8)?1:0))*sizey;
	HZnum=sizeof(tfont16)/sizeof(typFNT_GB16);	//统计汉字数目
	for(k=0;k<HZnum;k++) 
	{
		if ((tfont16[k].Index[0]==*(s))&&(tfont16[k].Index[1]==*(s+1)))
		{ 	
			Lcd_Address_Set(x,y,x+sizey-1,y+sizey-1);
			for(i=0;i<TypefaceNum;i++)
			{
				for(j=0;j<8;j++)
				{	
					if(!mode)//非叠加方式
					{
						if(tfont16[k].Msk[i]&(0x01<<j)){
                            LCD_WR_DATA16(fc);
                        }
						else {
                            LCD_WR_DATA16(bc);
                        }
						m++;
						if(m%sizey==0)
						{
							m=0;
							break;
						}
					}
					else//叠加方式
					{
						if(tfont16[k].Msk[i]&(0x01<<j)){
                            TFT_DrawPoint(x,y,fc);//画一个点
                        }
						x++;
						if((x-x0)==sizey)
						{
							x=x0;
							y++;
							break;
						}
					}
				}
			}
		}				  	
		continue;  //查找到对应点阵字库立即退出，防止多个汉字重复取模带来影响
	}
} 

/******************************************************************************
      函数说明：显示单个24x24汉字
      入口数据：x,y显示坐标
                *s 要显示的汉字
                fc 字的颜色
                bc 字的背景色
                sizey 字号
                mode:  0非叠加模式  1叠加模式
      返回值：  无
******************************************************************************/
void TFT_ShowChinese24x24(uint16_t x,uint16_t y,uint8_t *s,uint16_t fc,uint16_t bc,uint8_t sizey,uint8_t mode)
{
	uint8_t i=0,j=0,m=0;
	uint16_t k=0;
	uint16_t HZnum=0;//汉字数目
	uint16_t TypefaceNum=0;//一个字符所占字节大小
	uint16_t x0=x;
	TypefaceNum=(sizey/8+((sizey%8)?1:0))*sizey;
	HZnum=sizeof(tfont24)/sizeof(typFNT_GB24);	//统计汉字数目
	for(k=0;k<HZnum;k++) 
	{
		if ((tfont24[k].Index[0]==*(s))&&(tfont24[k].Index[1]==*(s+1)))
		{ 	
			Lcd_Address_Set(x,y,x+sizey-1,y+sizey-1);
			for(i=0;i<TypefaceNum;i++)
			{
				for(j=0;j<8;j++)
				{	
					if(!mode)//非叠加方式
					{
						if(tfont24[k].Msk[i]&(0x01<<j)){
                            LCD_WR_DATA16(fc);
                        }
						else{
                            LCD_WR_DATA16(bc);
                        }
						m++;
						if(m%sizey==0)
						{
							m=0;
							break;
						}
					}
					else//叠加方式
					{
						if(tfont24[k].Msk[i]&(0x01<<j)){
                            TFT_DrawPoint(x,y,fc);//画一个点
                        }
						x++;
						if((x-x0)==sizey)
						{
							x=x0;
							y++;
							break;
						}
					}
				}
			}
		}				  	
		continue;  //查找到对应点阵字库立即退出，防止多个汉字重复取模带来影响
	}
} 

/******************************************************************************
      函数说明：显示数字
      入口数据：m底数，n指数
      返回值：  无
******************************************************************************/
uint32_t mypow(uint8_t m,uint8_t n)
{
	uint32_t result=1;	 
	while(n--)result*=m;
	return result;
}

/******************************************************************************
     函数说明：显示整数变量
      入口数据：x,y显示坐标
                num 要显示整数变量
                len 要显示的位数
                fc 字的颜色
                bc 字的背景色
                sizey 字号
      返回值：  无
******************************************************************************/
void TFT_ShowIntNum(uint16_t x,uint16_t y,uint16_t num,uint8_t len,uint16_t fc,uint16_t bc,uint8_t sizey)
{         	
	uint8_t t,temp;
	uint8_t enshow=0;
	uint8_t sizex=sizey/2;
	for(t=0;t<len;t++)
	{
		temp=(num/mypow(10,len-t-1))%10;
		if(enshow==0&&t<(len-1))
		{
			if(temp==0)
			{
				TFT_ShowChar(x+t*sizex,y,' ',fc,bc,sizey,0);
				continue;
			}else enshow=1; 
		 	 
		}
	 	TFT_ShowChar(x+t*sizex,y,temp+48,fc,bc,sizey,0);
	}
} 

/******************************************************************************
      函数说明：显示两位小数变量
      入口数据：x,y显示坐标
                num 要显示小数变量
                len 要显示的位数
                fc 字的颜色
                bc 字的背景色
                sizey 字号
      返回值：  无
******************************************************************************/
void TFT_ShowFloatNum1(uint16_t x,uint16_t y,float num,uint8_t len,uint16_t fc,uint16_t bc,uint8_t sizey)
{         	
	uint8_t t,temp,sizex;
	uint16_t num1;
	sizex=sizey/2;
	num1=num*100;
	for(t=0;t<len;t++)
	{
		temp=(num1/mypow(10,len-t-1))%10;
		if(t==(len-2))
		{
			TFT_ShowChar(x+(len-2)*sizex,y,'.',fc,bc,sizey,0);
			t++;
			len+=1;
		}
	 	TFT_ShowChar(x+t*sizex,y,temp+48,fc,bc,sizey,0);
	}
}


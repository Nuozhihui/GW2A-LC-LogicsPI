#ifndef __LED_H
#define __LED_H

#include "gd32f30x.h"

enum LED_E
{
	Red=1,
	Green,
	Blue,
};

void Init_LED_GPIO(void);
void Open_LED(enum LED_E value);
void Close_LED(enum LED_E value);

#endif


#ifndef __KEY_H
#define __KEY_H

#include "gd32f30x.h"
#include "systick.h"

#define KEY_NO_PRESS	0x00
#define KEY_DITHERING	0x01
#define KEY_STABILIZE 0X02
#define KEY_CPLT			0x03

#define KEY_SHORT_PRESS	0x10
#define KEY_LONG_PRESS	0x11

void Init_KEY_GPIO(void);
void KEY_Scanf(uint16_t *value);

#endif


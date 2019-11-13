//Escribir un código en C para prender todos los leds de manera secuencial
//(secuencia: G - R - B - Led1 - Led2 - Led3)

#include "struct_base.h"
#include "gpio_set.h"

#define systick_BASE		0xE000E010
#define systick 			((systick_t *) systick_BASE)


typedef struct{
	unsigned int CTRL;
	unsigned int LOAD;
	unsigned int VAL;
	unsigned int CALIB;
}systick_t;

void SysTick_Handler(void){
	(GPIO->NOT)[0]|=(1<<14);
	return;
}

int main(void){

	(SCU->SFSP)[2][10]=(0x0);	//LED 1
	GPIO_SetPinDIR(GPIO,0,14,OUTPUT);
	(systick->CTRL)|=(0x3);
	(systick->LOAD)|=(systick->CALIB)*100;

	while (1) {
	}

	return 0;
}

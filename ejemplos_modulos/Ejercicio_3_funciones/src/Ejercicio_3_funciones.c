//Escribir un código en C para prender todos los leds de manera secuencial
//(secuencia: G - R - B - Led1 - Led2 - Led3)

#include "struct_base.h"
#include "gpio_set.h"
#include "leds_setup.h"
#include "scu_set.h"

int main(void) {


	//Configuro los pines que voy a usar como GPIO
	LED_cfg(L0R);
	LED_cfg(L0G);
	LED_cfg(L0B);
	LED_cfg(L1);
	LED_cfg(L2);
	LED_cfg(L3);

	//hago la secuencia.
	int i=0;
	int j=0;

	while (1) {
		switch(j % 6){
		case 0:
			LED_low(L3);
			LED_high(L0G);
			break;
		case 1:
			LED_low(L0G);
			LED_high(L0R);
			break;
		case 2:
			LED_low(L0R);
			LED_high(L0B);
			break;
		case 3:
			LED_low(L0B);
			LED_high(L1);
			break;
		case 4:
			LED_low(L1);
			LED_high(L2);
			break;
		case 5:
			LED_low(L2);
			LED_high(L3);
			break;
		}

		for(i=0;i<10000000;i++){ //delay trucho
			}
		j++;
	}

	return 0;
}

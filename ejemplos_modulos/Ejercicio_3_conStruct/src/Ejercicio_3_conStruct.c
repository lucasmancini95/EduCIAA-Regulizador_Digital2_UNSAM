//Escribir un código en C para prender todos los leds de manera secuencial
//(secuencia: G - R - B - Led1 - Led2 - Led3)

#include "struct_base.h"

int main(void) {


	//Configuro los pines que voy a usar como GPIO

	(SCU->SFSP)[2][0]=(0x4); 	//LED RGB (R)
	(SCU->SFSP)[2][1]=(0x4); 	//LED RGB (G)
	(SCU->SFSP)[2][2]=(0x4); 	//LED RGB (B)
	(SCU->SFSP)[2][10]=(0x0);	//LED 0
	(SCU->SFSP)[2][11]=(0x0);	//LED 1
	(SCU->SFSP)[2][12]=(0x0);	//LED 2

	//seteo los puertos como de salida poniendo 1 en el bit correspondiente
	(GPIO->DIR)[0]|=(1<<14);				//LED 0
	(GPIO->DIR)[1]|=(1<<11) | (1<<12);		//LED 1 y LED 2
	(GPIO->DIR)[5]|=(1<<0)|(1<<1)|(1<<2);	//LED RGB

	//hago la secuencia.
	int i=0;
	int j=0;

	while (1) {
		switch(j % 6){
		case 0:
			(GPIO->CLR)[1] |= (1<<12);
			(GPIO->SET)[5] |= (1<<1);
			break;
		case 1:
			(GPIO->CLR)[5] |= (1<<1);
			(GPIO->SET)[5] |= (1<<0);
			break;
		case 2:
			(GPIO->CLR)[5] |= (1<<0);
			(GPIO->SET)[5] |= (1<<2);
			break;
		case 3:
			(GPIO->CLR)[5] |= (1<<2);
			(GPIO->SET)[0] |= (1<<14);
			break;
		case 4:
			(GPIO->CLR)[0] |= (1<<14);
			(GPIO->SET)[1] |= (1<<11);
			break;
		case 5:
			(GPIO->CLR)[1] |= (1<<11);
			(GPIO->SET)[1] |= (1<<12);
			break;
		}

		for(i=0;i<10000000;i++){ //delay trucho
			}
		j++;
	}

	return 0;
}

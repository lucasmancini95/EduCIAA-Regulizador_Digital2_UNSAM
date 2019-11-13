//Escribir un código en C para prender todos los leds de manera secuencial
//(secuencia: G - R - B - Led1 - Led2 - Led3)

#include "struct_base.h"
#include "leds_setup.h"
#include "tec_setup.h"



int main(void) {

	LED_cfg(L0R);
	LED_cfg(L0G);
	LED_cfg(L0B);
	LED_cfg(L1);
	LED_cfg(L2);
	LED_cfg(L3);

	TEC_cfg(TEC1);
	TEC_cfg(TEC2);
	TEC_cfg(TEC3);
	TEC_cfg(TEC4);


	//hago la secuencia.
	int i=0;
	int j=0;

	state_t state;//logica inversa
	//si apreto es 0, si suelto 1



	while (1) {

		//tengo que checkear el estado de la tecla (posicion 4 del PIN0)
		//tecla = ((GPIO->PIN)[0]>>4 & 0x01);
		//corro todo el contenido de PIN0 4 posiciones y enmascaro con 1
		//para quedarme con el valor de la ultima posición.

		state = TEC_GetState(TEC4);

		if(state == LOW){
			LED_high(L0R);
			LED_high(L0G);
			LED_high(L0B);
			LED_high(L1);

		}

		else{
			LED_low(L0R);
			LED_low(L0G);
			LED_low(L0B);
			LED_low(L1);

			switch(j % 6){
			case 0:
				(GPIO->SET)[5] |= (1<<1);
				break;
			case 1:
				(GPIO->SET)[5] |= (1<<0);
				break;
			case 2:
				(GPIO->SET)[5] |= (1<<2);
				break;
			case 3:
				(GPIO->SET)[0] |= (1<<14);
				break;
			case 4:
				(GPIO->SET)[1] |= (1<<11);
				break;
			case 5:
				(GPIO->SET)[1] |= (1<<12);
				break;
			}
		}

		for(i=0;i<10000000;i++){ //delay trucho
			}
		j++;
	}

	return 0;
}

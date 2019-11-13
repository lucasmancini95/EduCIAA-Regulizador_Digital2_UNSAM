#include "interruptions.h"
#include "struct_base.h"

void Enable_NVIC(interrupt_t interrnum){
	/*
	Esta funcion habilita la interrupcion del core de ARM, en el caso de NXP, solo tenemos interrupciones en los registros 
	ISER 0 Y 1. La interrupcion se la pasamos con un enum que tiene los numeros de interrupciones de NXP 
	*/

	unsigned char isernum;

	if(0<=interrnum && interrnum<=31){
		isernum=0;
	}
	else if (32<=interrnum && interrnum<=63){
		isernum=1;
		interrnum -= 32; //esto funciona como x=x-4
		//resto 32 para poder usarlo como desplazamiento dentro de iser.
	}
	else{
		return;
	}

	(NVIC->ISER)[isernum]|=(1<<(unsigned int)interrnum);


	//(NVIC->ISER)[(unsigned int)((int)isernum>>5)]|=(unsigned int)( 1<< ((unsigned int)interrnum & (unsigned int)0x1F));

	/*
	 (NVIC->ISER)[(unsigned int)((int)isernum>>5)]|=(unsigned int)( 1<< ((unsigned int)interrnum & (unsigned int)0x1F));
	 Version compacta
	corriendo 5 lugares es como restar 32 (32 es 100000), si el numero de interrupcion esta por debajo del 32, me va a quedar un 
	0 de lo contrario queda un 1. Hago una mascara con el valor restante con los primeros 5 bits (por debajo de 32) que son los
	que me importan en cada uno de los registros. por ejemplo en 40 necesito el 8 que esta en los primeros 5 bits.   
	*/
	return;
}
void SelectEdge_PIN_INT(int ISELnum){
	if(ISELnum <=7){
		(PIN_INT->ISEL) &= ~(0x01<<ISELnum);
		//si quiero un 0 en alguna posicion tengo que poner un 1 en una pos, negarlo y AND
		//pues 0 es edge sensivility
	}
}
void Enable_PIN_INT(int SIENRnum){
	if(SIENRnum <=7){
		(PIN_INT->SIENR)|= (0x01<<SIENRnum); 
	}
}

void Select_GPIO_interrupt(unsigned char port, unsigned char pin, unsigned char interrnum){
	
//	unsigned char pintselnum;
//	unsigned char aux=0x00;
//
//	if(0<=interrnum && interrnum<=3){
//		pintselnum=0;
//	}
//	else if (4<=interrnum && interrnum<=7){
//		pintselnum=1;
//		interrnum -= 4; //esto funciona como x=x-4
//		//resto 4 para poder usarlo como desplazamiento dentro de pinselnum.
//	}
//
//	else{
//		return;
//	}
//
//	aux|= (port<<5) | (pin);
//
//	(SCU->PINTSEL)[pintselnum]|=(aux<<interrnum);

	int desp=(interrnum & 3) << 3;
	(SCU->PINTSEL)[interrnum >> 2]|= ( ( ( port & 7 ) << 5) | (pin & 0x1F) ) << desp;

	return;
}

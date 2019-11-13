#include "dac.h"
#include "struct_base.h"

void Enable_ENAIO(){
	(SCU->ENAIO)[2]|=1;
}
//ENAIO[2] corresponde al DAC, en 1 hago que la salida del pin funcione como analogica (que tenga un rango de 0 a 3,3V) 
//y en 0 funciona como un pin digital donde solo tiene 0 y 1 (3,3V) como valores posibles

void Enable_DMA(){
	(DAC->CTRL)|=(1<<3); 
}
//DMA_ENA(posicion 3) en 1: Habilitación del DAC y la entrada 15 (DMA Burst Request).

void Value_DAC(int value){
	//como int tiene 32 bit hago una mascara con una AND en los primeros 10 bits (3FF) para asegurarme que los primeros bits sean 0
	(DAC->CR)= ((value & 0x3FF)<< 6) | (1<<16); 
}
//VALUE son los bits de 5 a 16 y BIAS es el bit 16 el cual mejor

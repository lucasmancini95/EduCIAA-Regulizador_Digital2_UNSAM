//Escribir un código en C para prender todos los leds de manera secuencial
#include <math.h>
#include "interruptions.h"
#include "struct_base.h"
#include "leds_setup.h"
#include "tec_setup.h"
#include "dac.h"
#include "gpdma.h"
#include <stdbool.h>


#define PI	3.141516
#define MAX_FREQ 8000 //8kHz
#define MIN_FREQ 1000 //1kHz
#define SAMPLE_FREQ 800000 //80kHz


bool flag_T1 = 0;
bool flag_T2 = 0;
bool flag_T3 = 0;
bool flag_T4 = 0;
bool TEC_flag = 0; //indica si alguna flag fue modificada

void GPIO0_IRQHandler(void){

	(PIN_INT->IST)|=(1<<0); //debe usarse para limpiar la interrupcion
	LED_toggle(L0B);


	flag_T1=!flag_T1; //es un toogle del booleano

	TEC_flag = 1;

}

void GPIO1_IRQHandler(void) {

	(PIN_INT->IST)|=(1<<1);
	LED_toggle(L1);

	flag_T2=!flag_T2;

	TEC_flag = 1;

}

void GPIO2_IRQHandler(void) {
	(PIN_INT->IST)|=(1<<2);
	LED_toggle(L2);
	flag_T3=!flag_T3;

	TEC_flag = 1;
}

void GPIO3_IRQHandler(void) {
	(PIN_INT->IST)|=(1<<3);
	LED_toggle(L3);
	flag_T4=!flag_T4;

	TEC_flag = 1;
}



void DMA_IRQHandler(void)	{
	(GPDMA->INTTCCLEAR) |= 0x1; // Limpio la interrupción para volver al main
}




int main(void) {

	unsigned int src_signal_0[SAMPLE_FREQ/MIN_FREQ];
	unsigned int src_signal_1[SAMPLE_FREQ/MIN_FREQ];

	struct LLI_T LLI0;
	struct LLI_T LLI1;

	//CONFIGURACION TECLAS Y LEDS EN GPIO

	TEC_ALL();
	LED_ALL();

	//CONFIGURACION DE LAS INTERRUPCIONES

	SelectEdge_PIN_INT(0);
	SelectEdge_PIN_INT(1);
	SelectEdge_PIN_INT(2);
	SelectEdge_PIN_INT(3);
	Enable_PIN_INT(0);
	Enable_PIN_INT(1);
	Enable_PIN_INT(2);
	Enable_PIN_INT(3);
	Select_GPIO_interrupt(0, 4, 0);
	Select_GPIO_interrupt(0, 8, 1);
	Select_GPIO_interrupt(0, 9, 2);
	Select_GPIO_interrupt(1, 9, 3);
	Enable_NVIC(PIN_INT0_IRQn);
	Enable_NVIC(PIN_INT1_IRQn);
	Enable_NVIC(PIN_INT2_IRQn);
	Enable_NVIC(PIN_INT3_IRQn);



	//CONFIGURACION DEL DMA Y EL DAC



//24 Master 0 puede acceder a memoria y sgpio (source)
//25 Master como el destino no es ni memoria ni sgpio tengo que usar master 1

//	LLI0.source=(unsigned int) src_signal_0;
//	LLI0.destination=(unsigned int) &(DAC->CR);
//	LLI0.next= (unsigned int)&LLI1; //como es un puntero, tengo que ponerle la direccion (&)
//	LLI0.control= DMA_CONTROL_MASK;
//
//	LLI1.source=(unsigned int) src_signal_1;
//	LLI1.destination=(unsigned int) &(DAC->CR);
//	LLI1.next=(unsigned int) &LLI0; //como es un puntero, tengo que ponerle la direccion (&)
//	LLI1.control= DMA_CONTROL_MASK;
//
//	(GPDMA->CH[0]).LLI=LLI0; //Asigno la primer struct a la estructura del registro.


	cfg_DMA(src_signal_0,src_signal_1);
	Enable_NVIC(DMA_IRQn); //INTERRUPCION DEL DMA


	while(1){


		if(TEC_flag == 1)
			signal_fill(src_signal_0,src_signal_1);
		    TEC_flag = 0;
		}

		return 0;
}

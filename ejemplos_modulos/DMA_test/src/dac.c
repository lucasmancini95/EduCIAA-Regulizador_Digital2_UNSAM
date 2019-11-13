#include "dac.h"
#include "struct_base.h"
#include "gpdma.h"
#include <math.h>

#define PI	3.141516
#define MAX_FREQ 8000 //8kHz
#define MIN_FREQ 1000 //1kHz
#define SAMPLE_FREQ 80000 //80kHz
#define CLOCK_SPEED 204000000

int SAMPLES_NUM = SAMPLE_FREQ/MIN_FREQ;


//AHB bridge , puente entre el bus del micro y los perifericos, le digo por donde comunicar , en este caso, el DMA con los perifericos
unsigned int DMA_CONTROL_MASK = ( SAMPLE_FREQ/MIN_FREQ		|	// transfer size
								(0 << 12)			|	// source burst size (12-14) = 1
								(0 << 15)			|	// destination burst size (15-17) = 1
								(2 << 18)			|	// source width (18-20) = 32 bits
								(2 << 21)			|	// destination width (21-23) = 32 bits
								(0 << 24)			|	// source AHB select = AHB 0
								(1 << 25)			|	// destination AHB select = AHB 1
								(1 << 26)			|	// source increment = increment (incrementa la posición del vector)
								(0 << 27)			|	// destination increment = no increment
								(0 << 28)			|	// mode select = access in user mode
								(0 << 29)			|	// access not buffereable
								(0 << 30)			|	// access not cacheable
								(1 << 31));				// interrupción de fin de cuenta (deshabilita (0) | habilita (1))

void Enable_ENAIO(){
	(SCU->ENAIO)[2]|=1;
}
//ENAIO[2] corresponde al DAC, en 1 hago que la salida del pin funcione como analogica (que tenga un rango de 0 a 3,3V) 
//y en 0 funciona como un pin digital donde solo tiene 0 y 1 (3,3V) como valores posibles

void Enable_DMA(){
	(DAC->CTRL)|=(1<<3) | (1<<2) | (1<<1) | (1<<0);
}
//DMA_ENA(posicion 3) en 1: Habilitación del DAC y la entrada 15 (DMA Burst Request).
//
void Values_DAC(int value){
	//como int tiene 32 bit hago una mascara con una AND en los primeros 10 bits (3FF) para asegurarme que los primeros bits sean 0
	(DAC->CR)= ((value & 0x3FF)<< 6) | (1<<16); 
}
//VALUE son los bits de 5 a 16 y BIAS es el bit 16 el cual mejor

void cfg_DAC(){
	int count;

	Enable_ENAIO();
	count = (CLOCK_SPEED / SAMPLE_FREQ ) -1; // = 255 -- reducción necesaria para una frecuencia de muestreo de 800kHz con un clock de 204MHz
	(DAC->CNTVAL) = (count & 0xFFFF);
}

void cfg_DMA(unsigned int* src_signal_0, unsigned int* src_signal_1){

	struct LLI_T LLI0;
	struct LLI_T LLI1;



	cfg_DAC();
	Enable_DMA();


		LLI0.source=(unsigned int) src_signal_0;
		LLI0.destination=(unsigned int) &(DAC->CR);
		LLI0.next= (unsigned int)&LLI1; //como es un puntero, tengo que ponerle la direccion (&)
		LLI0.control= DMA_CONTROL_MASK;

		LLI1.source=(unsigned int) src_signal_1;
		LLI1.destination=(unsigned int) &(DAC->CR);
		LLI1.next=(unsigned int) &LLI0; //como es un puntero, tengo que ponerle la direccion (&)
		LLI1.control= DMA_CONTROL_MASK;

		(GPDMA->CH[0]).LLI=LLI0; //Asigno la primer struct a la estructura del registro.


	//configuracion del DMA
	(GPDMA->CONFIG)|=1; //DMA Controller enable (1 ENABLED)


	(GPDMA->CH[0]).CONFIG = 1					// Channel (0) enabled
							|	(0 << 1)		// Source peripheral (1-5) = memory (for memory ignore this field)
							|	(0xF << 6)		// destination peripheral (6-10) = none
							|	(1 << 11)		// flow control (11-13) = mem to per
							|	(0 << 14)		// mask out error interrupt (0 = enmascara)
							|	(1 << 15)		// mask out terminal count interrupt (0 = enmascara)
							|	(0 << 16)		// no locked transfers
							|	(0 << 18);		// no HALT



}

void signal_fill(unsigned int* src_signal_0, unsigned int* src_signal_1){

	int i=0;
	int SAMPLES_NUM = SAMPLE_FREQ/MIN_FREQ;
	double aux[SAMPLES_NUM];

	for(i=0;i<SAMPLES_NUM;i++){


		aux[i]= (flag_T1*sin(2*PI*i/SAMPLES_NUM) + flag_T2*sin(2*PI*2*i/SAMPLES_NUM) + flag_T3*sin(2*PI*4*i/SAMPLES_NUM) + flag_T4*sin(2*PI*8*i/SAMPLES_NUM))/(flag_T1+flag_T2+flag_T3+flag_T4);
		src_signal_0[i]= ((int) (511*aux[i]+512)<< 6) | (1<<16);


		src_signal_1[i]=src_signal_0[i];

	}


}







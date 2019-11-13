/*
Escribir una función que establezca la DIR de un pin determinado como salida, de un determinado puerto.
Los parámetros serán: la estructura del puerto, el puerto y el pin. El encabezado de la misma será:
void GPIO_SetPinDIROutput(GPIO_T *pGPIO, unsigned char puerto, unsigned char pin)
*/
#include "struct_base.h"
#include "gpio_set.h"


void GPIO_SetPinDIR(GPIO_T *pGPIO, unsigned char puerto, unsigned char pin, IO_t IO){
	
	if(IO==OUTPUT)
		(pGPIO->DIR)[puerto]|=(1<<pin);
	else if(IO==INPUT)
		(pGPIO->DIR)[puerto]&= ~(1<<pin);
}

void GPIO_SetPin(GPIO_T *pGPIO, unsigned char puerto, unsigned char pin, state_t state){
	
	if(state==HIGH)
		(pGPIO->SET)[puerto] |= (1<<pin);
	else if (state==LOW)
		(pGPIO->CLR)[puerto] |= (1<<pin);
}

state_t GPIO_GetPinState(GPIO_T *pGPIO, unsigned char puerto, unsigned char pin){

	//Esta funcion me devuelve el estado que hay en un pin
	//el registro B me da un valor de 1 o 0

	return (state_t)(pGPIO->B)[puerto][pin]; //hago un casteo porque quiero que 0 sea para LOW y 1 sea para HIGH
}

int GPIO_GetPinDIR(GPIO_T *pGPIO, unsigned char puerto, unsigned char pin){
	
}





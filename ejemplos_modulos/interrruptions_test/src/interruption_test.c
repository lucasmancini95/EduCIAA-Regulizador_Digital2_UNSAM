//Escribir un código en C para prender todos los leds de manera secuencial
#include "interruptions.h"
#include "struct_base.h"
#include "leds_setup.h"
#include "tec_setup.h"

void GPIO0_IRQHandler(void){

	(PIN_INT->IST)|=(1<<0); //debe usarse para limpiar la interrupcion
	LED_toggle(L0B);

}

void GPIO1_IRQHandler(void) {

	(PIN_INT->IST)|=(1<<1);
	LED_toggle(L1);
}

void GPIO2_IRQHandler(void) {
	(PIN_INT->IST)|=(1<<2);
	LED_toggle(L2);
}

void GPIO3_IRQHandler(void) {
	(PIN_INT->IST)|=(1<<3);
	LED_toggle(L3);
}

int main(void) {

	TEC_cfg(TEC1);
	TEC_cfg(TEC2);
	TEC_cfg(TEC3);
	TEC_cfg(TEC4);

	LED_ALL();

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

	while (1) {

	}

	return 0;
}

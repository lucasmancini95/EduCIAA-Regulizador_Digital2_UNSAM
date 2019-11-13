/*****************************************************************************
 * Primer ejemplo de programa para la EDU-CIAA
 *
 * Funcionalidad: Encendido de un led, sin la utilizacion de librerias.
 *                Solo se trabaja con acceso directo a los registros de
 *                configuracion
 *
 * Materia: Electronica Digital II - 2017 (ECyT - UNSAM)
 *
 * Documentacion:
 *    - UM10503 (LPC43xx ARM Cortex-M4/M0 multi-core microcontroller User
 *      Manual)
 *    - PINES UTILIZADOS DEL NXP LPC4337 JBD144 (Ing. Eric Pernia)
 *****************************************************************************/

#include "Encender_Led.h"

#define SCU_BASE				0x40086000	// Direccion del System Control Unit <- decide que funcion tiene cada pin
#define	SFSP2_10				0x128		// Offset del registro de configurcion del pin

#define GPIO_BASE				0x400F4000	// Direccion del GPIO
#define	GPIO_PORT0_DIR_OFFSET	0x2000		// Offset del registro de direccion (DIR) del puerto 0
#define GPIO_PORT0_CLR_OFFSET	0x2280		// Offset del registro clear (CLR) del puerto 0
#define GPIO_PORT0_SET_OFFSET	0x2200		// Offset del registro set (SET) del puerto 0

int main(void) {
	
	//aca apunto a la direccion del registro + el offset que es donde configuro
	int *SFSP2_10_ptr = (int *)((SCU_BASE)+(SFSP2_10));					// Direccion del registro de
																// conf. del pin P2_10 (GPIO0[14])
	int *GPIO_PORT0_DIR_ptr = (int *)((GPIO_BASE)+(GPIO_PORT0_DIR_OFFSET));	// Direccion del registro de
																// direccion del pin P2_10
	int *GPIO_PORT0_CLR_ptr = (int *)((GPIO_BASE)+(GPIO_PORT0_CLR_OFFSET));	// Direccion del registro de
																// clear del pin P2_10
	int *GPIO_PORT0_SET_ptr = (int *)((GPIO_BASE)+(GPIO_PORT0_SET_OFFSET));	// Direccion del registro de
																// set del pin P2_10

	/***************************************************************************
	 * Configuracion del pin (LED1) como GPIO, con pull-up                     *
	 * (Registro de configuracion, pag 405 / Tabla 191)                        *
	 ***************************************************************************/
	// ADDRESS(SCU_BASE, SFSP2_10) = (SCU_MODE_EPUN | SCU_MODE_FUNC0);
	// SCU->SFSP[2][10] = (SCU_MODE_DES | SCU_MODE_FUNC0); // P2_10, GPIO0[14], LED1
	*SFSP2_10_ptr = (0x2 << 3) | (0x0); //corro el bit a la pos 4 y lo pongo  | esto elije que funcion
	//con esto configure el puerto como puerto de proposito general(gpio)
	//ahora tengo que determinar si lo quiero de entrada o salida
	//como es un led lo quiero de salida

	/***************************************************************************
	 * Configuracion del pin (LED1) como salida (Registro de direccion,        *
	 * pag 455 -> Tabla 261)                                                   *
	 ***************************************************************************/
	// Calculo de la direccion del regitro DIR
	//     ptr2 = GPIO_BASE + GPIO_PORT0_DIR_OFFSET
	*GPIO_PORT0_DIR_ptr |= (1 << 14);
	//al poner un 1 en la posicion 14 se comporta como salida
	
	/***************************************************************************
	 * Blanqueo del pin (LED1) (pag 456 -> Tabla 266)                          *
	 ***************************************************************************/
	// Calculo de la direccion del regitro CLR
	//     ptr3 = GPIO_BASE + GPIO_PORT0_CLR_OFFSET
	// *ptr3 |= (1 << 14);
	
	/***************************************************************************
	 * Encendido del led (LED1) (pag 456 -> Tabla 265)                         *
	 ***************************************************************************/
	// Calculo de la direccion del regitro SET
	//     ptr4 = GPIO_BASE + GPIO_PORT0_SET_OFFSET
	*GPIO_PORT0_SET_ptr |= (1 << 14);
	// pone un uno en la salida del pin, lo prende, sino pongo un uno en CLR lo apaga
	
	while (1) {//esto asi sin nada adentro es para que nunca llegue a return 0 y se quede de alguna forma loopeado
	}

	return 0;
}

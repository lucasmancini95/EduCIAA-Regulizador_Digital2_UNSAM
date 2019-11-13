//Escribir un código en C para prender todos los leds de manera secuencial
//(secuencia: R - G - B - Led1 - Led2 - Led3)

#include "Ejercicio_3.h"

#define SCU_BASE				0x40086000	// Direccion del System Control Unit <- decide que funcion tiene cada pin

#define	SFSP2_10				0x128		// Offset del registro de configurcion del pin
#define SFSP2_11				0x12C
#define SFSP2_12				0x130
#define SFSP2_0					0x100
#define SFSP2_1					0x104
#define SFSP2_2					0x108

#define GPIO_BASE				0x400F4000	// Direccion del GPIO
//Voy a usar GPIO0, GPIO1 y GPIO5

//puerto 0
#define	GPIO_PORT0_DIR_OFFSET	0x2000		// Offset del registro de direccion (DIR) del puerto 0
#define GPIO_PORT0_CLR_OFFSET	0x2280		// Offset del registro clear (CLR) del puerto 0
#define GPIO_PORT0_SET_OFFSET	0x2200		// Offset del registro set (SET) del puerto 0

//puerto 1
#define GPIO_PORT1_DIR_OFFSET 	0x2004		//offset del registro de direccion del puerto 1
#define GPIO_PORT1_CLR_OFFSET	0x2284		//Offset del registro clear del puerto 1
#define GPIO_PORT1_SET_OFFSET	0x2204		//offset del registro set del puerto 1

//puerto 5
#define GPIO_PORT5_DIR_OFFSET	0x2014
#define GPIO_PORT5_CLR_OFFSET	0x2294
#define GPIO_PORT5_SET_OFFSET	0x2214

int main(void) {

	//punteros que apuntan a la direccion del registro base del SCU + el offset del pin
	int *SFSP2_10_ptr = (int *)((SCU_BASE)+(SFSP2_10));
	//LED1
	int *SFSP2_11_ptr = (int*)((SCU_BASE)+(SFSP2_11));
	//LED2
	int *SFSP2_12_ptr = (int*)((SCU_BASE)+(SFSP2_12));
	//LED3
	int *SFSP2_0_ptr = (int*)((SCU_BASE)+(SFSP2_0));
	//LEDR
	int *SFSP2_1_ptr = (int*)((SCU_BASE)+(SFSP2_1));
	//LEDG
	int *SFSP2_2_ptr = (int*)((SCU_BASE)+(SFSP2_2));
	//LEDB

	//aca apunto a las "funciones" de GPIO
	int *GPIO_PORT0_DIR_ptr = (int *)((GPIO_BASE)+(GPIO_PORT0_DIR_OFFSET));

	int *GPIO_PORT0_CLR_ptr = (int *)((GPIO_BASE)+(GPIO_PORT0_CLR_OFFSET));

	int *GPIO_PORT0_SET_ptr = (int *)((GPIO_BASE)+(GPIO_PORT0_SET_OFFSET));

	int *GPIO_PORT1_DIR_ptr = (int *)((GPIO_BASE)+(GPIO_PORT1_DIR_OFFSET));
	int *GPIO_PORT1_CLR_ptr = (int *)((GPIO_BASE)+(GPIO_PORT1_CLR_OFFSET));
	int *GPIO_PORT1_SET_ptr = (int *)((GPIO_BASE)+(GPIO_PORT1_SET_OFFSET));

	int *GPIO_PORT5_DIR_ptr = (int *)((GPIO_BASE)+(GPIO_PORT5_DIR_OFFSET));
	int *GPIO_PORT5_CLR_ptr = (int *)((GPIO_BASE)+(GPIO_PORT5_CLR_OFFSET));
	int *GPIO_PORT5_SET_ptr = (int *)((GPIO_BASE)+(GPIO_PORT5_SET_OFFSET));

	//defino la funcion 0 o 4 en cada pin para que sean de proposito general (GPIO)
	*SFSP2_10_ptr=(0x0);
	*SFSP2_11_ptr=(0x0);
	*SFSP2_12_ptr=(0x0);
	*SFSP2_0_ptr=(0x4);
	*SFSP2_1_ptr=(0x4);
	*SFSP2_2_ptr=(0x4);

	//quiero que el periferico (puerto) sea de salida (para que se prenda y no esperar una instruccion del puerto)
	//necesito un 1 (salida) en donde me diga cada led [x] y pongo |= (OR) para solo cambiar ese bit y dejar todo lo demas igual
	*GPIO_PORT0_DIR_ptr |= (1 << 14);
	*GPIO_PORT1_DIR_ptr |= (1 << 11);
	*GPIO_PORT1_DIR_ptr |= (1 << 12);
	*GPIO_PORT5_DIR_ptr |= (1 << 0) | (1 << 1) | (1 << 2);
	//aca defini que todos sean de salida

	int i=0;
	int j=0;


	while (1) {
			//funcion modulo, se queda con el resto de la cantidad de casos que tengo
		switch (j % 6){
			case 0:
				*GPIO_PORT1_CLR_ptr |= (1 << 12);
				*GPIO_PORT5_SET_ptr |= (1<<0);//prendo el led rgb (rojo)
				break;

			case 1:
				*GPIO_PORT5_CLR_ptr |= (1<<0);//apago el led rgb(rojo)
				*GPIO_PORT5_SET_ptr |= (1<<1);
				break;

			case 2:
				*GPIO_PORT5_CLR_ptr |= (1<<1);
				*GPIO_PORT5_SET_ptr |= (1<<2);
				break;

			case 3:
				*GPIO_PORT5_CLR_ptr |= (1<<2);
				*GPIO_PORT0_SET_ptr |= (1 << 14);
				break;

			case 4:
				*GPIO_PORT0_CLR_ptr |= (1 << 14);
				*GPIO_PORT1_SET_ptr |= (1 << 11);
				break;

			case 5:
				*GPIO_PORT1_CLR_ptr |= (1 << 11);
				*GPIO_PORT1_SET_ptr |= (1 << 12);
				break;
		}

		for(i=0;i<10000000;i++){
		}//esto es como Delay() pero no hay que abusar

		j++;


	}

	return 0;
}

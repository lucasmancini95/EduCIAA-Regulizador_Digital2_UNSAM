/*
Este .h tendrá un estructura que apunta directamente a GPIO_BASE y a SCU_BASE por lo tanto moviendome por los campos (que tendran
el mismo tamaño o separación como estan en el micro) me voy a mover directamente por los registros en vez de tener que cargar
 y configurar los offsets.
*/

#define SCU_BASE			0X40086000 //direccion base del registro
#define SCU 				((SCU_T *) SCU_BASE) //Apunto la struct a la direccion de memoria base de los seteo de pines (creo)
#define GPIO_PORT_BASE		0x400F4000 //direccion base del registro
#define GPIO 			((GPIO_T *) GPIO_PORT_BASE) //Apunto la struct a la direccion de memoria base de los gpio

//por ejemplo si yo quiero usar el led 1 tengo que poner dentro del main (SCU->SFSP)[2][10] = 0x0 lo estoy declarando como gpio
//y lo estoy poniendo todas los demas valores tambien en 0




typedef struct {
	unsigned int  SFSP[16][32];
	unsigned int  RESERVED0[256];
	unsigned int  SFSCLK[4];
	unsigned int  RESERVED16[28];
	unsigned int  SFSUSB;	
	unsigned int  SFSI2C0;
	unsigned int  ENAIO[3];
	unsigned int  RESERVED17[27];
	unsigned int  EMCDELAYCLK;
	unsigned int  RESERVED18[63];
	unsigned int  PINTSEL[2];
} SCU_T;

typedef struct {			
	unsigned char B[128][32];
	unsigned int W[32][32];
	unsigned int DIR[32];
	unsigned int MASK[32];
	unsigned int PIN[32];
	unsigned int MPIN[32];
	unsigned int SET[32];
	unsigned int CLR[32];	
	unsigned int NOT[32];	
} GPIO_T;



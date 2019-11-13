

typedef enum{INPUT,OUTPUT}IO_t;
typedef enum{LOW,HIGH}state_t; //defino un tipo de dato para el estado que solo puede tomar los valores high o low

void GPIO_SetPinDIR(GPIO_T *pGPIO, unsigned char puerto, unsigned char pin, IO_t IO);
void GPIO_SetPin(GPIO_T *pGPIO, unsigned char puerto, unsigned char pin, state_t state); 
state_t GPIO_GetPinState(GPIO_T *pGPIO, unsigned char puerto, unsigned char pin);
int GPIO_GetPinDIR(GPIO_T *pGPIO, unsigned char puerto, unsigned char pin);
//void GPIO_SetPortDIR(GPIO_T *pGPIO, unsined char puerto, int mascara, state_t state);
int GPIO_GetPortDIR(GPIO_T *pGPIO, unsigned char puerto);

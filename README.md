# EduCIAA-Regulizador_Digital2_UNSAM
TP regulizador para la materia Digital 2 UNSAM.

Se diseñó un programa en lenguaje C (tocando directamente los registros del micro NXP de arquitectura ARM,absolutamente todas las bibliotecas fueron desarroladas), el cual permite obtener señales analógicas 
senoidales de 4 distintas frecuencias (1 kHz, 2kHz, 4kHz, 8kHz) y la suma de las posibles combinaciones de dichas frecuencias.
El programa se implementó en la placa EDU-CIAA 
y luego se interpretó el lenguaje assembly que generó el compilador a partir de los códigos del programa.

-Bibliografia utilizada:
  -manual NXP: UM10503 --> www.nxp.com
  -libro "The_Definitive_Guide_to_ARM_Cortex-M3_and_Cortex-M4" Joseph Yiu
  -pin out de la EDUCIAA: http://www.proyecto-ciaa.com.ar/devwiki/lib/exe/fetch.php?media=desarrollo:edu-ciaa:edu-ciaa-nxp_pinout_a4_v4r0_es.pdf

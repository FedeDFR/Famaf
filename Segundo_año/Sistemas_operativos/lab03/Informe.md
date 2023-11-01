# Informe
---
## Primera Parte

1. **¿Qué política de planificación utiliza xv6-riscv para elegir el próximo proceso a ejecutarse?**
Xv6-riscv utiliza la politica de planificacion RR (Round Robin). Esta respuesta se encuentra en la seccion 7.10 "Real World" del libro de Xv6. El codigo del planificador se encuentra en el archivo proc.c a partir de la linea 437.

2. **¿Cuánto dura un quantum en xv6-riscv?**
La duracion del quantum la podemos encontrar en el archivo start.c en la linea 69. Donde nos dice que es de 0.1 segundos aprox en qemu. Pero esto va a depender de la velocidad de cada procesador, ya que en realidad lo que se setea es la cantidad de ciclos permitidos. En este caso ese valor esta seteado en 1000000 ciclos. 

3. **¿Cuánto dura un cambio de contexto en xv6-riscv?**
La funcion swtch es la encargada del context switch. La cual en realidad es el archivo swtch.S y demora 28 instrucciones. 

4. **¿El cambio de contexto consume tiempo de un quantum?**
Si consume, se hablo del tema en una de las clases. (Se puede mejorar)

5. **¿Hay alguna forma de que a un proceso se le asigne menos tiempo?**
El Quantum dura siempre lo mismo, esta seteado como interrupcion global. Pero que pasa si un proceso termina de ejecutarse antes que finalice el Quantum? En ese caso el Quantum no se resetea, sino que el proximo proceso elegido tendra el tiempo faltante para completar el Quantum.

6. **¿Cúales son los estados en los que un proceso pueden permanecer en xv6-riscv y que los hace cambiar de estado?**
Los estados en los que pueden estar son: UNUSED, USED, SLEEPING, RUNNABLE, RUNNING y ZOMBIE. Estos se encuentran en proc.h linea 82.

---
## Segunda Parte

### Mediciones Q = Original

|                              | Datos                    |
| ---------------------------- | ------------------------ |
| Hardware                     |                          |
| Quantum                      |                          |
| Politica Scheduler           |                          |
| Caso                         |                          |
|                              |                          |
| Promedio MFLOPS / 100T       |                          |
| Promedio OPW / 100T          |                          |
| Promedio OPR / 100T          |                          |
|                              |                          |
| Cant. select IO              |                          |
| Cant. select CPU             |                          |


### Mediciones Q = Original/10



---
## Tercera Parte

---
## Cuarta Parte





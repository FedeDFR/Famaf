	.ifndef funciones_s
	.equ funciones_s, 0


	.equ SCREEN_WIDTH,   640
	.equ SCREEN_HEIGH,   480
	.equ HALF_WIDTH, 	 320
	.equ HALF_HEIGH, 	 240
	.equ BITS_PER_PIXEL, 32


	.equ GPIO_BASE,    0x3f200000
	.equ GPIO_GPFSEL0, 0x00
	.equ GPIO_GPLEV0,  0x34


	.equ key_w, 0x2
	.equ key_a, 0x4
	.equ key_s, 0x8
	.equ key_d, 0x10


	.include "dibujos.s"

//------------------------------------------ Calcular_Direccion --------------------------------------------------//


	Calcular_Direccion:

		sub sp,sp, #16  				//elimino mis 2 ultimos elementos de la pila
		str x15,[sp,#0]					// guardo y 
		str x14,[sp,#8]					// guardo x

		mov x1, SCREEN_WIDTH 			// Seteo x1 con el largo de pantalla 640
		mov x0, x20						// Seteo x0 en el primer pixel de la pantalla
		mov x3, xzr						// Seteo x3 en vacio

		madd x3, x15, x1, x14			// x3 = (x14 * 640) + x15, donde x14 = y, x15 = x 
		lsl x3, x3, 2					// x3 = x3 * 4
		add x0, x0, x3

		ldr x4,[sp,#8]  				//cargo x15 y x14 a sus valores originales y decremento la pila en 2 
		ldr x3, [sp,#0] 
		add sp,sp, #16 

	ret


//------------------------------------------ Fin Calcular_Direccion ----------------------------------------------//


//------------------------------------------ Delay ---------------------------------------------------------------//


	delay:

		movz x7, 0xFF, lsl 16
		movk x7, 0xFFF, lsl 00			// Delay

		delay_loop:

			subs x7, x7, 1
			bne delay_loop
			
		ret	


//------------------------------------------ Fin Delay -----------------------------------------------------------//


//------------------------------------------ Leer ---------------------------------------------------------------//


	Leer:

		mov x9, GPIO_BASE				//Seteo x9 en la direccion base de gpio
		
		// Setea gpios 0 - 9 como lectura
		str wzr, [x9, GPIO_GPFSEL0]

		// Lee el estado de los GPIO 0 - 31
		ldr w10, [x9, GPIO_GPLEV0]
		
		and w11, w10, key_w				//Mascara de w

		cmp w11, key_w
		beq ejec_w

	b Leer


//------------------------------------------ Fin Leer -----------------------------------------------------------//


//------------------------------------------ Ejecucion W ---------------------------------------------------------//


	ejec_w:
		
		sub sp, sp, 8
		stur x30, [sp]

		cmp x29,xzr
		beq set_1
		b set_0

	set_1:

		bl Fondo_Paralelo
		add x29, x29, 1
		b retorno_space

	set_0:

		bl Fondo_Dia
		mov x29, xzr			
		b retorno_space

	retorno_space:

	bl delay
	bl delay

	ldur x30,[sp]
	add sp,sp,8

	b Leer


//------------------------------------------ Fin Ejecucion W -----------------------------------------------------//


//------------------------------------------ Cuadrado ------------------------------------------------------------//


	Cuadrado:

		mov x13, 640
		sub x13, x13, x4				// x13 = 640 - x4
		lsl x13, x13, 2					// x13 = (640 - x4) * 4

		mov x2, x5 

	Cuadrado1:

		mov x1, x4 

	Cuadrado2:

		stur w10,[x0]  					// Colorear el pixel N
		add x0, x0, 4					// Siguiente pixel
		sub x1, x1, 1    				// Decrementar contador X
		cbnz x1, Cuadrado2
		add x0,x0, x13		  			// Si no terminó la fila, salto
		sub x2, x2, 1    				// Decrementar contador Y
		cbnz x2, Cuadrado1  			// Si no es la última fila, salto

		mov x0,x20

	ret


//------------------------------------------ Fin Cuadrado --------------------------------------------------------//


//------------------------------------------ Circulo -------------------------------------------------------------//


	circulo:	
				
		mov x27, xzr
		mov x26, xzr
		mov x25, xzr
		mov x24, xzr
		mov x23, xzr
		mov x22, xzr
		mov x11, xzr
		mov x12, xzr

		mov x24, x14					//guardo mis coordenadas del centro
		mov x25, x15

		sub x12, x14, x8				//x16 y x17 tienen mis coordenadas del incio del cuadrado
		sub x11, x15, x8

		sub sp,sp, #8  					//elimino mis 2 ultimos elementos de la pila
		str x30,[sp,#0]					//guardo x15 y x14
			
		//"pinto el cuadrado dependiendo si cumple las condiciones" de aca en adelante es muy parecido a la funcion cuadrado solo que pregunto si cumple la condicion de Calculo para pintar el pixel
		lsl x22, x8, 1					//Ysize

		loop_circ1:

		mov x14, x12
		mov x15, x11
		bl Calcular_Direccion
		lsl x23, x8, 1					//Xsize

		loop_circ2:

		bl Calculo						//hago los Calculos necesarios con pitagora para ver si la hipotenusa geenerada por la linea entre el centro del circulo y el pixel que estoy viendo 
		b.le Colorear					//coloreo el circulo
		bl Calcular_Direccion			//Calculo la Calcular_Direccion de mi x0

		Siguiente:

   		add x0, x0, 4					// Siguiente pixel
		add x12, x12, 1					//Siguiente coordenada en x
    	sub x23, x23, 1					// Decrementar contador de mi diametro
		
    	cbnz x23,loop_circ2 			// Si no terminó la fila, salto
		
		sub x22, x22, 1   				// Decrementar contador Y
		add x11, x11, 1					//Siguiente pixel en Y
		sub x12, x24, x8 				//pongo devuelta mi coordenadad de x En 0
		msub x0, x3, x8, x0				//vuelvo al princio de la linea que estoy pintado x0=x0-x1*4
		madd x0, x1, x3, x0  			//x0=x0+640*4
	  	cbnz x22, loop_circ1  			// Si no es la última fila, saltostur w11,[x20]


		ldr x30,[sp,#0]  				//cargo x15 y x14 a sus valores originales y decremento la pila en 2  
		add sp,sp, #8 

		mov x0,x20

		ret

		Colorear:

		stur w10,[x0]  					// Colorear el pixel N
		b Siguiente						//sigo viendo mis demas pixeles

		Calculo:						
			
		mov x26,x12						//salvo mis x1 y1
		mov x27,x11
			

		sub x26, x26, x24				// x26=x1-x0
		mul x26, x26, x26				//x26=x26 al cuadrado
		sub x27, x27, x25				//x27=y1-y0
		mul x27, x27, x27				//x27=x27 al cuadrado

		add x26, x27, x26				//x26=x27+x26
		mov x27, x8						//x27 ahora es el radio

		mul x27, x27, x27				//x27 es radio cuadrado
		cmp x26, x27					//x26 = x26 - diametro

		b.gt Siguiente					//si mi radio cuadrado en mayor extricto que mi x26 NO pinto ese pixel
		b Colorear						//si es menor lo pinto


//------------------------------------------ Circulo -------------------------------------------------------------//


//------------------------------------------ Triangulo Rectangulo A ----------------------------------------------//


	Triangulo_A:

		mov x1, SCREEN_WIDTH
		mov x3, 4
		mov x11, xzr
		mov x12, xzr
		mov x24, xzr
		mov x25, xzr
		mov x25, x5        				// salvo Y Size

	loop_tria_1:

		mov x24, x4         			// salvo X Size
		sub x24, x24, x12

	loop_tria_2:

		stur w10,[x0] 					// Colorear el pixel N
		add x0, x0 ,4   				// Siguiente pixel
		sub x24, x24, 1    				// Decrementar contador X
		cbnz x24, loop_tria_2  			// Si no terminó la fila, salto
			
		sub x25, x25, 1    				// Decrementar contador Y
		msub x0, x3, x4, x0				//vuelvo al princio de la linea que estoy pintado x0=x0-x1*4
		madd x0, x1, x3, x0  			//x0=x0+640*4
		add x12, x12, 1
		mul x11, x12, x3
		add x0, x0, x11
		cbnz x25, loop_tria_1  			// Si no es la última fila, saltostur w10,[x20]

		mov x0, x20

	ret


//------------------------------------------ Fin Triangulo Rectangulo A ------------------------------------------//


//------------------------------------------ Triangulo Rectangulo B ----------------------------------------------//


	Triangulo_B:

		mov x1, SCREEN_WIDTH
		mov x3, 4

		mov x11, xzr
		mov x12, xzr
		mov x24, xzr
		mov x25, xzr
		mov x25, x5        				// salvo Y Size

	loop_trib_1:

		mov x24, x4         			// salvo X Size
		sub x24, x24, x12

	loop_trib_2:

		stur w10,[x0] 					// Colorear el pixel N
		add x0, x0 ,4   					// Siguiente pixel
		sub x24, x24, 1    				// Decrementar contador X
		cbnz x24, loop_trib_2  			// Si no terminó la fila, salto
			
		sub x25, x25, 1    				// Decrementar contador Y
		msub x0, x3, x4, x0				//vuelvo al princio de la linea que estoy pintado x0=x0-x1*4
		msub x0, x1, x3, x0  				//x0=x0+640*4
		add x12, x12, 1
		mul x11, x12, x3
		add x0, x0, x11
		cbnz x25, loop_trib_1  			// Si no es la última fila, saltostur w10,[x20]

		mov x0, x20

	ret


//------------------------------------------ Fin Triangulo Rectangulo B ------------------------------------------//


//------------------------------------------ Triangulo Rectangulo C ----------------------------------------------//


	Triangulo_C:

		mov x1, SCREEN_WIDTH
		mov x3, 4

		mov x11, xzr
		mov x12, x4
		mov x25, x5        				// salvo Y Size
		mov x13, 1

	loop_tric_1:

		mov x24, x13         			// salvo X Size

	loop_tric_2 :

		stur w10,[x0] 					// Colorear el pixel N
		add x0, x0, 4   				// Siguiente pixel
		sub x24, x24, 1    				// Decrementar contador X
		cbnz x24, loop_tric_2  			// Si no terminó la fila, salto
			
		sub x25,x25,1    				// Decrementar contador Y
		msub x0, x3, x13, x0			//vuelvo al princio de la linea que estoy pintado x0=x0-x1*4
		madd x0, x1, x3, x0  			//x0=x0+640*4
		add x13, x13, 1
		
		cbnz x25, loop_tric_1  			// Si no es la última fila, saltostur w11,[x20]

		mov x0,x20

	ret


//------------------------------------------ Fin Triangulo Rectangulo C ------------------------------------------//


//------------------------------------------ Triangulo Rectangulo D ----------------------------------------------//


	Triangulo_D:
	
		mov x1, SCREEN_WIDTH
		mov x3, 4
			
		mov x11, xzr
		mov x12, x4
		mov x25, x5        				// salvo Y Size
		mov x13, 1

	loop_trid_1:

		mov x24, x13         			// salvo X Size

	loop_trid_2:

		stur w10,[x0] 					// Colorear el pixel N
		add x0, x0, 4   				// Siguiente pixel
		sub x24, x24, 1    				// Decrementar contador X
		cbnz x24, loop_trid_2  			// Si no terminó la fila, salto
			
		sub x25, x25, 1    				// Decrementar contador Y
		msub x0, x3, x13, x0			//vuelvo al princio de la linea que estoy pintado x0=x0-x1*4
		msub x0, x1, x3, x0  			//x0=x0+640*4
		add x13, x13, 1
		
		cbnz x25, loop_trid_1   		// Si no es la última fila, saltostur w11,[x20]

		mov x0,x20

	ret


//------------------------------------------ Fin Triangulo Rectangulo D ------------------------------------------//


//------------------------------------------ Fondo ---------------------------------------------------------------//


	Fondo:

		mov x2, xzr
		mov x1, xzr

		mov x2, SCREEN_HEIGH         	// Y Size

	Fondo1:

		mov x1, SCREEN_WIDTH        	// X Size

	Fondo2:

		stur w10,[x0]  					// Colorear el pixel N
		add x0,x0,4 					// Siguiente pixel
		sub x1,x1,1    					// Decrementar contador X
		cbnz x1,Fondo2  				// Si no terminó la fila, salto
		sub x2,x2,1    					// Decrementar contador Y
		cbnz x2,Fondo1 					// Si no es la última fila, salto

	ret


//------------------------------------------ Fin Fondo -----------------------------------------------------------//


.endif

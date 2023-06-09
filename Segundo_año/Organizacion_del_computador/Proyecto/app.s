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

	.globl main
//------------------------------------------ Main ------------------------------------------//

main:

//------------------------------------------ Definicion de variables ------------------------------------------//


									// x0 contiene la Calcular_Direccion base del framebuffer
	mov x20, x0 					// Guarda la dirección base del framebuffer en x20
	mov x19, xzr					// Posicion 00 de Sol de y
	mov x18, xzr					// Posicion 00 de Sol de x
	mov x17, xzr					// Posicion 00 de Link de y
	mov x16, xzr					// Posicion 00 de Link de x
	mov x14, xzr					// Cordenada de x
	mov x15, xzr					// Cordenada de y
	mov x10, xzr					// Color
	mov x9, xzr						// 
	mov x8, xzr						// Radio
	movz x7, 0xFFFF, lsl 00 		// Retardo
	movk x7, 0xFFF, lsl 16
	mov x6, xzr						// el cero
	mov x5, xzr 					// Tamaño y
	mov x4, xzr 					// Tamaño x
	mov x3, 4						// 4
	mov x2, SCREEN_HEIGH			// Alto
	mov x1, SCREEN_WIDTH			// Ancho


//------------------------------------------ Fin Definicion de variables ------------------------------------------//

	bl Fondo_Dia

	bl Leer

	bl Fondo_Dia

	bl InfLoop

//------------------------------------------ Fin Main ------------------------------------------//


//------------------------------------------ Fondo Dia ------------------------------------------//

	Fondo_Dia:

		sub sp,sp, #8  
		str x30,[sp,#0]

		mov x15, 0						// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x18, lsl 16
		movk x10, 0x0E0B, lsl 00		// Color
		mov x5, 480						// Tamaño de y
		mov x4, SCREEN_WIDTH			// Tamaño de x
		bl Cuadrado

		mov x15, 0						// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x30, lsl 16
		movk x10, 0x1C16, lsl 00		// Color
		mov x5, 470						// Tamaño de y
		mov x4, SCREEN_WIDTH			// Tamaño de x
		bl Cuadrado

		mov x15, 0						// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x56, lsl 16			
		movk x10, 0x3227, lsl 00		// Color
		mov x5, 465						// Tamaño de y
		mov x4, SCREEN_WIDTH			// Tamaño de x
		bl Cuadrado

		mov x15, 0						// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16			// Verde		
		movk x10, 0x2106, lsl 00		// Color
		mov x5, 450						// Tamaño de y
		mov x4, SCREEN_WIDTH			// Tamaño de x
		bl Cuadrado

		mov x15, 0						// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8319, lsl 00		// Color
		mov x5, 440						// Tamaño de y
		mov x4, SCREEN_WIDTH			// Tamaño de x
		bl Cuadrado

		mov x15, 0						// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xC0, lsl 16			// Cielo
		movk x10, 0xEEFE, lsl 00		// Color
		mov x5, 350						// Tamaño de y
		mov x4, SCREEN_WIDTH			// Tamaño de x
		bl Cuadrado

		mov x15, 0						// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x83, lsl 16
		movk x10, 0xE3FF, lsl 00		// Color
		mov x5, 290						// Tamaño de y
		mov x4, SCREEN_WIDTH			// Tamaño de x
		bl Cuadrado

		mov x15, 0						// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x74, lsl 16
		movk x10, 0xD1FF, lsl 00		// Color
		mov x5, 200						// Tamaño de y
		mov x4, SCREEN_WIDTH			// Tamaño de x
		bl Cuadrado

		// Pasto Textura

		mov x15, 430					// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 50						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 30						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 420					// Cordenada de y
		mov x14, 60						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 400					// Cordenada de y
		mov x14, 50						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		mov x15, 390					// Cordenada de y
		mov x14, 10						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		mov x15, 380					// Cordenada de y
		mov x14, xzr					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 370					// Cordenada de y
		mov x14, 40						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 430					// Cordenada de y
		mov x14, 90						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 110						// Tamaño de x
		bl Cuadrado

		mov x15, 420					// Cordenada de y
		mov x14, 120					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 90					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 130					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 150					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 390					// Cordenada de y
		mov x14, 90						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 390					// Cordenada de y
		mov x14, 140					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 400					// Cordenada de y
		mov x14, 170					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		mov x15, 370					// Cordenada de y
		mov x14, 110					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 370					// Cordenada de y
		mov x14, 160					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 430					// Cordenada de y
		mov x14, 210					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 50						// Tamaño de x
		bl Cuadrado

		mov x15, 430					// Cordenada de y
		mov x14, 290					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 150						// Tamaño de x
		bl Cuadrado

		mov x15, 420					// Cordenada de y
		mov x14, 170					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 210					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 230					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		mov x15, 420					// Cordenada de y
		mov x14, 270					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 420					// Cordenada de y
		mov x14, 320					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 290					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		// Copia

		mov x15, 430					// Cordenada de y
		mov x14, 300						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 50						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 300						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 330						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 420					// Cordenada de y
		mov x14, 560						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 400					// Cordenada de y
		mov x14, 550						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		mov x15, 390					// Cordenada de y
		mov x14, 510						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		mov x15, 380					// Cordenada de y
		mov x14, 500					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 370					// Cordenada de y
		mov x14, 540						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado
		bl Sol

		mov x15, 410					// Cordenada de y
		mov x14, 500						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 530						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 420					// Cordenada de y
		mov x14, 560						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 400					// Cordenada de y
		mov x14, 550						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		mov x15, 390					// Cordenada de y
		mov x14, 510						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		mov x15, 380					// Cordenada de y
		mov x14, 500					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 420					// Cordenada de y
		mov x14, 370					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		mov x15, 400					// Cordenada de y
		mov x14, 350					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Cuadrado

		mov x15, 390					// Cordenada de y
		mov x14, 320					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 390					// Cordenada de y
		mov x14, 280					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 390					// Cordenada de y
		mov x14, 240					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 380					// Cordenada de y
		mov x14, 230					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 380					// Cordenada de y
		mov x14, 180					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 380					// Cordenada de y
		mov x14, 300					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 380					// Cordenada de y
		mov x14, 360					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 380					// Cordenada de y
		mov x14, 380					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 370					// Cordenada de y
		mov x14, 30						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 420					// Cordenada de y
		mov x14, 440						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		mov x15, 430					// Cordenada de y
		mov x14, 470					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 60						// Tamaño de x
		bl Cuadrado


		mov x15, 430					// Cordenada de y
		mov x14, 570					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 60						// Tamaño de x
		bl Cuadrado

		mov x15, 430					// Cordenada de y
		mov x14, 570					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 60						// Tamaño de x
		bl Cuadrado

		mov x15, 390					// Cordenada de y
		mov x14, 590					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 60						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 570					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 610					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 400					// Cordenada de y
		mov x14, 460					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 390					// Cordenada de y
		mov x14, 430					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		mov x15, 370					// Cordenada de y
		mov x14, 450					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 370					// Cordenada de y
		mov x14, 450					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x16, 150					// Posicion 00 de Arbol de x
		mov x17, 120					// Posicion 00 de Arbol de y
		bl Arbol

		mov x16, 10						// Posicion 00 de Arbol de x
		mov x17, 110					// Posicion 00 de Arbol de y
		bl Arbol

		mov x16, 100					// Posicion 00 de Arbol de x
		mov x17, 150					// Posicion 00 de Arbol de y
		bl Arbol

		mov x16, 210					// Posicion 00 de Arbol de x
		mov x17, 110					// Posicion 00 de Arbol de y
		bl Arbol

		mov x16, 360					// Posicion 00 de Arbol de x
		mov x17, 120					// Posicion 00 de Arbol de y
		bl Arbol

		mov x16, 100					// Posicion 00 de Flor de x
		mov x17, 330					// Posicion 00 de Flor de y
		bl Flor

		mov x16, 510					// Posicion 00 de Flor de x
		mov x17, 360					// Posicion 00 de Flor de y
		bl Flor

		mov x16, 0					// Posicion 00 de Flor de x
		mov x17, 360					// Posicion 00 de Flor de y
		bl Flor

		mov x16, 250					// Posicion 00 de Link de x
		mov x17, 110					// Posicion 00 de Link de y
		bl Link

		ldr x30,[sp,#0]  				  
		add sp,sp, #8

	ret

//------------------------------------------ Fin Fondo Dia ------------------------------------------//


//------------------------------------------ Fondo Paralelo ------------------------------------------//

	Fondo_Paralelo:

		sub sp,sp, #8  
		str x30,[sp,#0]

		mov x15, 0						// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xFFFF, lsl 00		// Color
		mov x5, HALF_HEIGH				// Tamaño de y
		mov x4, SCREEN_WIDTH			// Tamaño de x
		bl Cuadrado

		mov x8, 110						//radio
		mov x15, HALF_HEIGH				// Cordenada de y
		mov x14, 140					// Cordenada de x
		movz x10, 0xC0, lsl 16	    
		movk x10, 0xEAFF, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 20						//radio
		mov x15, 40						// Cordenada de y
		mov x14, 140					// Cordenada de x
		movz x10, 0xC0, lsl 16	    
		movk x10, 0xEAFF, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 40						//radio
		mov x15, 100					// Cordenada de y
		mov x14, 250					// Cordenada de x
		movz x10, 0xC0, lsl 16	    
		movk x10, 0xEAFF, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 10						//radio
		mov x15, 30						// Cordenada de y
		mov x14, 450					// Cordenada de x
		movz x10, 0xC0, lsl 16	    
		movk x10, 0xEAFF, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 30						//radio
		mov x15, 300					// Cordenada de y
		mov x14, 300					// Cordenada de x
		movz x10, 0xC0, lsl 16	    
		movk x10, 0xEAFF, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 20						//radio
		mov x15, 400					// Cordenada de y
		mov x14, 40						// Cordenada de x
		movz x10, 0xC0, lsl 16	    
		movk x10, 0xEAFF, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 10						//radio
		mov x15, 450					// Cordenada de y
		mov x14, 260					// Cordenada de x
		movz x10, 0xC0, lsl 16	    
		movk x10, 0xEAFF, lsl 00 
		bl Calcular_Direccion
		bl circulo

		// Trifuerza

		add x19, x17, 270				
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Triangulo_B

		add x19, x17, 231				
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Triangulo_C

		add x19, x17, 270				
		add x18, x16, 140 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Triangulo_B

		add x19, x17, 231				
		add x18, x16, 180 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Triangulo_C

		add x19, x17, 230				
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Triangulo_B

		add x19, x17, 191				
		add x18, x16, 140 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Triangulo_C

		mov x16, 250					// Posicion 00 de Link de x
		mov x17, 110					// Posicion 00 de Link de y
		bl Link

		ldr x30,[sp,#0]  				  
		add sp,sp, #8

	ret

//------------------------------------------ Fin Fondo Paralelo ------------------------------------------//



//------------------------------------------ Flor ------------------------------------------//


	Flor:

		sub sp,sp, #8  
		str x30,[sp,#0]

		mov x8, 7						//radio
		add x19, x17, 50
		add x18, x16, 63
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		movz x10, 0xCC, lsl 16	    
		movk x10, 0x0086, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 7						//radio
		add x19, x17, 50
		add x18, x16, 37
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		movz x10, 0xCC, lsl 16	    
		movk x10, 0x0086, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 7						//radio
		add x19, x17, 63
		add x18, x16, 50
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x	
		movz x10, 0xCC, lsl 16	    
		movk x10, 0x0086, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 7						//radio
		add x19, x17, 37
		add x18, x16, 50
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		movz x10, 0xCC, lsl 16	    
		movk x10, 0x0086, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 8						//radio
		add x19, x17, 42
		add x18, x16, 41
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		movz x10, 0x80, lsl 16	    
		movk x10, 0x0054, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 8						//radio
		add x19, x17, 57
		add x18, x16, 41
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		movz x10, 0x80, lsl 16	    
		movk x10, 0x0054, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 8						//radio
		add x19, x17, 42
		add x18, x16, 57
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		movz x10, 0x80, lsl 16	    
		movk x10, 0x0054, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 8						//radio
		add x19, x17, 57
		add x18, x16, 57
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		movz x10, 0x80, lsl 16	    
		movk x10, 0x0054, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8, 8						//radio
		add x19, x17, 50
		add x18, x16, 50
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		movz x10, 0xFF, lsl 16	    
		movk x10, 0xF300, lsl 00 
		bl Calcular_Direccion
		bl circulo

		ldr x30,[sp,#0]  				  
		add sp,sp, #8

	ret

//------------------------------------------ Flor ------------------------------------------//


//------------------------------------------ Arbol ------------------------------------------//

	Arbol:

		// Tronco

		sub sp,sp, #8  
		str x30,[sp,#0]

		add x19, x17, 150
		add x18, x16, 77
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x4E, lsl 16
		movk x10, 0x342E, lsl 00		// Color
		mov x5, 100						// Tamaño de y
		mov x4, 25						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170
		add x18, x16, 79
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x25, lsl 16
		movk x10, 0x1914, lsl 00		// Color
		mov x5, 50						// Tamaño de y
		mov x4, 2						// Tamaño de x
		bl Cuadrado

		add x19, x17, 210
		add x18, x16, 82
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x25, lsl 16
		movk x10, 0x1914, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 2						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170
		add x18, x16, 85
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x25, lsl 16
		movk x10, 0x1914, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 2						// Tamaño de x
		bl Cuadrado

		add x19, x17, 220
		add x18, x16, 86
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x25, lsl 16
		movk x10, 0x1914, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 2						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170
		add x18, x16, 91
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x25, lsl 16
		movk x10, 0x1914, lsl 00		// Color
		mov x5, 80						// Tamaño de y
		mov x4, 2						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170
		add x18, x16, 99
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x25, lsl 16
		movk x10, 0x1914, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 2						// Tamaño de x
		bl Cuadrado

		add x19, x17, 214
		add x18, x16, 97
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x25, lsl 16
		movk x10, 0x1914, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 2						// Tamaño de x
		bl Cuadrado

		// Primera copa

		add x19, x17, 190				
		add x18, x16, xzr 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x2606, lsl 00		// Color
		mov x5, 90						// Tamaño de y
		mov x4, 90						// Tamaño de x
		bl Triangulo_B

		add x19, x17, 170				
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x5F10, lsl 00		// Color
		mov x5, 70						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Triangulo_B

		add x19, x17, 101				
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x2606, lsl 00		// Color
		mov x5, 90						// Tamaño de y
		mov x4, 90						// Tamaño de x
		bl Triangulo_C

		add x19, x17, 101				
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x5F10, lsl 00		// Color
		mov x5, 70						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Triangulo_C


		// Segunda copa

		add x19, x17, 140				
		add x18, x16, xzr 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x2606, lsl 00		// Color
		mov x5, 90						// Tamaño de y
		mov x4, 90						// Tamaño de x
		bl Triangulo_B

		add x19, x17, 120				
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x5F10, lsl 00		// Color
		mov x5, 70						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Triangulo_B

		add x19, x17, 51				
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x2606, lsl 00		// Color
		mov x5, 90						// Tamaño de y
		mov x4, 90						// Tamaño de x
		bl Triangulo_C

		add x19, x17, 51				
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x5F10, lsl 00		// Color
		mov x5, 70						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Triangulo_C

		// Tercera copa

		add x19, x17, 90				
		add x18, x16, xzr 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x2606, lsl 00		// Color
		mov x5, 90						// Tamaño de y
		mov x4, 90						// Tamaño de x
		bl Triangulo_B

		add x19, x17, 70				
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x5F10, lsl 00		// Color
		mov x5, 70						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Triangulo_B

		add x19, x17, 1				
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x2606, lsl 00		// Color
		mov x5, 90						// Tamaño de y
		mov x4, 90						// Tamaño de x
		bl Triangulo_C

		add x19, x17, 1				
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x5F10, lsl 00		// Color
		mov x5, 70						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Triangulo_C


		ldr x30,[sp,#0]  				  
		add sp,sp, #8

	ret

//------------------------------------------ Fin Arbol ------------------------------------------//


//------------------------------------------ Sol ------------------------------------------//

	Sol:

		sub sp,sp, #8  
		str x30,[sp,#0]

		mov x8,50									//radio
		mov x15,80									//centro
		mov x14,70		
		movz x10, 0xFF, lsl 16	    
		movk x10, 0xAF00, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8,40									//radio
		mov x15,80									//centro
		mov x14,70		
		movz x10, 0xFF, lsl 16	    
		movk x10, 0xE200, lsl 00 
		bl Calcular_Direccion
		bl circulo

		ldr x30,[sp,#0]  				  
		add sp,sp, #8

	ret

//------------------------------------------ Fin Sol ------------------------------------------//


//------------------------------------------ Link ------------------------------------------//

	Link:

		sub sp,sp, #8  
		str x30,[sp,#0]


	//----- Escudo -----//

		add x19, x17, 130
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x4E, lsl 16
		movk x10, 0x342E, lsl 00		// Color
		mov x5, 90						// Tamaño de y
		mov x4, 90						// Tamaño de x
		bl Cuadrado

		add x19, x17, 220
		add x18, x16, 30 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x4E, lsl 16
		movk x10, 0x342E, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Cuadrado

		add x19, x17, 230
		add x18, x16, 40 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x4E, lsl 16
		movk x10, 0x342E, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 50						// Tamaño de x
		bl Cuadrado

		add x19, x17, 240
		add x18, x16, 50 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x4E, lsl 16
		movk x10, 0x342E, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120
		add x18, x16, 10 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 100						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110
		add x18, x16, 0 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 110						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 220
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 230
		add x18, x16, 30 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 240
		add x18, x16, 40 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 250
		add x18, x16, 50 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 260
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 240
		add x18, x16, 80 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 230
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 220
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 220
		add x18, x16, 10 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 230
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 240
		add x18, x16, 30 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 250
		add x18, x16, 40 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 260
		add x18, x16, 50 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 270
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 260
		add x18, x16, 70 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 250
		add x18, x16, 80 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 240
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 230
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120
		add x18, x16, 10 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 50						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110
		add x18, x16, 0 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 60						// Tamaño de x
		bl Cuadrado

	//----- Fin Escudo -----//

	//----- Cara -----//

		add x19, x17, 80				// Cara grande
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xe0DB, lsl 00		// Color
		mov x5, 60						// Tamaño de y
		mov x4, 100						// Tamaño de x
		bl Cuadrado

		add x19, x17, 80				// Linea del costado de la cara
		add x18, x16, 50 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 60						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 140
		add x18, x16, 70 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xe0DB, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 90						// Tamaño de x
		bl Cuadrado

		add x19, x17, 150
		add x18, x16, 80 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xe0DB, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Cuadrado

		add x19, x17, 140
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 150
		add x18, x16, 70 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 160				//linea abajo de cara
		add x18, x16, 80 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Cuadrado

		add x19, x17, 150				
		add x18, x16, 150 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120				// Linea negra derecha
		add x18, x16, 160 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110				// Ojo
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xFFFF, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110				
		add x18, x16, 110 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				// Nariz
		add x18, x16, 70 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x8D, lsl 16
		movk x10, 0x5524, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xFFFF, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 100
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110
		add x18, x16, 70 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 100
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110				
		add x18, x16, 140 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x8D, lsl 16
		movk x10, 0x5524, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

	//----- Pelo -----//

		add x19, x17, 70				
		add x18, x16, 160 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 50						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 80				
		add x18, x16, 160 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120				// Ariba de oreja
		add x18, x16, 170 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 70				
		add x18, x16, 180 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 50						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 60
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 150						// Tamaño de x
		bl Cuadrado

		add x19, x17, 40				// Linea arriba larga
		add x18, x16, 40 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 120						// Tamaño de x
		bl Cuadrado

		add x19, x17, 80
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 90
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 80
		add x18, x16, 80
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 70				// Fleco
		add x18, x16, 80 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 100				// Fleco
		add x18, x16, 70 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 70
		add x18, x16, 140 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 80
		add x18, x16, 130 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 90
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 80
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 60						// Tamaño de x
		bl Cuadrado

		add x19, x17, 70
		add x18, x16, 10 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 60
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 50
		add x18, x16, 30 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 40
		add x18, x16, 40 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 30
		add x18, x16, 50 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 100						// Tamaño de x
		bl Cuadrado

		add x19, x17, 60				
		add x18, x16, 170 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 50				
		add x18, x16, 160 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 40				
		add x18, x16, 150 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB2, lsl 16
		movk x10, 0x8704, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

	//----- Gorro -----//

		add x19, x17, 10				
		add x18, x16, 80 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 110						// Tamaño de x
		bl Cuadrado

		add x19, x17, 30				
		add x18, x16, 150 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 30				
		add x18, x16, 160 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 50						// Tamaño de x
		bl Cuadrado

		add x19, x17, 50				
		add x18, x16, 170 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 50				
		add x18, x16, 180 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 70				
		add x18, x16, 190 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 60						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 190 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado
		

		add x19, x17, 20				// Borde
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 10				
		add x18, x16, 80 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 0				
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Cuadrado

		add x19, x17, 10				
		add x18, x16, 160 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 20				
		add x18, x16, 190 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 30				
		add x18, x16, 200 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 40				
		add x18, x16, 210 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 60				
		add x18, x16, 220 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 70						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 210 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 170 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xe0DB, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120				
		add x18, x16, 180 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xe0DB, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110				
		add x18, x16, 190 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xe0DB, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 100				
		add x18, x16, 190 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110				
		add x18, x16, 200 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120				
		add x18, x16, 190 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 180 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x8D, lsl 16
		movk x10, 0x5524, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 140				
		add x18, x16, 170 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x8D, lsl 16
		movk x10, 0x5524, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 140				
		add x18, x16, 190 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x8D, lsl 16
		movk x10, 0x5524, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 140				
		add x18, x16, 180 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xE207, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

	//----- Fin Gorrro -----//

	//----- Cuerpo -----//


		add x19, x17, 150				
		add x18, x16, 160 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 50						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170				
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 90						// Tamaño de y
		mov x4, 80						// Tamaño de x
		bl Cuadrado

		add x19, x17, 160				
		add x18, x16, 150 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 180				
		add x18, x16, 140 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 190				
		add x18, x16, 130 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 180				
		add x18, x16, 120 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170				
		add x18, x16, 110 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170				
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 180				
		add x18, x16, 50 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 190				
		add x18, x16, 30 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xE0BD, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170				
		add x18, x16, 40 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 50						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 180				
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 180				
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 210				
		add x18, x16, 20 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170				
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 200				
		add x18, x16, 70 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 200				
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 190				
		add x18, x16, 80 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 190				
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 50						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 240				
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 230				
		add x18, x16, 110 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x8D, lsl 16
		movk x10, 0x5524, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Cuadrado

		add x19, x17, 220				
		add x18, x16, 110 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xB3, lsl 16
		movk x10, 0x6C2D, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 70						// Tamaño de x
		bl Cuadrado

		add x19, x17, 220				
		add x18, x16, 120 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xEB3B, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 220				
		add x18, x16, 120 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 220				
		add x18, x16, 140 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 230				
		add x18, x16, 130 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 190				
		add x18, x16, 180 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 60						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 250				
		add x18, x16, 190 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 250				
		add x18, x16, 180 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 260				
		add x18, x16, 80 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 120						// Tamaño de x
		bl Cuadrado

		add x19, x17, 250				
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x4D00, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 100						// Tamaño de x
		bl Cuadrado

		add x19, x17, 260				
		add x18, x16, 70 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 270				
		add x18, x16, 60 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 280				
		add x18, x16, 50 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x8D, lsl 16
		movk x10, 0x5524, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 280				
		add x18, x16, 50 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 290				
		add x18, x16, 40 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 300				
		add x18, x16, 40 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 50						// Tamaño de x
		bl Cuadrado

		add x19, x17, 290				
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 280				
		add x18, x16, 100 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 280				
		add x18, x16, 90 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 270				
		add x18, x16, 110 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 270				
		add x18, x16, 150 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 280				
		add x18, x16, 160 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 300				
		add x18, x16, 170 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 280				
		add x18, x16, 170 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x8D, lsl 16
		movk x10, 0x5524, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 290				
		add x18, x16, 210 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 260				
		add x18, x16, 200 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 270				
		add x18, x16, 160 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 150				
		add x18, x16, 200 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170				
		add x18, x16, 240 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x8000, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 150				
		add x18, x16, 200 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 180				
		add x18, x16, 190 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 160				
		add x18, x16, 240 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170				
		add x18, x16, 250 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 200				
		add x18, x16, 260 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xE0BD, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 180				
		add x18, x16, 260 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 190				
		add x18, x16, 220 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 200				
		add x18, x16, 240 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x01, lsl 16
		movk x10, 0x2608, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 200				
		add x18, x16, 250 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 210				
		add x18, x16, 250 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 200				
		add x18, x16, 280 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 50						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170				
		add x18, x16, 280 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				// 1																	
		add x18, x16, 280 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 280 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120				// 2
		add x18, x16, 290 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120					
		add x18, x16, 290 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110				// 3
		add x18, x16, 300 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110				
		add x18, x16, 300 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 100				// 4
		add x18, x16, 310 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 100				
		add x18, x16, 310 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 90				// 5
		add x18, x16, 320 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 90				
		add x18, x16, 320 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 80				//6
		add x18, x16, 330 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 80				
		add x18, x16, 330 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 70				
		add x18, x16, 340 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 70				
		add x18, x16, 370 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 100				
		add x18, x16, 360 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110				
		add x18, x16, 350 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120				
		add x18, x16, 340 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 330 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 140				
		add x18, x16, 320 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 150				
		add x18, x16, 310 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 160				
		add x18, x16, 300 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 180				
		add x18, x16, 320 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170				
		add x18, x16, 310 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 190				
		add x18, x16, 270 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 180				
		add x18, x16, 270 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x30, lsl 16
		movk x10, 0x3D8C, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170				
		add x18, x16, 280 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x30, lsl 16
		movk x10, 0x3D8C, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 160				
		add x18, x16, 270 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x30, lsl 16
		movk x10, 0x3D8C, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 170				
		add x18, x16, 260 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xE207, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 150				
		add x18, x16, 290 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xFFFF, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 140				
		add x18, x16, 300 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xFFFF, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 310 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xFFFF, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120				
		add x18, x16, 320 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xFFFF, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110				
		add x18, x16, 330 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xFFFF, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 100				
		add x18, x16, 340 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xFFFF, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 90				
		add x18, x16, 350 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xFFFF, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 80				
		add x18, x16, 360 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xFFFF, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 180				
		add x18, x16, 280 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 190				
		add x18, x16, 280 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Cuadrado

		add x19, x17, 140				
		add x18, x16, 280 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 290 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120				
		add x18, x16, 300 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 110				
		add x18, x16, 310 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 100				
		add x18, x16, 320 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 90				
		add x18, x16, 330 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 80				
		add x18, x16, 340 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 150				
		add x18, x16, 270 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 140				
		add x18, x16, 270 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 260 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 120				
		add x18, x16, 240 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 230 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 240 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 150				
		add x18, x16, 250 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xAB, lsl 16
		movk x10, 0xC8D1, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 160				
		add x18, x16, 250 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 130				
		add x18, x16, 240 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x6C, lsl 16
		movk x10, 0x7E84, lsl 00		// Color
		mov x5, 30						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 210				
		add x18, x16, 220 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x35, lsl 16
		movk x10, 0x425E, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		add x19, x17, 200				
		add x18, x16, 220 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 200				
		add x18, x16, 220 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 210				
		add x18, x16, 210 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 20						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		add x19, x17, 230				
		add x18, x16, 220 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		add x19, x17, 220				
		add x18, x16, 240 
		mov x15, x19					// Cordenada de y
		mov x14, x18					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		ldr x30,[sp,#0]  				 
		add sp,sp, #8

	ret



//------------------------------------------ Fin Link ------------------------------------------//



//------------------------------------------ Cuadrado ------------------------------------------//

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

//------------------------------------------ Fin Cuadrado ------------------------------------------//


//------------------------------------------ Triangulo Rectangulo A ------------------------------------------//


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
		add x0, x0 ,4   					// Siguiente pixel
		sub x24, x24, 1    				// Decrementar contador X
		cbnz x24, loop_tria_2  			// Si no terminó la fila, salto
			
		sub x25, x25, 1    				// Decrementar contador Y
		msub x0, x3, x4, x0				//vuelvo al princio de la linea que estoy pintado x0=x0-x1*4
		madd x0, x1, x3, x0  				//x0=x0+640*4
		add x12, x12, 1
		mul x11, x12, x3
		add x0, x0, x11
		cbnz x25, loop_tria_1  			// Si no es la última fila, saltostur w10,[x20]

		mov x0, x20

	ret


//------------------------------------------ Fin Triangulo Rectangulo A ------------------------------------------//


//------------------------------------------ Triangulo Rectangulo B ------------------------------------------//


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


//------------------------------------------ Triangulo Rectangulo C ------------------------------------------//


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


//------------------------------------------ Triangulo Rectangulo D ------------------------------------------//

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


//------------------------------------------ Circulo ------------------------------------------//


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


//------------------------------------------ Circulo ------------------------------------------//


//------------------------------------------ Input ------------------------------------------//


	Leer:
		mov x9, GPIO_BASE					//Seteo x9 en la direccion base de gpio
		
		// Setea gpios 0 - 9 como lectura
		str wzr, [x9, GPIO_GPFSEL0]

		// Lee el estado de los GPIO 0 - 31
		ldr w10, [x9, GPIO_GPLEV0]
		
		and w11, w10, key_w					//Mascara de w

		cmp w11, key_w
		beq ejec_w
	ret


//------------------------------------------ Fin Input ------------------------------------------//


//------------------------------------------ Ejecucion W ------------------------------------------//


	ejec_w:
		
		bl Fondo_Paralelo

		loop:
			sub x7, x7, 1
			cbnz x7, loop

	b Leer

//------------------------------------------ Fin Ejecucion W ------------------------------------------//


//------------------------------------------ Calcular_Direccion ------------------------------------------//

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

//------------------------------------------ Fin Calcular_Direccion ------------------------------------------//


//------------------------------------------ Fondo ------------------------------------------//

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

//------------------------------------------ Fin Fondo ------------------------------------------//	


//------------------------------------------ Fondo Multiceleste ------------------------------------------//

Fondo_Multiceleste:

	sub sp,sp, #8  					//elimino mis 2 ultimos elementos de la pila
	str x30,[sp,#0]

	movz x10, 0x31, lsl 16
	movk x10, 0xCAFF, lsl 00
	add x8, x8, 50

	loop1:
		mov x0, x20
		bl Fondo

		add x8, x7, xzr
		Retraso:
			sub x8, x8, 1
			cbnz x8, Retraso

	sub x10, x10, 0x000400
	sub x8, x8, 1
	cbnz x8, loop1

	ldr x30,[sp,#0]  				//cargo x15 y x14 a sus valores originales y decremento la pila en 2  
	add sp,sp, #8 
ret

//------------------------------------------ Fin Fondo Multiceleste ------------------------------------------//


InfLoop:
	b InfLoop

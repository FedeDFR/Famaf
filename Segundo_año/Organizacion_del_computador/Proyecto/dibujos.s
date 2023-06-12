    .ifndef dibujos_s
    .equ dibujos_s, 0


    .equ SCREEN_WIDTH,   640
    .equ SCREEN_HEIGH,   480
    .equ HALF_WIDTH, 	 320
    .equ HALF_HEIGH, 	 240
    .equ BITS_PER_PIXEL, 32


    .include "funciones.s"


//------------------------------------------ Fondo Dia -----------------------------------------------------------//


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
		mov x14, 90						// Cordenada de x
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
		mov x14, 300					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 50						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 300					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 330					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 420					// Cordenada de y
		mov x14, 560					// Cordenada de x
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
		mov x14, 510					// Cordenada de x
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
		mov x14, 540					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado
		bl Sol

		mov x15, 410					// Cordenada de y
		mov x14, 500					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 410					// Cordenada de y
		mov x14, 530					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 20						// Tamaño de x
		bl Cuadrado

		mov x15, 420					// Cordenada de y
		mov x14, 560					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 10						// Tamaño de x
		bl Cuadrado

		mov x15, 400					// Cordenada de y
		mov x14, 550					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x7914, lsl 00		// Color
		mov x5, 10						// Tamaño de y
		mov x4, 30						// Tamaño de x
		bl Cuadrado

		mov x15, 390					// Cordenada de y
		mov x14, 510					// Cordenada de x
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
		mov x14, 440					// Cordenada de x
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

		mov x16, 0						// Posicion 00 de Flor de x
		mov x17, 360					// Posicion 00 de Flor de y
		bl Flor

		mov x16, 250					// Posicion 00 de Link de x
		mov x17, 110					// Posicion 00 de Link de y
		bl Link

		ldr x30,[sp,#0]  				  
		add sp,sp, #8

	ret


//------------------------------------------ Fin Fondo Dia -------------------------------------------------------//


//------------------------------------------ Fondo Paralelo ------------------------------------------------------//


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

		mov x15, HALF_HEIGH				// Cordenada de y
		mov x14, 0						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0x00, lsl 16
		movk x10, 0x0000, lsl 00		// Color
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

		
		mov x15, 270					// Cordenada de y
		mov x14, 60						// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Triangulo_B

		mov x15, 231					// Cordenada de y
		mov x14, 100					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Triangulo_C

		mov x15, 270					// Cordenada de y
		mov x14, 140					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Triangulo_B

		add x19, x17, 231				
		add x18, x16, 180 
		mov x15, 231					// Cordenada de y
		mov x14, 180					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Triangulo_C

		mov x15, 230					// Cordenada de y
		mov x14, 100					// Cordenada de x
		bl Calcular_Direccion
		movz x10, 0xFF, lsl 16
		movk x10, 0xC107, lsl 00		// Color
		mov x5, 40						// Tamaño de y
		mov x4, 40						// Tamaño de x
		bl Triangulo_B

		mov x15, 191					// Cordenada de y
		mov x14, 140					// Cordenada de x
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


//------------------------------------------ Fin Fondo Paralelo --------------------------------------------------//


//------------------------------------------ Flor ----------------------------------------------------------------//


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


//------------------------------------------ Flor ----------------------------------------------------------------//


//------------------------------------------ Arbol ---------------------------------------------------------------//


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


//------------------------------------------ Fin Arbol -----------------------------------------------------------//


//------------------------------------------ Sol -----------------------------------------------------------------//


	Sol:

		sub sp,sp, #8  
		str x30,[sp,#0]

		mov x8,50							//radio
		mov x15,80							//centro
		mov x14,70		
		movz x10, 0xFF, lsl 16	    
		movk x10, 0xAF00, lsl 00 
		bl Calcular_Direccion
		bl circulo

		mov x8,40							//radio
		mov x15,80							//centro
		mov x14,70		
		movz x10, 0xFF, lsl 16	    
		movk x10, 0xE200, lsl 00 
		bl Calcular_Direccion
		bl circulo

		ldr x30,[sp,#0]  				  
		add sp,sp, #8

	ret


//------------------------------------------ Fin Sol -------------------------------------------------------------//


//------------------------------------------ Link ----------------------------------------------------------------//


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



//------------------------------------------ Fin Link ------------------------------------------------------------//


.endif

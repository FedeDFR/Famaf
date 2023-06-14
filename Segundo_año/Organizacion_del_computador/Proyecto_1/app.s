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

	.include "funciones.s"
	.include "dibujos.s"


//------------------------------------------ Main ----------------------------------------------------------------//


main:


//------------------------------------------ Definicion de variables ---------------------------------------------//


									// x0 contiene la Calcular_Direccion base del framebuffer
	mov x29, xzr					// Comparador de set
	mov x20, x0 					// Guarda la dirección base del framebuffer en x20
	mov x19, xzr					// Posicion 00 de Sol de y
	mov x18, xzr					// Posicion 00 de Sol de x
	mov x17, xzr					// Posicion 00 de Link de y
	mov x16, xzr					// Posicion 00 de Link de x
	mov x14, xzr					// Cordenada de x
	mov x15, xzr					// Cordenada de y
	mov x10, xzr					// Color
	mov x9, GPIO_BASE				// GPIO
	mov x8, xzr						// Radio
	movz x7, 0xFF, lsl 16
	movk x7, 0xFFF, lsl 00			// Delay
	mov x6, xzr						// el cero
	mov x5, xzr 					// Tamaño y
	mov x4, xzr 					// Tamaño x
	mov x3, 4						// 4
	mov x2, SCREEN_HEIGH			// Alto
	mov x1, SCREEN_WIDTH			// Ancho


//------------------------------------------ Fin Definicion de variables -----------------------------------------//


	bl Fondo_Dia

	bl Leer

	bl InfLoop


//------------------------------------------ Fin Main ------------------------------------------------------------//


InfLoop:
	b InfLoop

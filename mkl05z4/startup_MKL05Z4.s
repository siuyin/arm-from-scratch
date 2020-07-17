	.syntax unified
	.arch	armv6-m

	.section .stack
	.align 3
	.equ Stack_Size, 0x80
	.globl	__StackTop
	.globl	__StackLimit
__StackLimit:
	.space	Stack_Size
	.size	__StackLimit, . - __StackLimit
__StackTop:
	.size __StackTop, . - __StackTop

	.section .vector_table,"a",%progbits
	.align 2
	.globl __isr_vector
__isr_vector:
	.long	__StackTop	
	.long	Reset_Handler

	.section .text.Reset_Handler
	.thumb
	.thumb_func
	.align 2
	.globl	Reset_Handler
	.type	Reset_Handler, %function
Reset_Handler:
	BL	SystemInit
	B	.

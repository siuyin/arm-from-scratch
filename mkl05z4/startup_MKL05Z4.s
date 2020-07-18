@ startup_MKL05Z4.s is the code that runs first in the system.
@
@ This is a comment is arm 32-bit assembler.
@ The comment is valid through the end of the line.
@
@ A good reference is to search for "useful assembler directives and macros for the gnu assembler"
@ This pointed me to community.arm.com .
@
@ For a more detailed referece, search for "gnu using assembler directives".
@ This pointed me to ftp.gnu.org .
@
@ For a reference on ARM assembly language, search for "arm compiler toolchain assembler reference",
@ then look for ARM and Thumb instructions.
@ This pointed me to developer.arm.com .

	.syntax unified		@ ARM assembly has several dialects, this is the unified dialect.
	.arch	armv6-m		@ Targetting the arm v6-m architecture.

	.section .stack		@ Here is the initial software stack.
	.align 3		@ It must start on a address that is divisible by 2^3 = 8.
	.equ Stack_Size, 0x80	@ Let's start with a 2K byte stack.
	.globl	__StackTop	@ These declare global variables.
	.globl	__StackLimit
__StackLimit:			@ And there are actually defined here.
	.space	Stack_Size				@ Reserve the number of bytes for the stack.
	.size	__StackLimit, . - __StackLimit		@ .size sets the size of the __StackLimit pointer to n bytes.
__StackTop:
	.size __StackTop, . - __StackTop

	.section .vector_table,"a",%progbits	@ This says the vector table is "a" for allocatable. %progbits says it contains data. See ftp.gnu.org reference.
	.align 2				@ Start on a address that is divisible by 2^2 = 4.
	.globl __isr_vector
__isr_vector:
	.long	__StackTop			@ According to KL05 sub-family reference, page 49, address 0x0000_0000 contains the initial stack pointer.
	.long	Reset_Handler			@ Address 0x0000_0004 has the initial program counter. I have pointed it to Reset_Handler

	.section .text.Reset_Handler		@ .text is where user code goes. Here is the Reset_Handler code.
	.thumb					@ It users arm thumb instructions.
	.thumb_func				@ And a thumb function is being defined.
	.align 2
	.globl	Reset_Handler
	.type	Reset_Handler, %function	@ This declares the entry for inclusion in the symbol table.
Reset_Handler:					@ This is the actual Reset_Handler code.
	BL	SystemInit			@ It Branch Links (goto) SystemInit. See reference on developer.arm.com for assembler language details.
	B	.				@ A safety feature: branch to itself. Should the Program Counter land here, it will stay locked there.

#PURPOSE:  Simple program that exits and returns a
#          status back to the Linux kernel
#

#INPUT:    none
#

#OUTPUT:   Returnes a status code. This can be viewed
#          by typing
#
#          echo $?
#
#          after running the program

#VARIABLES:
#          %eax holds the system call number
#          %ebx holds the return status
#

#    	   Assembler directives:
.section .data		# Starts the "data" section 
			# The data section contains anything 
			# that you want to be automatically initialized for you 
			# by the system before it calls the entry point of your program.

.section .text		# Starts the "text" section, where program
			# instructions live. 

.globl _start		# Symbol, meaning that it is a placeholder
			# so programmers can refer to _start
			# instead of its location address.

#	   Instruction format: [mnemonic] [src] [dst]
_start:
movl $1, %eax		# this is the linux kernel command
			# number (system call) for exiting
			# a program
			# moves the litteral number 1 into eax
			# register via immidiate mode addressing ($)

movl $2, %ebx		# this is the linux status number we will
			# return to the operating system
			# Change this around and it will 
			# return different things to 
			# echo $?

int $0x80		# this wakes up the kernel to run 
			# the exit command int = interrupt


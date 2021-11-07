%macro write_string 2
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

section .data
	n			dq	5
	fd			dq	0
	fname		db "Sully_%d.s",0
	exname		db "Sully_%d",0
	sully5		db "Sully_5.s",0
	format		db "%%macro write_string 2%1$c	mov rax, 1%1$c	mov rdi, 1%1$c	mov rsi, %%1%1$c	mov rdx, %%2%1$c	syscall%1$c%%endmacro%1$c%1$csection .data%1$c	n			dq	%4$d%1$c	fd			dq	0%1$c	fname		db %2$cSully_%%d.s%2$c,0%1$c	exname		db %2$cSully_%%d%2$c,0%1$c	sully5		db %2$cSully_5.s%2$c,0%1$c	format		db %2$c%3$s%2$c,0%1$c	compile		db %2$cnasm -f elf64 %%1$s.s -o %%1$s.o && gcc -no-pie %%1$s.o -o %%1$s && rm *.o%2$c,0%1$c	execute		db %2$c./%%1$s%2$c,0%1$c%1$csection .bss%1$c	l			resb 42%1$c	c			resb 42%1$c	c_c			resb 1024%1$c	c_e			resb 128%1$c%1$c%1$csection .text%1$c	global main%1$c	extern sprintf%1$c	extern dprintf%1$c	extern access%1$c	extern system%1$c%1$c	main:%1$c		; Checking if we already generated Sully_5.s. If we did not, do not decrement n.%1$c	.check_sully5:%1$c		mov rax, 0%1$c		lea rdi, [sully5]%1$c		mov rsi, 0x00%1$c		call access%1$c		cmp rax, 0%1$c		jne .generate_vars%1$c		dec QWORD [n]%1$c%1$c	.generate_vars:%1$c		; Generate filename, Sully_X.s, in %2$cl%2$c%1$c		mov rax, 0%1$c		mov rdi, l%1$c		mov rsi, fname%1$c		mov rdx, [n]%1$c		call sprintf%1$c		; Generate exename, Sully_X, in %2$cl%2$c%1$c		mov rax, 0%1$c		mov rdi, c%1$c		mov rsi, exname%1$c		mov rdx, [n]%1$c		call sprintf%1$c		; Generating the compilation command%1$c		mov rax, 0%1$c		mov rdi, c_c%1$c		mov rsi, compile%1$c		mov rdx, c%1$c		call sprintf%1$c		; Generating the execution command%1$c		mov rax, 0%1$c		mov rdi, c_e%1$c		mov rsi, execute%1$c		mov rdx, c%1$c		call sprintf%1$c%1$c		; Opening the output file in RDWR, storing the resulting FD%1$c	.open_file:%1$c		mov rdi, l%1$c		mov rsi, 0102o%1$c		mov rdx, 0666o%1$c		mov rax, 2%1$c		syscall%1$c		mov [fd], rax%1$c%1$c		; Format and write source code into output file%1$c		mov rdi, [fd]%1$c		mov rsi, format%1$c		mov rdx, 10%1$c		mov rcx, 34%1$c		mov r8, format%1$c		mov r9, [n]%1$c		mov rax, 0%1$c		call dprintf%1$c%1$c		; Closing output file FD%1$c		mov rax, 3%1$c		mov rdi, [fd]%1$c		syscall%1$c%1$c	.compile:%1$c		push rax				; For stack alignment%1$c		mov rdi, c_c%1$c		call system%1$c		pop rax%1$c	.execute:%1$c		cmp QWORD [n], 0%1$c		je .exit%1$c		push rax				; For stack alignment%1$c		mov rdi, c_e%1$c		call system%1$c		pop rax%1$c%1$c%1$c		; Exit%1$c	.exit:%1$c		mov rax, 0%1$c		ret%1$c",0
	compile		db "nasm -f elf64 %1$s.s -o %1$s.o && gcc -no-pie %1$s.o -o %1$s && rm *.o",0
	execute		db "./%1$s",0

section .bss
	l			resb 42
	c			resb 42
	c_c			resb 1024
	c_e			resb 128


section .text
	global main
	extern sprintf
	extern dprintf
	extern access
	extern system

	main:
		; Checking if we already generated Sully_5.s. If we did not, do not decrement n.
	.check_sully5:
		mov rax, 0
		lea rdi, [sully5]
		mov rsi, 0x00
		call access
		cmp rax, 0
		jne .generate_vars
		dec QWORD [n]

	.generate_vars:
		; Generate filename, Sully_X.s, in "l"
		mov rax, 0
		mov rdi, l
		mov rsi, fname
		mov rdx, [n]
		call sprintf
		; Generate exename, Sully_X, in "l"
		mov rax, 0
		mov rdi, c
		mov rsi, exname
		mov rdx, [n]
		call sprintf
		; Generating the compilation command
		mov rax, 0
		mov rdi, c_c
		mov rsi, compile
		mov rdx, c
		call sprintf
		; Generating the execution command
		mov rax, 0
		mov rdi, c_e
		mov rsi, execute
		mov rdx, c
		call sprintf

		; Opening the output file in RDWR, storing the resulting FD
	.open_file:
		mov rdi, l
		mov rsi, 0102o
		mov rdx, 0666o
		mov rax, 2
		syscall
		mov [fd], rax

		; Format and write source code into output file
		mov rdi, [fd]
		mov rsi, format
		mov rdx, 10
		mov rcx, 34
		mov r8, format
		mov r9, [n]
		mov rax, 0
		call dprintf

		; Closing output file FD
		mov rax, 3
		mov rdi, [fd]
		syscall

	.compile:
		push rax				; For stack alignment
		mov rdi, c_c
		call system
		pop rax
	.execute:
		cmp QWORD [n], 0
		je .exit
		push rax				; For stack alignment
		mov rdi, c_e
		call system
		pop rax


		; Exit
	.exit:
		mov rax, 0
		ret

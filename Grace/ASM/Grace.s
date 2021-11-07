; Grace
%define MAINFUNC	main:
%define MAINDEC		global main
%define RDWRCREATE	0102o
section .data
	msg db '; Grace%1$c%%define MAINFUNC	main:%1$c%%define MAINDEC		global main%1$c%%define RDWRCREATE	0102o%1$csection .data%1$c	msg db %3$c%2$s%3$c,0%1$c	len equ $ - msg%1$c	filename db "Grace_kid.s", 0%1$c	fd dq 0%1$c%1$csection .text%1$c	MAINDEC%1$c	extern dprintf%1$c%1$c	MAINFUNC%1$c		mov rdi,filename%1$c		mov rsi,RDWRCREATE%1$c		mov rdx,0666o%1$c		mov rax, 2%1$c		syscall%1$c%1$c		mov [fd], rax%1$c		mov rdi, [fd]%1$c		mov rsi, msg%1$c		mov rdx, 10%1$c		mov rcx, msg%1$c		mov r8, 39%1$c		mov rax, 0%1$c		call dprintf%1$c%1$c		mov rdi, [fd]%1$c		mov rax, 3%1$c		syscall%1$c%1$c		mov rax, 60%1$c		mov rdi, 0%1$c		syscall%1$c',0
	len equ $ - msg
	filename db "Grace_kid.s", 0
	fd dq 0

section .text
	MAINDEC
	extern dprintf

	MAINFUNC
		mov rdi,filename
		mov rsi,RDWRCREATE
		mov rdx,0666o
		mov rax, 2
		syscall

		mov [fd], rax
		mov rdi, [fd]
		mov rsi, msg
		mov rdx, 10
		mov rcx, msg
		mov r8, 39
		mov rax, 0
		call dprintf

		mov rdi, [fd]
		mov rax, 3
		syscall

		mov rax, 60
		mov rdi, 0
		syscall

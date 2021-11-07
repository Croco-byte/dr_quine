; colleen
section .data
	format	db "; colleen%1$csection .data%1$c	format	db %2$c%3$s%2$c,0%1$c%1$csection .text%1$c		global main%1$c		extern printf%1$c%1$c	main:%1$c		call function%1$c%1$c		mov rax, 0%1$c		ret%1$c%1$c	function:%1$c	; Hello from function!%1$c		mov rax, 0%1$c		mov rdi, format%1$c		mov rsi, 10%1$c		mov rdx, 34%1$c		mov rcx, format%1$c		call printf%1$c",0

section .text
		global main
		extern printf

	main:
		call function

		mov rax, 0
		ret

	function:
	; Hello from function!
		mov rax, 0
		mov rdi, format
		mov rsi, 10
		mov rdx, 34
		mov rcx, format
		call printf

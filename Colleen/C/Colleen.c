#include <stdio.h>

/*
	Hello, I am a quine program
*/

char * reflective()
{
	char*s="#include <stdio.h>%1$c%1$c/*%1$c	Hello, I am a quine program%1$c*/%1$c%1$cchar * reflective()%1$c{%1$c	char*s=%2$c%3$s%2$c;%1$c	return (s);%1$c}%1$c%1$cint		main()%1$c{%1$c	/*%1$c		Hello from main!%1$c	*/%1$c	printf(reflective(),10,34,reflective());%1$c	return(0);%1$c}%1$c";
	return (s);
}

int		main()
{
	/*
		Hello from main!
	*/
	printf(reflective(),10,34,reflective());
	return(0);
}

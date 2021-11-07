#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

int main()
{
	int n = 5;
	if (access("Sully_5.c", F_OK) != -1)
		--n;
	char c = n + '0';
	char l[42] = "Sully_";
	strncat(l, &c, 1);
	strncat(l, ".c", 2);
	char*s="#include <stdlib.h>%1$c#include <stdio.h>%1$c#include <string.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c%1$cint main()%1$c{%1$c	int n = %3$d;%1$c	if (access(%2$cSully_5.c%2$c, F_OK) != -1)%1$c		--n;%1$c	char c = n + '0';%1$c	char l[42] = %2$cSully_%2$c;%1$c	strncat(l, &c, 1);%1$c	strncat(l, %2$c.c%2$c, 2);%1$c	char*s=%2$c%4$s%2$c;%1$c	char r[4096];%1$c	sprintf(r, s, 10,34,n,s);%1$c	int fd = open(l, 0100 | 02, 0666);%1$c	write(fd, r, strlen(r));%1$c%1$c	char cmd[128] = %2$cclang %2$c;%1$c	char exec[128] = %2$c./%2$c;%1$c	strncat(cmd, l, strlen(l));%1$c	strncat(cmd, %2$c -o %2$c, 4);%1$c	strncat(cmd, l, strlen(l) - 2);%1$c	strncat(exec, l, strlen(l) - 2);%1$c	system(cmd);%1$c	if (n > 0)%1$c		system(exec);%1$c	return (0);%1$c}%1$c";
	char r[4096];
	sprintf(r, s, 10,34,n,s);
	int fd = open(l, 0100 | 02, 0666);
	write(fd, r, strlen(r));

	char cmd[128] = "clang ";
	char exec[128] = "./";
	strncat(cmd, l, strlen(l));
	strncat(cmd, " -o ", 4);
	strncat(cmd, l, strlen(l) - 2);
	strncat(exec, l, strlen(l) - 2);
	system(cmd);
	if (n > 0)
		system(exec);
	return (0);
}

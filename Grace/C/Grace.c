#define B(x) int main(){int fd = open("Grace_kid.c", 0100 | 02, 0666); write(fd, "#define B(x) "x"\n#define X(s) S(s)\n#define S(s) #s\n#include <unistd.h>\n#include <fcntl.h>\nB(X(B(x)));\n/*\n	Macros quine!\n*/\n\n", 342);return(0);}
#define X(s) S(s)
#define S(s) #s
#include <unistd.h>
#include <fcntl.h>
B(X(B(x)));
/*
	Macros quine!
*/

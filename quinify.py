import sys

if (len(sys.argv) != 2) :
	print("[X] Usage : python3 quinify [FILE]")
	sys.exit(1)

result = ""
f = open(sys.argv[1], "r")
string = f.read()

for c in string :
	if (c == '\n') :
		result += "%1$c"
	elif (c == '"') :
		result += "%2$c"
	elif (c == '%') :
		result += "%%"
	else :
		result += c

print(result)




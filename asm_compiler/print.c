#include <stdio.h>

extern void print_number(int x) {
	printf("%i\n",x);
}

extern void print_string(char *str) {
	printf("%s",str);
}

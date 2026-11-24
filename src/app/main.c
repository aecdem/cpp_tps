
#include <stdio.h>
#include "math.h"
#include "static_math.h"
#include "dynamic_math.h"

int main(void)
{
	printf("Main called!\n");

	int add_result = addition(1, 7);
	printf("result of adding 1 to 7 is %d\n ", add_result);

	int dynamic_add_result = dynamicAddition(1, 7);
	printf("result of dynamic adding 1 to 7 is %d\n ", dynamic_add_result);

	int static_add_result = staticAddition(1, 7);
	printf("result of static adding 1 to 7 is %d\n ", static_add_result);

	return 0;
}

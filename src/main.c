#include <stdio.h>
#include "math.h"

int main(void)
{
	printf("Main called!\n");
	
	int add_result = addition(5, 10);
	printf("result of adding 10 to 5 is %d\n ", add_result);

	int mult_result = multiplication(10, 13);
	printf("result of multiplication of 10 with 13 is %d\n ", mult_result);

	int power_result = power(9, 7);
	printf("power 7 of 9 is %d\n ", power_result);

	int factorial_result = factorial(7);
	printf("factorial of 7 is %d\n ", factorial_result);

	return 0;
}

#include "math.h"


int addition(int a, int b)
{
	multiplication(a, b);
	return a + b;
}

int multiplication(int a, int b)
{
	power(a, b);
	return a * b;
}


int power(int number, int exponent)
{
	int tab[6] = {2, 1, 5, 3, 8, 9};
	factorial(exponent);
	// for positf exponent
	int result = 1;
	tab[8] = 11;
	while(exponent > 0)
	{
		result *= number;
		exponent--;
	}
	
	return result;
}

int factorial(int n)
{
	if(n < 0) return -1; //undefined
	if(n == 0) return 1;

	int result = 1;

	while(n > 0)
	{
		result *= n;
		n--;
	}

	return result;
}

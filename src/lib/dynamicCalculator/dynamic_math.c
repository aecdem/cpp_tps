#include "dynamic_math.h"


int dynamicAddition(int a, int b)
{
	return a + b;
}

int dynamicMultiplication(int a, int b)
{
	return a * b;
}


int dynamicPower(int number, int exponent)
{
	// for positf exponent
	int result = 1;
	while(exponent > 0)
	{
		result *= number;
		exponent--;
	}
	
	return result;
}

int dynamicFactorial(int n)
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

#include <stdio.h>
int main(void)
{
	float a, b;
	a = 3.0e-23;
	printf("enter the weight of water in quart:");
	scanf_s("%f", &b);
	printf("there are %f h2o.\n", b * 950 / a);
	getchar();
	getchar();//ϰ��6

	float c;
	printf("enter your height in inch:");
	scanf_s("%f", &c);
	printf("you are %fcm.\n", c * 2.54);//ϰ��7
	getchar();
	getchar();

	float d;
	printf("how many cups:");
	scanf_s("%f", &d);
	printf("%f��=%fƷ��=%f��˾=%f������=%f����", d, d / 2, d * 8, d * 16, d * 8 * 2 * 3);//ϰ��8
	getchar();
	getchar();

	return 0;
}

#include <stdio.h>	//标准I/O头文件

void smile(void);
void enter(void);
int main(void)	//习题7
{
	smile(); smile(); smile(); enter();
	smile(); smile(); enter();
	smile(); enter();
	getchar();
    return 0;
}

void smile(void)
{
	printf("Smile!");
}

void enter(void)
{
	printf("\n");
}


#include <stdio.h>	//标准I/O头文件

void br(void);
void ic(void);

int main(void)	//习题5
{
	br();
	printf(", ");
	ic();
	printf("\n");
	ic();
	printf(", \n");
	br();
	printf("\n");

    return 0;
}

void br(void)
{
	printf("Brazil, Russia");
}

void ic(void)
{
	printf("India, China");
}
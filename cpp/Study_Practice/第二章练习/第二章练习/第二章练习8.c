//习题8
#include <stdio.h>							//标准I/O头文件

void one_three(void);						//one_three函数原型
void two(void);								//two函数原型
int main(void)								// 主函数
{
	printf("starting now:\n");
	one_three();							//调用函数one_three
	printf("done!\n");

	getchar();
    return 0;
}

void one_three(void)						/*one_three函数定义*/
{
	printf("one\n");
	two();									//调用函数two
	printf("three\n");
}

void two(void)								/*two函数定义*/
{
	printf("two\n");
}
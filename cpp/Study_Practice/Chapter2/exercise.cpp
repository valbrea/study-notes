#include<stdio.h>
void jolly(void);
void br(void);
void ic(void);
void smile(void)					//����ԭ�ͱ����ڵ���ǰ�棬����ԭ�Ϳ��ԺͶ���һ������ļ�ǰ�棬����main����ǰ��һ��Ҫ�иõ��ú�����ԭ������
{
	printf("Smile!");
}
void one_three(void), two(void);	//����ԭ��Ҳ�������������һ��һ��д�����������֪���Ƿ�һ��

int main(void)
{
	//��ϰ1
	printf("Zhang Xingyu\n");
	printf("Zhang\nXingyu\n");
	printf("Zhang ");
	printf("Xingyu\n\n");
	
	//��ϰ2
	printf("�����������ַ�Ĵ���\n\n");

	//��ϰ3
	int days = 24 * 365;
	printf("�һ���%d�졣\n\n", days);
	
	//��ϰ4
	jolly();
	jolly();
	jolly();
	printf("Which nobody can deny!\n\n");

	//��ϰ5
	br(); printf(", "); ic(); printf("\n");
	ic(); printf(",\n");
	br(); printf("\n\n");

	//��ϰ6
	int toes = 10, toes2 = toes * toes, doubletoes = toes * 2;	//����ֱ������������ʱ��ֵ
	printf("toes=%d, toes doubled=%d, toes squared=%d\n\n", toes, doubletoes, toes2);

	//��ϰ7
	smile(); smile(); smile(); printf("\n");
	smile(); smile(); printf("\n");
	smile(); printf("\n\n");

	//��ϰ8
	printf("starting now:\n");
	one_three();
	printf("done!\n\n");

	return 0;
}

void jolly(void)
{
	printf("For he's a jolly good fellow!\n");
	
}

void br(void)
{
	printf("Brazil, Russia");
}

void ic(void)
{
	printf("India, China");
}

void one_three(void)
{
	printf("one\n");
	two();
	printf("three\n");
}

void two(void)
{
	printf("two\n");
}
/*
编程题＃1：单词翻转
来源: POJ (Coursera声明：在POJ上完成的习题将不会计入Coursera的最后成绩。)

注意： 总时间限制: 1000ms 内存限制: 65536kB

描述
输入一个句子（一行），将句子中的每一个单词翻转后输出。

输入
只有一行，为一个字符串，不超过500个字符。单词之间以空格隔开。所谓单词指的是所有不包含空格的连续的字符。

这道题请用cin.getline输入一行后再逐个单词递归处理。

输出
翻转每一个单词后的字符串，单词之间的空格需与原文一致。
*/
#include <iostream>
#include <iomanip>
#include <cstring>
using namespace std;
char str[501] = {0};
int i(0);
int recur(char str[], int s);
int main()
{
    cin.getline(str, 501);
    int back(0);

    while (i < strlen(str))
    {
        back = recur(str, i);
        switch (back)
        {
        case 0:
            cout << ' ';
            break;
        case 1:
            cout << endl;
            break;
        default:
            break;
        }
    }

    return 0;
}
int recur(char str[], int s) //
{
    char c = str[s];
    int b(0);
    if (c != ' ' && c != '\0')
    {
        b = recur(str, s + 1);
        cout << c;
        return b; // 这个返回值 = 递归到最后的其他情况的返回值。
    }
    else if (c == ' ')
        return (i = s + 1, 0);
    else if (c == '\0')
        return (i = s + 1, 1);
}
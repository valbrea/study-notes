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
int recur();
int main()
{
    cin.getline(str, 501);
    int length = strlen(str);
    
    while (i < length)
    {
        if (recur() == 1)
            cout << ' ';
    }
    cout << endl;

    return 0;
}
int recur() // 存在问题：没有调用参数，直接用了全局变量str和i，虽然简单但感觉不太规范。 应该用多返回值来解答！！！
{
    char c = str[i];
    ++i;
    if (c != ' ' && c != '\0')
    {
        recur();
        cout << c;
        return 1;
    }
    else if (c == ' ')
        return 1; // 存在问题： 这个返回值没用，并没有接受
    else if (c == '\0')
        return 0; // 存在问题： 这个返回值也没用
}
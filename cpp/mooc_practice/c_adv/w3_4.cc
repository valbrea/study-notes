/*
编程题＃4：扩号匹配问题
来源: POJ (Coursera声明：在POJ上完成的习题将不会计入Coursera的最后成绩。)

注意： 总时间限制: 1000ms 内存限制: 65536kB

描述
在某个字符串（长度不超过100）中有左括号、右括号和大小写字母；规定（与常见的算数式子一样）任何一个左括号都从内到外与在它右边且距离最近的右括号匹配。写一个程序，找到无法匹配的左括号和右括号，输出原来字符串，并在下一行标出不能匹配的括号。不能匹配的左括号用"$"标注,不能匹配的右括号用"?"标注.

输入
输入包括多组数据，每组数据一行，包含一个字符串，只包含左右括号和大小写字母，字符串长度不超过100

注意：cin.getline(str,100)最多只能输入99个字符！

输出
对每组输出数据，!!!输出两行，第一行包含原始输入字符!!!，第二行由"$","?"和空格组成，"$"和"?"表示与之对应的左括号和右括号不能匹配。
*/
#include <iostream>
#include <cstring>
using namespace std;
int l(0), r(0);
bool flag(0);
char output[101] = {0};
int match(char str[], int s);
int main()
{
    char input[101] = {0};
    int back(0);
    while (cin.getline(input, 101))
    {
        cout << input << endl;
        match(input, 0);
        cout << output << endl;
        l = 0, r = 0;
    }

    return 0;
}
int match(char str[], int s)
{
    switch (str[s])
    {
    case '(':
        l++; // 传递时统计左括号数量
        match(str, s + 1);
        if (r > 0)
        { // 回溯时判断')'的数量，判断该'('左边还有没有')'， 如果还有就打空格，否则打'$'
            output[s] = ' ';
            r--;
        }
        else
            output[s] = '$';
        return 0;
        break;
    case ')':
        if (l > 0)
        { // 传递时判断'('的数量，判断该')'左边还有没有'('， 如果还有就打空格，否则打'$'
            output[s] = ' ';
            l--;
        }
        else
            output[s] = '?';
        match(str, s + 1);
        r++; // 回溯时统计右括号数量。
        return 0;
        break;
    case '\0':
        return (flag = 1, 1);
        break;
    default:
        match(str, s + 1);
        output[s] = ' ';
        return 0;
        break;
    }
}
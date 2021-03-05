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
bool flag(0);
int match(char str[], int start);
int main()
{
    char str[101] = {0};
    while (cin.getline(str, 101))
    {
        cout << str << endl;
        (left, right) = match(str, 0);
    }

    return 0;
}
int match(char str[], int start)
{
    int next(0);
    if (strlen(str) == 0)
        return start;
    if (str[start] == '(')
    {
        next = match(str, start + 1);
        if(flag == 1)
            cout << ' ';
        else 
            cout << '$'; 
    }
    else if (str[start] == ')')

    else
    {
        return match(str, start + 1);
    }
    
        
}
/****************************************************************
 * ＃3：最长单词2
 * 
 * 描述:
 * 一个以'.'结尾的简单英文句子，单词之间用空格分隔，没有缩写形式和其它特殊形式
 * 
 * 输入:
 * 一个以'.'结尾的简单英文句子（长度不超过500），单词之间用空格分隔，没有缩写形式和其它特殊形式
 * 
 * 输出:
 * 该句子中最长的单词。如果多于一个，则输出第一个
 *****************************************************************/
#include <iostream>
#include <string.h>
using namespace std;
int main()
{
    char sentence[500] = {0};
    bool flag(0);
    int length(0), begin(0), end(0), max(0);

    cin.getline(sentence, 500);
    for (int i(0); sentence[i] != '\0'; i++)
    {
        if ((sentence[i] != ' ' && sentence[i] != '.') && flag == 0) // 如果遇到非空格，记录开始位置
        {
            flag = 1;
            begin = i;
        }
        else if ((sentence[i] == ' ' || sentence[i] == '.') && flag == 1) // 如果遇到空格或结尾，记录单词结束位置，结束位置 - 开始位置 = 单词长度。
        {
            flag = 0;
            end = i;
            length = end - begin;
            if (length >= max) // 如果单词长度超过最长,更新最长长度，并录入该单词，释放length空间
            {
                max = length;
               
                length = 0;
            }
        }
        else
        {
            continue;
        }
    }
    cout << "最长单词为";
    for (int i(begin); i < end; i++)
    {
        cout << sentence[i];
    }
    cout << endl;

    return 0;
}
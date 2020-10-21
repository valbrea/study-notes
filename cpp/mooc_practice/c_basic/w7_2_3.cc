/******************************************
 * #3 找出第k大的数
 * 用户输入N和K，然后接着输入N个正整数（无序的），
 * 程序在不对N个整数排序的情况下，找出第K大的数。
 * 注意，第K大的数意味着从大到小排在第K位的数。
 ******************************************/

#include <iostream>
using namespace std;
int main()
{
    cout << "输入整数个数n和想求得的序号k" << endl;
    int total, k;
    cin >> total >> k;
    cout << "输入" << total << "个整数" << endl;
    int num[total] = {};
    for (int i(0); i < total; i++)
        cin >> num[i];

    int max = 0;
    int max_index = 0;
    for (int j = 0; j < k - 1; j++)
    {
        for (int i = 0; i < total; i++)
        {
            if (num[i] >= max)
            {
                max = num[i];
                max_index = i;
            }
        }
        num[max_index] = 0;
        max = 0;
    }

    for (int i = 0; i < total; i++)
    {
        if (num[i] > max)
        {
            max = num[i];
            max_index = i;
        }
    }
    cout << max << endl;

    return 0;
}
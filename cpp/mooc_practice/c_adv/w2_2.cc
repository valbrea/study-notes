/*
编程题＃2：四大湖
注意： 总时间限制: 1000ms 内存限制: 65536kB

描述
我国有4大淡水湖。
A说：洞庭湖最大，洪泽湖最小，鄱阳湖第三。
B说：洪泽湖最大，洞庭湖最小，鄱阳湖第二，太湖第三。
C说：洪泽湖最小，洞庭湖第三。
D说：鄱阳湖最大，太湖最小，洪泽湖第二，洞庭湖第三。
已知这4个湖的大小均不相等，4个人每人仅答对一个，
请编程按照鄱阳湖、洞庭湖、太湖、洪泽湖的顺序给出他们的大小排名。

输入
无。

输出
输出为4行，第1行为鄱阳湖的大小名次，从大到小名次分别表示为1、2、3、4；第2、3、4行分别为洞庭湖、太湖、洪泽湖的大小名次。
*/

/*********************************************************
 * 遍历所有可能性
 * 易错点1： 每人仅答对一个（指每个人的画中只有一个选项是true的)
 * 易错点2： 四个湖的大小均不相等，需要筛除掉相等大小
 * *******************************************************/
#include <iostream>
using namespace std;
int main()
{
    int d, h, p, t;
    for (int d(1); d <= 4; ++d)
    {
        for (int h(1); h <= 4; ++h)
        {
            for (int p(1); p <= 4; ++p)
            {
                for (int t(1); t <= 4; ++t)
                {
                    if ((d != h && d != p && d != t && h != p && h != t && p != t)  // 四个湖大小均不相等
                    && ((d == 1) + (h == 4) + (p == 3) == 1)
                    && ((d == 4) + (h == 1) + (p == 2) + (t == 3) == 1)
                    && ((d == 3) + (h == 4) == 1) 
                    && ((d == 3) + (h == 2) + (p == 1) + (t == 4) == 1))
                    {
                        cout << d << endl << h << endl << p << endl << t << endl;
                    }
                }
            }
        }
    }

    return 0;
}
/*
编程题＃3：最远距离
来源: POJ (Coursera声明：在POJ上完成的习题将不会计入Coursera的最后成绩。)

注意： 总时间限制: 1000ms 内存限制: 65536kB

描述
给定一组点(x,y)，求距离最远的两个点之间的距离。

输入
第一行是点数n（n大于等于2）

接着每一行代表一个点，由两个浮点数x y组成。

输出
输出一行是最远两点之间的距离。

使用cout << fixed << setprecision(4) << dis << endl;输出距离值并精确到小数点后4位。

fixed和setprecision是在<iomanip>头文件里定义的格式控制操作符，需要#include <iomanip>.
*/
#include <iostream>
#include <iomanip>
#include <cmath>

using namespace std;
int main()
{
    int n(0);
    double dis(0), temp(0);
    double x[100] = {0}, y[100] = {0};
    cin >> n;
    for (int i(0); i < n; ++i)
    {
        cin >> x[i] >> y[i];
    }
    for (int i(0); i < n; ++i)
    {
        for (int j = i + 1; j < n; ++j)
        {
            temp = sqrt(pow(x[i] - x[j], 2) + pow(y[i] - y[j], 2));
            if (temp >= dis)
                dis = temp;
        }
    }
    cout << fixed << setprecision(4) << dis << endl;

    return 0;
}
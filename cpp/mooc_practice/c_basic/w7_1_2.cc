/******************************************************
 * #2 分数求和
 * 输入n个分数并对他们求和，用约分之后的最简形式表示。
 *****************************************************/

#include <iostream>
using namespace std;

int main()
{
    // 第一行的输入n，代表一共有几个分数需要求和，接下来的n行是分数
    int number;
    cin >> number;
    int sum_numerator = 0, sum_denominator = 1;

    while (number--)
    {
        int numerator, denominator;
        char slash; // 用来去掉/的
        cin >> numerator >> slash >> denominator;
        // 先相加 a / b + c / d = (a * d + c * d) / (b * d)
        sum_numerator = sum_numerator * denominator + sum_denominator * numerator;
        sum_denominator = sum_denominator * denominator;
    }
    // 后约分
    //先求最大公约数gcd，这里用的是欧几里得法(辗转相除法)
    int a = sum_denominator, b = sum_numerator, c;
    while (a != 0)
    {
        c = a;
        a = b % a;
        b = c;
    }
    int gcd = b;
    // 分子分母同时除以gcd就可以完成约分
    sum_denominator /= gcd;
    sum_numerator /= gcd;
    if (sum_denominator > 1)
    {
        cout << sum_numerator << "/" << sum_denominator << endl;
    }
    else
    {
        cout << sum_numerator << endl;
    }
    
    return 0;
}
//我们计算过程中结果分母是不断乘以新输入的分母，最后约分的。这样可能导致这个过程中分母过大溢出。
//这道题的数据比较简单，并没有出现那种情况。但大家可以思考一下，如果出现了那种情况怎么办呢？（不要用大整数啊）
/*我给大家一组测试数据，看看你修改过的程序能不能通过这组数据吧：
样例输入：
2
1/100000000
1/100000000
样例输出：
1/50000000
*/
/* 编程题＃4：Tomorrow never knows？
来源: POJ (Coursera声明：在POJ上完成的习题将不会计入Coursera的最后成绩。)

注意： 总时间限制: 1000ms 内存限制: 65536kB

描述
甲壳虫的《A day in the life》和《Tomorrow never knows》脍炙人口，如果告诉你a day in the life,真的会是tomorrow never knows?相信学了计概之后这个不会是难题，现在就来实现吧。

读入一个格式为yyyy-mm-dd的日期（即年－月－日），输出这个日期下一天的日期。可以假定输入的日期不早于1600-01-01，也不晚于2999-12-30。

输入
输入仅一行，格式为yyyy-mm-dd的日期。

输出
输出也仅一行，格式为yyyy-mm-dd的日期

样例输入
2010-07-05
样例输出
2010-07-06
提示
闰年的标准：
(1)普通年能被4整除且不能被100整除的为闰年。（如2004年就是闰年,1901年不是闰年）
(2)世纪年能被400整除的是闰年。(如2000年是闰年，1100年不是闰年)
可以利用一个字符变量吃掉输入的短横线（减号），输出时请活用setfill和setw 控制符。 */

#include <iostream>
#include <iomanip>
using namespace std;
bool IsLeapYear(int);

int main()
{
    long long year(0), month(0), day(0), day_per_month[13] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    char slash('-');
    while (cin >> year >> slash >> month >> slash >> day)
    {
        day_per_month[2] = 28;
        if (IsLeapYear(year) == true)
            day_per_month[2] = 29;
        if (year >= 1600 && year <= 2999 && month >= 1 && month <= 12 && day >= 1 && day <= day_per_month[month])
        {
            if (month == 12 && day == 31)
                cout << year + 1 << "-01-01" << endl;
            else if (day == day_per_month[month])
                cout << year << slash << setfill('0') << setw(2) << month + 1 << "-01" << endl;
            else
                cout << year << slash << setfill('0') << setw(2) << month << slash << setfill('0') << setw(2) << day + 1 << endl;
        }
        else
        {
            cout << "error input!" << endl;
        }
    }
    return 0;
}

bool IsLeapYear(int init_year)
{
    if (init_year % 4 == 0 && init_year % 100 != 0 || init_year % 400 == 0)
        return true;
    else
        return false;
}
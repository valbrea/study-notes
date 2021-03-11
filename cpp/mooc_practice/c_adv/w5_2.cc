/*
编程题＃2: 二维数组右上左下遍历
来源: POJ (Coursera声明：在POJ上完成的习题将不会计入Coursera的最后成绩。)

注意： 总时间限制: 1000ms 内存限制: 65536kB

描述
给定一个row行col列的整数数组array，要求从array[0][0]元素开始，按从左上到右下的对角线顺序遍历整个数组。

// https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Gq_qOCD5EeWG5hLaeYFpVQ_888e644c307b3f277b12032c40c6f8d2_Screen-Shot-2015-07-02-at-1.24.44-PM.png?expiry=1615593600000&hmac=YUx6ctsG5ivbl7jU5QfuS05w3PjG-38pdpVg50xHslo

输入

输入的第一行上有两个整数，依次为row和col。

余下有row行，每行包含col个整数，构成一个二维整数数组。

（注：输入的row和col保证0 < row < 100, 0 < col < 100）

输出
按遍历顺序输出每个整数。每个整数占一行。

样例输入
3 4
1 2 4 7
3 5 8 10
6 9 11 12

样例输出
1
2
3
4
5
6
7
8
9
10
11
12
*/
#include <iostream>
using namespace std;
int main()
{
    int row(0), col(0), array[100][100] = {0};
    cin >> row >> col;
    for (int i(0); i < row; ++i)
    {
        for (int j(0); j < col; ++j)
        {
            cin >> array[i][j];
        }
    }
    for (int k(0); k < row + col - 1; ++k) // k最大是i + j - 2 
        for (int i(0); i < ((k + 1) < row ? (k + 1) : row); ++i) // i <= k && i < row 
            for (int j(k < (col - 1) ? k : (col - 1)); j >= 0; --j) // j <= k && j < col
                if (i + j == k) // 只输出满足i + j == k 的元素
                    cout << array[i][j] << endl;
    return 0;
}
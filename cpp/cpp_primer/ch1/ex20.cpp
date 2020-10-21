#include <iostream>
#include "Sales_item.h"

using namespace std;

int main(void)
{
    Sales_item book;
    cout << "请输入销售记录：" << endl;
    while (cin >> book)
    {
        cout << "ISBN、销售本数、销售额、平均售价\n" << book << endl;
    }

    return 0;
}
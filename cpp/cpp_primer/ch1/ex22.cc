#include <iostream>
#include "Sales_item.h"

using namespace std;

int main()
{
    Sales_item total, trans;
    cout << "Please enter some sales records with same ISBN:" << endl;
    if (cin >> total)
    {
        while (cin >> trans)
        {
            if (compareIsbn(total, trans)) // ISBN相同
            {
                total = total + trans;
            }
            else //ISBN不同
            {
                cout << "The ISBNs of two sales records are not match!" << endl;
                return -1;
            }
        }
         cout << "Summary Information:\n"
                    << "ISBN, number of copies sold, total revenue, average price\n "
                    << total << endl;
    }
    else
    {
        cout << "NO DATA" << endl;
        return -1;
    }

    return 0;
}
#include <iostream>
#include "Sales_item.h"

using namespace std;

int main()
{
    Sales_item item1, item2;
    cout << "Please enter two sales records with same ISBN." << endl;
    cin >> item1 >> item2;
    if (compareIsbn(item1, item2))
    {
        cout << "Summary Information:\n"
            << "ISBN, number of copies sold, total revenue, average price\n "
            << item1 + item2 << endl;
    }
    else
    {
        cout << "The ISBNs of two sales records are not match!" << endl;
    }

    return 0;
}
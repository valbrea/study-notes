#include <iostream>
using namespace std;

int main()
{
    int date;

    cout << "Enter the date." << endl; //数字1到7表示星期一到星期日
    cin >> date;
    if (date == 1 || date == 3 || date == 5)
    {
        cout << "No." << endl;
    }
    else 
    {
        cout << "Yes." <<endl;
    }

    return 0;
}
#include <iostream>

using namespace std;

int main(void)
{
    int a, b;
    
    cout << "Please input two integers." << endl;
    cin >> a >> b;

    if (a <= b)
    {
        while (a <= b)
        {
            cout << a << "\t";
            ++a;
        }
        cout << endl;
    }
    else
    {
        while (b <= a)
        {
            cout << b << "\t";
            ++b;
        }
        cout << endl;
    }

    return 0;
}
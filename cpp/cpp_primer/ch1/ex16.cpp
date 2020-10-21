#include <iostream>

using namespace std;

int main()
{
    int sum(0), num;

    cout << "Enter some integers.(press CTRL+D to end)" << endl;
    while (cin >> num) 
    {
        sum += num;
    }
    cout << "The sum of those integers is " << sum << endl;

    return 0;
}
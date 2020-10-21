#include <iostream>

using namespace std;

int main(void)
{
    int sum = 0;
    int num = 50;
    
    while(num <= 100) 
    {
        sum += num;
        ++num;
    }
    cout << "The sum from 50 to 100 is " << sum << endl;

    return 0;
}
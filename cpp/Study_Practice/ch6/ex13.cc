#include <iostream>
using namespace std;
int main()
{   
    int array[8];
    for (int i(0); i < 8; ++i)
        array[i] *= 2;
    for (int i(8); i >= 0; --i)
        cout << array[i] << ' ';
    cout << endl;
    return 0;
}
#include <iostream>

using namespace std;

int main(void)
{
    int i = 10;
    
    while (i >= 0) 
    {
        cout << i << "\t";
        --i;
    }
    cout << endl;

    return 0;
}
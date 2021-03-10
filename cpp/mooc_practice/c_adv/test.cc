#include <iostream>
#include <cstring>
using namespace std;
int main()
{
    int a[10] = {6, 7, 2, 9, 1, 10, 5, 8, 4, 3}, *p = a, i;

    for (i = 0; i < 10; i++, p++)
        if (p[i] > a[0])
            *a = *p;
    cout << *a << endl;
    return 0;
}
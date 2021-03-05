#include <iostream>
#include <cstring>
using namespace std;
int main()
{
    int c(45);
    cout << sizeof(&c) << endl;
    cout << sizeof(c) << endl;
    return 0;
}
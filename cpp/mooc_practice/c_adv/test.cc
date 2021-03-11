#include <iostream>
#include <cstring>
using namespace std;
int main()
{

    char essay[1000] = {0};
    cin.getline(essay, 1001);
    cout << strlen(essay) << endl;

    return 0;
}
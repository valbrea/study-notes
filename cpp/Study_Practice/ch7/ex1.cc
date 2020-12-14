#include <iostream>
#include <iomanip>
using namespace std;
int main()
{
    char ch1; 
    int space_count(0), tab_count(0), other_count(0);
    while ((ch1 = cin.get()) != '#')
    {
        if (ch1 == ' ')
            space_count++;
        else if (ch1 == '\t')
            tab_count++;
        else
            other_count++;
    }
    cout << setw(8) << "space"  << setw(8) << "tab" << setw(8) << "other" << endl;
    cout << setw(8) << space_count << setw(8) << tab_count << setw(8) << other_count << endl;

    return 0;
}
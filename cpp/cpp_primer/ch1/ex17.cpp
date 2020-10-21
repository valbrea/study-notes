#include <iostream>

using namespace std;

int main()
{
    int val(0), current_val(0);

    cout << "Please enter some integers(CTRL+D to end input):" << endl;
    while (cin >> current_val)
    {
        int cnt(1);

        while (cin >> val)
        {
            if (val == current_val)
            {
                ++cnt;
            }
            else
            {
                cout << current_val << "occured " << cnt << "times" << endl;
                current_val = val;
                cnt = 1;
            }
        }
        cout << current_val << "occured " << cnt << "times" << endl;
    }

    return 0;
}
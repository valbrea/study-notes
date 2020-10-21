#include <bits/stdc++.h>
using namespace std;

int main()
{
    string st;
    getline(cin, st);
    int i = 0, maxn = 0, ans = 0, sta = 0, len = st.size();
    for (; i < len; i++)
    {
        if (st[i] != ' ' && st[i] != '.')
            ans++;
        else
        {
            if (ans > maxn)
            {
                sta = i - ans;
                maxn = ans;
            }
            ans = 0;
            if (st[i] == '.')
                break;
        }
    }
    for (i = sta; i < sta + maxn; i++)
        cout << st[i];
    return 0;
}
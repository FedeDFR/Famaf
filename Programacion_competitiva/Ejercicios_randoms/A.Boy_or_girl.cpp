#include <bits/stdc++.h>
#define fore(i,a,b) for(int i=a;i<b;i++)
#define pb push_back
#define sz(x) (int)x.size()
#define fst first
#define snd second 
#define all(x) x.begin(),x.end()
#define REGALO ios::sync_with_stdio(0);cin.tie(0);cout.tie(0);

using namespace std;
typedef long long ll;
typedef pair<int,int> ii;


int main () {
    REGALO;
    
    string a;
    cin >> a;

    int i = 0;
    int x = 0;
    set<char> st;
    while (a[i] != '\0') {
        if (!st.count(a[i])) {
            st.insert(a[i]);
        }
        i++;
    }

    if (st.size()%2 == 1) {
        cout << "IGNORE HIM!\n";
    } else {
        cout << "CHAT WITH HER!\n"; 
    }
}
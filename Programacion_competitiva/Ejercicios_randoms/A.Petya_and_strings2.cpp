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
    string a, b;
    cin >> a >> b;
    int i = 0;

    while (a[i] != '\0' && b[i] != '\0') {
        if (a[i] >= 97 && a[i] <= 122) {
            a[i] = a[i] - 32;
        }

        if (b[i] >= 97 && b[i] <= 122) {
            b[i] = b[i] - 32;
        }

        if (a[i] > b[i]) {
            cout << 1 << "\n";
            break;
        } else if (a[i] < b[i]) {
            cout << -1 << "\n";
            break;
        } else {
            i++;
        } 
    }

    if (a[i] == b[i]) {
        cout << 0 << "\n";
    }
    
}
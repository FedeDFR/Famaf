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


int main () {

    int t;
    cin >> t;

    fore(i,0,t) {
        
        int a[3];
        fore(j,0,3) {
            
            int x;
            cin >> x;
            a[j] = x;

        }

        if(a[0] < a[1] && a[1] < a[2]) {
            cout << a[1] << "\n";

        } else if (a[0] > a[1] && a[1] > a[2]) {
            cout << a[1] << "\n";
        }

        if(a[1] < a[0] && a[0] < a[2]) {
            cout << a[0] << "\n";
            
        } else if (a[1] > a[0] && a[0] > a[2]) {
            cout << a[0] << "\n";
        }

        if(a[0] < a[2] && a[2] < a[1]) {
            cout << a[2] << "\n";
            
        } else if (a[0] > a[2] && a[2] > a[1]) {
            cout << a[2] << "\n";
        }

    }
}
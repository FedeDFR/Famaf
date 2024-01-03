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

    ll n;
    cin >> n;

    fore(i,0,n) {
        ll t;
        cin >> t;
        char a[t];
        char b[t];

        fore(i,0,t) {
            char c;
            cin >> c;

            if (c == 'B') {
                a[i] = 'B';
            } else if (c == 'G') {
                a[i] = 'B';
            } else if (c == 'R') {
                a[i] = 'R';
            }
            
  
        }

        fore(i,0,t) {
            char c;
            cin >> c;

            if (c == 'B') {
                b[i] = 'B';
            } else if (c == 'G') {
                b[i] = 'B';
            } else if (c == 'R') {
                b[i] = 'R';
            }
  
        }
        
        int x = 1;
        fore(i,0,t) {
           if (a[i] != b[i]) {
            x = 0;
           }
        }

        if(x) {
            cout << "YES \n";
        } else {

            cout << "NO \n";
        }

    }
    
}
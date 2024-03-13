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
    ll t;
    cin >> t;
    
    while(t--){
        int a = 5, b = 0;
        fore(i,0,5) {
            char q;
            cin >> q;
            if (q == 'A') {
                b++;
            } else {
                b--;
            }
        }

        if (b < 0) {
            cout << "B\n";
        } else {
            cout << "A\n";
        }
    }
}

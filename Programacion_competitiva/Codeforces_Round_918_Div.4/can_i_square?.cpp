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
        ll sum = 0;

        fore(j,0,t) {
            ll a;
            cin >> a;
            sum += a;
        }

        ll x = 1;
        while (x*x < sum) {
            x += 1;
        }

        if (x*x == sum) {
            cout << "YES" << "\n";
        } else {
            cout << "NO" << "\n";
        }
        
    }
    
}
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
    ll t, a = 1900, b = 1600, c = 1400, d  = 1899, e = 1599, f = 1399;
    cin >> t;
    
    while(t--){
        ll n; cin >> n;

        if (a <= n) {
            cout << "Division 1" << "\n"; 
        } else if (b <= n && n <= d) {
            cout << "Division 2" <<"\n";
        } else if (c <= n && n <= e) {
            cout << "Division 3" <<"\n";
        } else if (n <= f) {
            cout << "Division 4" << "\n";
        }
    }
}

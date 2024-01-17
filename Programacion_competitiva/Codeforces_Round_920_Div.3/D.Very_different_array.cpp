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
    while (t--) {
        ll n, m;
        cin >> n >> m;
        ll a[n], b[m];

        fore(i,0,n) {
            cin >> a[i];
        }
        fore(i,0,m) {
            cin >> b[i];
        }

        sort(a, a+n);
        sort(b, b+m);

        ll res = 0, l = 0, r = 0, i = 0;

        while (i<n) {
            if (abs(a[l]-b[m-1-l]) > abs(a[n-1-r]-b[r])) {
                res += abs(a[l]-b[m-1-l]);
                l++;
            } else {
                res += abs(a[n-1-r]-b[r]);
                r++;
            }
            i++;
        }
        
        cout << res << "\n";
    }
    
}
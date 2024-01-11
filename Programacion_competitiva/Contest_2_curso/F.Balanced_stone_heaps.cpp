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

    int t;
    cin >> t;

    while (t--) {

        int n;
        cin >> n;
        vector<ll> a(n);

        fore(i,0,n) {
            cin >> a[i];
        }

        ll l=0, r=1e9;

        while (l<=r) {
            ll mid = (l+r)/2;
            vector<ll> now = a;

            for (int i = n; i >= 2; i--) {
                ll can = max(0ll, now[i]-mid);
                can = min(can, a[i]);
                can /= 3;

                now[i-1] += can;
                now[i-2] += 2ll*can;
                now[i] -= can;
            }

            int can = 1;
            fore(i,0,n) can&=now[i]>=mid;

            if(can) l =mid+1;
            else r = mid-1; 
        }
        
        cout << r << "\n";
    }
    
    
}

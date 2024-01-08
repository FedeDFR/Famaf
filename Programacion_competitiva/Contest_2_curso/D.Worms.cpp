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
    ll worms[n];
 
    fore(i,0,n) {
        ll a;
        cin >> a;
        worms[i] = a;
    }
 
    ll m;
    cin >> m;

    ll sum[n+1];
    sum[0] = 0;
    
    fore(i,0,n) sum[i+1] = sum[i] + worms[i];
 
    fore(i,0,m) {
        ll q;
        cin >> q;
 
        int l = 0;
        int r = n-1;
        
        while(l<=r) {
            int mid = (l+r)/2;
            if(sum[mid] >= q) {
                r = mid-1;
            } else {
                l = mid+1;
            }
        }
 
        cout << l << "\n";
    }
 
}

/*int main () {

    int n;
    cin >> n;
    vector<int> a(n);

    fore(i,0,n) {
        cin >> a[i];
    }

    fore(i,1,n) {
        a[i] += a[i-1];
    }

    int m;
    cin >> m;

    fore(i,0,m) {
        int p;
        cin >> p;

        int res = lower_bound(a.begin(), a.end(), p) - a.begin();
        cout << res+1 << "\n";

    }

}
*/
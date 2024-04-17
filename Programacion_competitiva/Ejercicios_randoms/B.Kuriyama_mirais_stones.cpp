
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
    ll n;
    cin >> n;
    ll a[n], i = 0;
      
    while(i < n){
        cin >> a[i];
        i++;
    }

    
    ll sum1[n+1], m;
    sum1[0] = 0;

    fore(i,0,n) {
        sum1[i+1] = sum1[i] + a[i];
    }

    sort(a, a+n);
    
    ll sum2[n+1];
    sum2[0] = 0;

    fore(i,0,n) {
        sum2[i+1] = sum2[i] + a[i];
    }

    cin >> m;

    while (m--) {
        ll x, l, r;
        cin >> x >> l >> r;

        if (x == 1) {
            cout << (sum1[r] - sum1[l-1]) << "\n";
        }
        
        if (x == 2) {
            cout << (sum2[r] - sum2[l-1]) << "\n";
        }   
    }
}

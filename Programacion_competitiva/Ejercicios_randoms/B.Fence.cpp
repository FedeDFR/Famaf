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
    ll n, k;
    cin >> n >> k;

    ll a[n], i = 0;

    while(i < n){
        cin >> a[i];
        i++;
    }

    ll sum[n+1];
    sum[0] = 0;
    fore(i,0,n+1) {
        sum[i+1] = sum[i] + a[i];
    }

    ll min_sum = INT_MAX;
    ll r = 0;
    i = 0;
    while(i+k <= n) {
        if (min_sum > sum[i+k]-sum[i]) {
            r = i+1;
            min_sum = sum[i+k]-sum[i];
        }
        i++;
    }

    cout << r << "\n";
}
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
    int n;
    cin >> n;
    int a[n];
    fore(i,0,n) cin >> a[i];

    int sum[n+1];
    sum[0] = 0;

    fore(i,0,n+1) sum[i+1] = sum[i]+a[i];

    int res = 0;
    int mins = 0;

    fore(j,0,n+1) {
        mins = min(mins, sum[j]); 
        res = max(res, (sum[j]-mins));
    }

    cout << res;
}
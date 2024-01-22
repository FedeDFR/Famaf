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
    int n, l;
    cin >> n >> l;
    int a[n];
    fore(i,0,n) {
        cin >> a[i];
    }
    sort(a, a+n);
    long double res = 0;

    fore(i,0,n-1) {
        if (a[i+1]-a[i] > res) {
            res = a[i+1]-a[i];
        }
    }

    if (a[0] > res/2 && l-a[n-1] <= res/2) {
        cout << a[0] << "\n";
    } else if (l-a[n-1] > res/2) {
        cout << l-a[n-1] << "\n";
    } else {
        cout << res/2 << "\n";
    }
}
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

int main() {

    ll n;
    cin >> n;
    ll m;
    cin >> m;
    ll a;
    cin >> a;

    n = (n+a-1)/a;
    m = (m+a-1)/a;
    a = n*m;

    cout << a << "\n";
}
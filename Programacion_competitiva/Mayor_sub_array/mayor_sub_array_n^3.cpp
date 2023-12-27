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

    int res = 0;

    fore(i,0,n) {
        fore(j,i,n) {
            int suma = 0;
            fore(k,i,j+1) {
                suma += a[k];
            }
            res = max(res, suma);
        }
    }

   cout << res << "\n";
}
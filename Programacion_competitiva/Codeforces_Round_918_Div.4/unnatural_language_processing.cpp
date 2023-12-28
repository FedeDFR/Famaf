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

    fore(i,0,n) {
        ll t;
        cin >> t;
        string a;

        fore(j,0,t) {
            char x;
            cin >> x;
            a[i] = x;
        }
        string res;
        ll k = 3;
        ll puntos = 0;
        while (k > t) {
            if ((a[k] == 'a') ||(a[k] == 'e')) {
                res[k-3-puntos] = a[k-3];
                res[k-2-puntos] = a[k-2];
                res[k-1-puntos] = '.';
                puntos += 1;
            } else {
                res[k-3-puntos] = a[k-3];
                res[k-2-puntos] = a[k-2];
                res[k-1-puntos] = a[k-1];
                res[k-puntos] = '.';
                puntos += 1;
            }
            k = k + 4;
            
        }
        fore(l,0,puntos+t) {
            cout << res[l] << "\n";
        }
    } 
}               //sin terminar
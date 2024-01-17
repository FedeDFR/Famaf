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

    fore(i,0,t) {
        ll n, f, a, b;
        cin >> n >> f >> a >> b;
        int m[n+1];
        m[0] = 0;
        fore(i,1,n+1) {
            cin >> m[i];
        }

        if (n > 1) {
            fore(i,0,n) {
                if (a*(m[i+1]-m[i]) > b) {
                    f -= b;
                } else {
                    f -= a*(m[i+1]-m[i]);
                }
            }
        } else {
            if (a*m[1] > b) {
                f -= b;
            } else {
                f -= a*m[1];
            }
            
        }
        
        if (f <= 0) {
            cout << "NO\n";
        } else {
            cout << "YES\n";
        }
    }
}
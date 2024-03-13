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
    ll t;
    cin >> t;
    int a[t], res = 0, aux = 0;

    fore(i,0,t) {
        cin >> a[i];
    }

    sort(a, a+t);

    int r = 0, l = t-1;
    while (r<l) {
        if (aux != 0) {
            if (aux+a[r] == 4) {
                r++;
                aux = 0;
            } else if (aux+a[r] > 4) {
                aux = 0;
            } else if (aux+a[r] < 4) {
                aux += a[r];
            } 
        } 
        if (a[l] == 4) {
            l--;
            res++;
        } else if (a[r]+a[l] == 4) {
            r++;
            l--;
            res++;
        } else if (a[r]+a[l] < 4) {
            aux = a[r]+a[l];
            r++;
            l--;
            res++;  
        } else {
            l--;
            res++;
        }
    }
    
    cout << res << "\n";
    
}
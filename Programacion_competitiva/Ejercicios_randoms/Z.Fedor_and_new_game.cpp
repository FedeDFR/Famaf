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

vector<int>  decimalBinario(int x) {
    vector<int> a(22);
    int i = 0;

    while (x != 1) {
        a[i] = x%2;
        x /= 2;
        i++;
    }

    a[i] = 1;

    return a;
}


int main () {
    int n, m, k, a[m+1];

    cin >> n >> m >> k;

    fore(i,0,m+1) {
        cin >> a[i];
    }

    int res = 0, aux = 0;
    vector<int> fedor = decimalBinario(a[m]);
    vector<int> giri;

    fore(i,0,m) {
        aux = 0;
        giri = decimalBinario(a[i]);
        fore(j,0,n) {
            if (fedor[j] != giri[j]) {
                aux++;
            }
        }

        if (aux <= k) {
            res++;
        }
        
    }
    cout << res << "\n";
}
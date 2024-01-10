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

    int t;
    cin >> t;
    while(t--) {
    int n;
    cin >> n;

    vector<int> a(n), b(n);

    fore(i,0,n) cin >> b[i] >> a[i];

    int l = 1;
    int r = n;

    while (l <= r) {
        int k = (l+r)/2;
        int ya_puse = 0;
        int me_falta = k;

        fore(i,0,n) {
            if(me_falta > 0) {
                int left = a[i];
                int right = b[i];

                if(me_falta-1 <= right && ya_puse <= left) {
                    ya_puse++;
                    me_falta--;
                }
            }
        }

        if(me_falta == 0) {
            l = k+1;
        } else {
            r = k-1;
        }
    }
    cout << r << "\n";

    }
}
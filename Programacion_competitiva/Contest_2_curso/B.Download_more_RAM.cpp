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

    fore(i,0,t) {

        int n;
        cin >> n;
        int k;
        cin >> k;
        
        int a[n];
        fore(j,0,n) {

            int x;
            cin >> x;
            a[j] = x;
            
        }

        int b[n];
        fore(j,0,n) {

            int y;
            cin >> y;
            b[j] = y;
            
        }

        pair<int, int> c[n];
        fore(j,0,n) {

            c[j].first = a[j];
            c[j].second = b[j];

        }

        sort(c, c+n);
        
        int res = k;

        fore(j,0,n) {

            if(k >= c[j].first) {
                k += c[j].second;
            }
            
        }

        cout << k << "\n";
    }
}
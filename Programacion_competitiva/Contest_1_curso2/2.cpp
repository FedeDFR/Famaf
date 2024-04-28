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
    
    while(t--){
        ll a, b, c; cin >> a >> b;
        ll max;
        
        if (a >= b) {
            max = a;
        } else {
            max = b;
        }

        cin >> c;

        if (c > max) {
            max = c;
        }

        if (max == a && max != b && max != c) {
            cout << max-a << " " << max-b+1 << " " << max-c+1 << "\n";
        } else if (max == b && max != a && max != c) {
            cout << max-a+1 << " " << max-b << " " << max-c+1 << "\n";
        } else if (max == c && max != b && max != a){
            cout << max-a+1 << " " << max-b+1 << " " << max-c << "\n";
        } else {
            cout << max-a+1 << " " << max-b+1 << " " << max-c+1 << "\n";
        }
    }
}

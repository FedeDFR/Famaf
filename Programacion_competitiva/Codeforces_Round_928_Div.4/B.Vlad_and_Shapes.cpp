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
        int n, r = 0;
        cin >> n;

        fore(i,0,n) {
            string s;
            cin >> s;

            fore(j,0,n) {
                if (s[j] == '1') {
                    r++;
                }
            }

            if (r == 1) {
                cout << "TRIANGLE\n";
                break;
            }    
        }
        if (r != 1) {
            cout << "SQUARE\n";
        }
        
    }
}
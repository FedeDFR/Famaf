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
        int a, b;
        int x1, y1;
        cin >> x1 >> y1;
        fore(i,0,3) {
            int x2, y2;
            cin >> x2 >> y2;
            if ((x1 != x2) && (y1 != y2)) {
                a = x1-x2;
                b = y1-y2;
                if (a < 0) {
                    a = -a;
                }
                if (b < 0) {
                    b = -b;
                }
                cout << a*b << "\n";
            }
        }
    }
}
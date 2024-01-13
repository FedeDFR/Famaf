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
    
    int n;
    cin >> n;
    int a[n][3];
    int x = 0;
    int y = 0;
    int z = 0;

    fore(i,0,n) {
        fore(j,0,3){
            cin >> a[i][j];
            if (j == 0) {
                x += a[i][j];
            }
            if (j == 1) {
                y += a[i][j];
            }
            if (j == 2) {
                z += a[i][j];
            }
        }
    }

    if (x == 0 && y == 0 && z == 0) {
        cout << "YES\n";
    } else {
        cout << "NO\n";
    }
    
}
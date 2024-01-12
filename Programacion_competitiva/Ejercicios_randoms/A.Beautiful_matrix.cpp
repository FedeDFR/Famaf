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
    
    int a[5][5];
    int r;
    int l;

    fore(i,0,5) {
        fore(j,0,5) {
            cin >> a[i][j];
            if (a[i][j] == 1) {
                r = i-2;
                if (r<0) {
                    r *= -1;
                }
                l = j-2;
                if (l<0) {
                    l *= -1;
                }
            }  
        }
    }
    cout << r+l << "\n";  
}
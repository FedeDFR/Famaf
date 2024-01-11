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
    int n;
    cin >> n;
    int r = 0;

    fore(i,0,n) {
        int x = 3;
        fore(i,0,3) {
            int a;
            cin >> a;
            if (a == 1) {
                x--;
            }
        }
        if (x <= 1) {
            r++;
        }
    }

    cout << r << "\n";
    
}

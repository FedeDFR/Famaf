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

    REGALO;
    int n;
    cin >> n;
    int m;
    cin >> m;
    int a[n];
    int z = 0;

    fore(i,0,n) a[i] = 0;
    
    fore(i,0,m) {

        int x;
        cin >> x;

        if (a[x-1] == 0) {
            z++;
        } 
        
        a[x-1]++;

        if (z == n) {
            cout << 1;
            z = 0;

            fore(i,0,n) {
                a[i]--;

                if(0 < a[i]) {
                    z++;
                }
            }
        } else {
            cout << 0;
        }
    }
}
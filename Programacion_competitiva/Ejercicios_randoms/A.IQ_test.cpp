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
    int a[n];

    fore(i,0,n) {
        cin >> a[i];
    }
    int par = 0, imp = 0, resp, resi;
    fore(i,0,n) {
        if (a[i]%2 == 0) {
            par++;
            resp = i+1;
        } else {
            imp++;
            resi = i+1;
        }
    }

    if (par < imp) {
        cout << resp << "\n";
    } else {
        cout << resi << "\n";
    }
    
}
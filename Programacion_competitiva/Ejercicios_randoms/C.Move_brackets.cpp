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
    cin>>t;
    
    while(t--){
        ll n;
        cin >> n;
        string a;
        cin >> a;
        char c;
        int aux = 0, cont = 0;
        bool cierra = false;
        fore (i,0,n) {
            if (a[i] == ')' && !cierra) {
                cont++;
            }
            if (a[i] == ')' && aux > 0 && cierra) {
                aux--;
                if (aux<=0) {
                    cierra = false;
                }
            }
            if (a[i] == '(') {
                aux++;
                cierra = true;
            }
        }
        cout << cont << "\n";
    }
}

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

    int monedas[] = {1,5,10,20,100};

    ll n;
    cin >> n;

    ll x = 0;
    int i = 4;

    while(n > 0) {
        while(n < monedas[i]) {
            i--;
        }

        n -= monedas[i];
        x++;
        
    }

    cout << x << "\n";
}
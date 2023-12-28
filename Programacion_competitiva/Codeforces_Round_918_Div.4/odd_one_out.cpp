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

   int n;
   cin >> n;

   fore (i,0,n) {
        int a;
        cin >> a;
        int b;
        cin >> b;
        int c;
        cin >> c;

        if (b == c && a != b) {
            cout << a << "\n";
        } else if (b != c && b == a) {
            cout << c << "\n";
        } else {
            cout << b << "\n";
        }
   }
}
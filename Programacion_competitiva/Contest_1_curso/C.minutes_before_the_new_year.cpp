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
    
    int t;
    cin >> t;

    fore(i,0,t) {

        int hh;
        cin >> hh;
        int mm;
        cin >> mm;

        int r = 60-mm + 60*(23-hh);

        cout << r << "\n";
    }
    
}
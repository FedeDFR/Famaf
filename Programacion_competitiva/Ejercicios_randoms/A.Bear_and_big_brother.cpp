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
    
    int a;
    cin >> a;
    int b;
    cin >> b;

    int r = 0;
    int i = 0;
    while (a <= b) {
        a *= 3;
        b *= 2;
        r++;
    }
    
    cout << r << "\n";

}
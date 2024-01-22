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
    int b = a;
    bool x = true;
    while ( a != 0) {
        if (a%10 != 4 && a%10 != 7) {
            x = false;
        }
        a /= 10;
    }   
    if (b%4 == 0 || b%7 == 0 || b%44 == 0 ||
        b%47 == 0 || b%77 == 0 || b%74 == 0 ||
        b%444 == 0 || b%744 == 0 || b%774 == 0 ||
        b%777 == 0 || b%477 == 0 || b%447 == 0 || 
        b%474 == 0 || b%747 == 0 ||x) {
        cout << "YES\n";
    } else {
        cout << "NO\n";
    }
    
}

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
    
    string a;
    cin >> a;
    string b;
    cin >> b;

    int i = 0;
    int x;
    int y;
    int r;
    while (a[i] != '\0' && b[i] != '\0') {
        if (65<=a[i] && a[i]<=90) {
            x = a[i]-65;
        }
        if (97<=a[i] && a[i]<=122) {
            x = a[i]-97;
        }
        if (65<=b[i] && b[i]<=90) {
            y = b[i]-65;
        }
        if (97<=b[i] && b[i]<=122) {
            y = b[i]-97;
        }

        if (x-y < 0) {
            r = -1;
            break;
        }
        if (x-y > 0){
            r = 1;
            break;
        }

        i++;
    }
    
    
    if (a[i] == '\0' && x == y) {
        r = 0;
    }
    
    cout << r << "\n";
}
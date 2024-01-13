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

    int i = 0;
    while (a[i] != '\0') {
        if (65 <= a[i] && a[i] <= 90) {
            a[i] += 32;
        }

        if (!(a[i] == 'a' || a[i] == 'e' || a[i] == 'i' || a[i] == 'o' || a[i] == 'u' || a[i] == 'y')) {
            cout << "." << a[i];
        }
        
        i++;
    }
    
    cout << "\n";
    
}
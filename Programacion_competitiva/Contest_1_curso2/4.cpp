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
    cin >> t;
    
    while(t--){
        string a, b; cin >> a >> b;

        ll i = 0;
        while (a[i] != '\0' || b[i] != '\0') {
            i++;
        }

        if ((a[i] == '\0' && b[i] != '\0') && (a[i] != '\0' && b[i] == '\0')) {
            if (a[i-1] == b[i-1] && (a[i] == '\0' && b[i] == '\0')) {
                cout << "= \n";
            } else {
                if (a[i-1]-b[i-1] > 0) {
                    cout << "<1 \n";
                } else {
                    cout << ">2 \n";
                }
            }
        } else {
            if (a[i] == '\0' && b[i] != '\0') {
                ll j = 0;
                while (b[j] != '\0') {
                    j++;
                }
                if (a[i-1] == b[j-1]) {
                    if (a[i-1] == 'L') {
                        cout << "<3 \n";
                    }
                    if (a[i-1] == 'S') {
                        cout << "> 4\n";
                    }
                } else {
                    if (a[i-1]-b[j-1] > 0) {
                        cout << "< 5\n";
                    } else {
                        cout << "> 6\n";
                    }
                }  
            }

            if (a[i] != '\0' && b[i] == '\0') {
                ll j = 0;
                while (a[j] != '\0') {
                    j++;
                }
                if (a[j-1] == b[i-1]) {
                    if (a[j-1] == 'L') {
                        cout << ">7 \n";
                    }
                    if (a[j-1] == 'S') {
                        cout << "< 8\n";
                    }
                } else {
                    if (a[j-1]-b[i-1] > 0) {
                        cout << "< 9\n";
                    } else {
                        cout << "> 0\n";
                    }
                }  
            }
        }
    }  
}
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
    
    int t;
    cin >> t;

    fore(i,0,t) {

        int n;
        cin >> n;
        string a;
        int debe = 0;
        string b;
        int hay = 0;
        int r = 0;

        cin >> a >> b;

        fore(i,0,n) {
            if (a[i] == '1') {
            }
        }

        fore(i,0,n) {
            if (b[i] == '1') {
            }
        }

        fore(i,0,n) {
            if (a[i] == '0' && b[i] == '1') {
                debe++;
            } 
            if (a[i] == '1' && b[i] == '0') {
                hay++;
            } 
        }

        if  (debe <= hay) {
            cout << hay << "\n";
        } else {
            cout << debe << "\n";
        }
    }

}
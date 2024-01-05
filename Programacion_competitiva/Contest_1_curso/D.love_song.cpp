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

    int legnth;
    cin >> legnth;
    int n;
    cin >> n;

    int c[legnth];
    fore(i,0,legnth) {
        char d;
        cin >> d;
        c[i] = d-'a'+1;

    }

    int sum[legnth+1];
    sum[0] = 0;

    fore(i,0,legnth+1) {
        sum[i+1] = sum[i] + c[i];
    }

    fore(i,0,n) {
        int a;
        cin >> a;
        int b;
        cin >> b;
        int res = sum[b]-sum[a-1];

        cout << res << "\n";
    }
}
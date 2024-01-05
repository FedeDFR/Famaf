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
    REGALO;

    vector<pair<int,int>> v;
    pair<int,int> p;

    ll n;
    cin >> n;

    fore(i,0,n) {
        int a;
        cin >> a;
        int b;
        cin >> b;

        p = {a,b};
        v.push_back(p);
    }

    sort(v.begin(), v.end());

    int x = INT_MAX;
    int s = 0;
    for(auto i:v) {
        if(x > i.second && (x != INT_MAX)) {
            s = 1;
        }
    x = i.second;
    }

    if(s) {
        cout << "Happy Alex \n";
    } else {
        cout << "Poor Alex \n";
    }
    
}
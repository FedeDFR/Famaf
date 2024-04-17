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

bool comp (pair<ll,ll> a,pair<ll,ll> b){              //sirve para el sort configuramos con lo queremos ordenar
    if(a.first==b.first){return a.second<b.second;}
    return a>b;
}

int main () {
    REGALO;
    ll n, k;
    cin >> n >> k;
    vector<pair<int,int>> v(n);
    
    fore(i,0,n) {
        int x, y; cin >> x >> y;
        v[i] = {x,y};     
    }

    sort(v.begin(), v.end(), comp);

    ll r = 0;
    fore(i,0,n) {
        if (v[k-1].second == v[i].second && v[k-1].first == v[i].first) {
            r++;
        }
    }
    cout << r << "\n";
}
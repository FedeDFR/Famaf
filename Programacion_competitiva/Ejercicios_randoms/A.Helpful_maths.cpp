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
    vector<int> num(3);
    while (a[i] != '\0') {
        if (a[i] == '1'){
            num[0]++;
        }
        if (a[i] == '2'){
            num[1]++;
        }
        if (a[i] == '3'){
            num[2]++;
        }
        i++;
    }

    fore(i,0,3) {
        while (num[i] > 0) {
            cout << i+1;
            num[i]--;
            if (num[0] > 0 || num[1] > 0 || num[2] > 0) {
                cout << '+';
            }
        }
    }

    cout << "\n";
    
}
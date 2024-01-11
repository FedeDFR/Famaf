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

int main() {
    
    REGALO;

    int n;
    cin >> n;

    for (size_t i = 0; i < n; i++) {
        string str;
        cin >> str;

        int largo = str.length(); // con string.length() saco el largo de la palabra

        //caso n > 10
        if(largo > 10) {
            cout << str[0] << largo-2 << str[largo-1] << endl;
        } else {
            cout << str << "\n";
        }
    }
}

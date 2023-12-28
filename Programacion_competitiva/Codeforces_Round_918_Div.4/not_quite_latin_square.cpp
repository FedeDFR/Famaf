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
    int n;
    cin >> n;
    char a[n][3][3];

    fore(i,0,n) {
        fore(j,0,3) {
            fore(k,0,3) {
                char x;
                cin >> x;
                a[i][j][k] = x;
            }
        }
    }

    char res;

    fore(i,0,n) {
        fore(j,0,3) {
            fore(k,0,3) {
                if ((a[i][j][k]) == '?') {
                    if (k == 0) {
                        if ((a[i][j][k+1] == 'A') && (a[i][j][k+2] == 'C')) {
                            cout << 'B' << "\n";
                        }
                        if ((a[i][j][k+1] == 'C') && (a[i][j][k+2] == 'A')) {
                            cout << 'B' << "\n";
                        }
                        if ((a[i][j][k+1] == 'C') && (a[i][j][k+2] == 'B')) {
                            cout << 'A' << "\n";
                        }
                        if ((a[i][j][k+1] == 'B') && (a[i][j][k+2] == 'C')) {
                            cout << 'A' << "\n";
                        }
                        if ((a[i][j][k+1] == 'A') && (a[i][j][k+2] == 'B')) {
                            cout << 'C' << "\n";
                        }
                        if ((a[i][j][k+1] == 'B') && (a[i][j][k+2] == 'A')) {
                            cout << 'C' << "\n";
                        }
                    }
                    
                    if (k == 2) {
                        if ((a[i][j][k-2] == 'A') && (a[i][j][k-1] == 'C')) {
                            cout << 'B' << "\n";
                        }
                        if ((a[i][j][k-2] == 'C') && (a[i][j][k-1] == 'A')) {
                            cout << 'B' << "\n";
                        }
                        if ((a[i][j][k-2] == 'B') && (a[i][j][k-1] == 'C')) {
                            cout << 'A' << "\n";
                        }
                        if ((a[i][j][k-2] == 'C') && (a[i][j][k-1] == 'B')) {
                            cout << 'A' << "\n";
                        }
                        if ((a[i][j][k-2] == 'A') && (a[i][j][k-1] == 'B')) {
                            cout << 'C' << "\n";
                        }
                        if ((a[i][j][k-2] == 'B') && (a[i][j][k-1] == 'A')) {
                            cout << 'C' << "\n";
                        }
                    }
                    
                    if (k == 1) {
                        if ((a[i][j][k-1] == 'A') && (a[i][j][k+1] == 'C')) {
                            cout << 'B' << "\n";
                        }
                        if ((a[i][j][k-1] == 'C') && (a[i][j][k+1] == 'A')) {
                            cout << 'B' << "\n";
                        }
                        if ((a[i][j][k-1] == 'B') && (a[i][j][k+1] == 'C')) {
                            cout << 'A' << "\n";
                        }
                        if ((a[i][j][k-1] == 'C') && (a[i][j][k+1] == 'B')) {
                            cout << 'A' << "\n";
                        }
                        if ((a[i][j][k-1] == 'B') && (a[i][j][k+1] == 'A')) {
                            cout << 'C' << "\n";
                        }
                        if ((a[i][j][k-1] == 'A') && (a[i][j][k+1] == 'B')) {
                            cout << 'C' << "\n";
                        }
                    }
                    
                }
            }
            
        }
    }
}
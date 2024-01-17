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

const int MAXN = 110;
int parent[MAXN];
int size[MAXN];
int size1[MAXN];
int size2[MAXN];

void make_set(int v) {      //crea un nuevo conjunto que consiste en el nuevo elemento.
    parent[v] = v;
}

int find_set(int v) {       //devuelve al representante (también llamado líder) del conjunto que contiene el elemento v.
    if (v == parent[v])
        return v;
    return parent[v] = find_set(parent[v]);
}

void union_sets(int a, int b) {     //fusiona los dos conjuntos especificados (el conjunto en el que el elemento ase encuentra, y el conjunto en el que el elemento bse encuentra). 
    a = find_set(a);
    b = find_set(b); 
    if (a != b) {
        if (size1[a] < size2[b])
            swap(a, b);
        parent[b] = a;
        size1[a] += size2[b];
    }
}

int n, m;
vector<pair<ii, int>> v(m);
set<int> colores;

int main () {
    REGALO;
    
    cin >> n >> m;

    int a, b, c;

    fore(i,0,m) {
        cin >> a >> b >> c;
        if (colores.count(c)) {
            
        } else {
            colores.insert(c);
            make_set(c);
        }
        
    }

    int q;
    cin >> q;
    int x, y;

    fore(i,0,q) {
        cin >> x >> y;
    }

}

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


const int MAXN = 1024, INF = MAXN*MAXN;
vector<pair<int,int> > g[MAXN];  // u->[(v,cost)]
int dist[MAXN][MAXN];
int n, m;   //fila, columna
string s[MAXN];
vector<ii> moves = {{1,0}, {0,1}, {-1,0}, {0,-1}};

int to(int i, int j) {
    return m*i+j;
}

ii from(int x) {
    return {x/m, x%m};
}

bool valido(int i, int j) {
    if(!(0 <= i && i<n && 0 <= m && j <= m)) return false;
    if(s[i][j] == 'T') return false;
    return true;
}

void dijkstra(int ri, int rj){

    fore(i,0,n) fore(j,0,m) {
        dist[i][j] = INF;
    }

	priority_queue<ii, vector<ii>, greater<ii>> pq;

	dist[ri][rj]=0;
    int indice = to(ri, rj);
    pq.push({0, indice});

	while(pq.size()){
		//int costo = pq.top().first;
        auto donde = from(pq.top().second);
        pq.pop();
        int i = donde.first, j = donde.second;
        for(auto move:moves) {
            int ni = i+move.first, nj = j+move.second;

            if(valido(ni, nj)) {
                if(dist[i][j] + 1 < dist[ni][nj]) {
                    dist[ni][nj] = dist[i][j]+1;
                    pq.push({dist[ni][nj], to(ni, nj)});
                }
            }
        }
	}
}

int main () {
    REGALO;

    cin >> n >> m;
    
    fore(i,0,n) cin >> s[i];

    fore(i,0,n) fore(j,0,m) {
        if (s[i][j] == 'E') {
            dijkstra(i, j);
        }   
    }

    int min_dis = INF;

    fore(i,0,n) fore(j,0,m) {
        if (s[i][j] == 'S') {
            min_dis = dist[i][j];
        }
    }

    int res = 0;

    fore(i,0,n) fore(j,0,m) {
        if ('1' <= s[i][j] && s[i][j] <= '9') {
            if (dist[i][j] <= min_dis) {
                res += (s[i][j]-'0');
            }
        }
    }
    
    cout << res << "\n";
    
}
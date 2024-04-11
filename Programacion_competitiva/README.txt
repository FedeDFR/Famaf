
-----------------------------/ Compilar /-----------------------------


Vamos a compilar con g++, escribo en la terminal

g++ -Wall -std=c++17 "fiel.cpp"

luego 

./a.out

e ingreso los input que me hagan falta

flasgs g++ -O2 -Wall -Wextra -std=c++17 "file.cpp"


-----------------------------/ Macros /-----------------------------


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
    }
}

-----------------------------/ Funciones con flotantes /-----------------------------


https://www.programacionfacil.org/cursos/c++/capitulo-19-funciones-matematicas.html


-----------------------------/ Formulas y funciones/-----------------------------


-Division techo para int a, b; [a/b]:    (a+b-1)/b

-Array de sumas parciales a[n]:    sum[n] = sum[n-1]+a[n]     donde sum[0] = 0 
    para calcular la suma entre un a[l] y a[r] siendo l<r:   sum[r+1]-sum[l]

-Ordenar un Array a[n]: sort(a, a+n)

-Devuelve puntero del primer elementomayor igual a x de un a[n] ordenado: lower_bound(a, a+n, x)
    Con Vectores: lower_bound(v.begin(), v.end(), x)
    Para que te de el indice tendrias que hacer incide = lower_bound(a, a+n, x) - a;
    Con Vectores: indice = lower_bound(v.begin(), v.end(), x) - v.begin();

    Si devuelve un indice fuera de rango no existe un elemento mayor o igual

-La función memset copia el valor de c (convertido a un unsigned char) a cada uno de los primeros n caracteres en el objeto al cual señala s. La función memset devuelve el valor de s.
	void *memset ( void *s, int c, size_t n);
	
-Busca cualquier carácter que esté en mayúsculas.
	int isupper(int c);
	
-Busca cualquier carácter que sea letra minúscula.
	int islower(int c);
	
-Convierte una letra mayúscula en la minúscula correspondiente.Si el argumento es un carácter para el que isupper resulta verdadero y existe un caracter correspondiente para el cual islower resulta verdadero, la función tolower devuelve elo carácter correspondiente.
	int tolower(int c);
	
-Convierte una letra minúscula a la letra mayúscula correspondiente.Si el argumento es un carácter para el cual islower resulta verdadero y existe un carácter correspondiente para el cual isupper es verdadero, la función toupper devueve el carácter correspondiente.
	int toupper(int c);
	
-Calcula el coseno de x (medido en radianes).
	double cos(double x);
	
-Devuelve el seno de x (medido en radianes).
	double sin(double x);
	
-Devuelve la tangente de x (medida en radianes).
	double tan(double x);
	
		
-----------------------------/ Tipos de datos y sus tamaños /-----------------------------





-----------------------------/ Tiempos y orden /-----------------------------


Tiempo aprox de una pc es 1s = 10^8 operaciones
Funcion de ordenacion de c++ es de o(n log(n))


-----------------------------/ Union Find-Disjoint set union /-----------------------------


https://cp-algorithms.com/data_structures/disjoint_set_union.html


uf_join(int a, int b) {
    rep[a] = rep[ab];
}

uf_find(int a) {
    if(a == uf_find(a)) {       //Si a es igual a mi representante ret a
        return a;
    }
    uf[a] = uf_find(uf[a]);     //Sino busco el representante de donde este a
}


-----------------------------/ Vectores /-----------------------------


vector <int> v;             //crea un vector
v.push_back(x)              //agrega el elemento x al final del vector
v.pop_back(x)               //elimina el elemento x
v.size()                    //tamaño del vector
sort(v.begin(), v.end())    //ordena el vector con complejidad 0(n*log n)
vector<int> a(n);                                   //array de n vectores
lower_bound(a.begin(), a.end(), p) - a.begin();     //devuelve la posicion del menor elemento mayor a p

for(auto i:v){
        cout << i << "";    //imprime los elementos del arreglo
    }


-----------------------------/ Strings /-----------------------------

string s="Hola mundo ";
string t = "ANA";
string a = s + t ;          //concatena

char c,s; cin >> c>>s;
cout << int (c-'a') <<  "\n"
cout << char('a'+15) << "\n";  //devuelve la posicion en ascii de c - el valor en ascii de 'a', despues imprime el char 'p'


-----------------------------/ Set /-----------------------------


set<ll> st;                 //inicializo el set
st.insert(x);               //insertamos un elemento en el conjunto, si hay varios no importa
st.erase(x);                //elimino el elemento x del set
st.count(x)                 //pregunta si x esta en el conjunto

//todas las funciones son de orden O(log n)


-----------------------------/ Map /-----------------------------


//Podes asociar distintos tipos de datos a otros

map <pair <ll,ll>,int> mp;  //inicializo un map que asocia un pair con un int
mp [{2,4}]=7;               //asocia el pair {2,4} esta asociada al numero 7
mp.erase ({2,4});           //libera la asociacion al pair {2,4} a 7
mp.count({2,4});            //devuelve 1 si el pair {2,4} esta asociado a algo


-----------------------------/ Pair /-----------------------------


pair<int,int> p={1,2},q={3,1},r={3,0};  //inicializo pair de int
p.first;                                //primer elemento del par
vector<pair<int,int>> v;
v.push_back(p);
v.push_back(q);
v.push_back(r);
sort(v.begin(),v.end());                //ordeno el vector de pair


// ejemplo
int n; cin >> n;
vector <pair<int,int>> v;

fore(i,0,n) {
    int x; cin >> x;
    v.push_back({x,i});     
}


-----------------------------/ Busqueda binaria /-----------------------------


int l = 0;
int r = n-1;
        
while(l<=r) {
    int mid = (l+r)/2;
    if(a[mid] >= q) {
        r = mid-1;
    } else {
        l = mid+1;
    }
}


-----------------------------/ Filas y columnas /-----------------------------


//Con estas funciones le asocio un numero a el par de filas y columnas siendo el primer elemento de la primera fila/columna 0, en la segunda columna 1 y asi consecutivamente,
 la primera fila seria 0 hasta m-1, la segunda fila seria de m hasta 2(m-1) asi hasta la ultuma que seria de n*m hata n(m-1)

int to(nt i, int j) {
    m*i+j;
}

ii from(int x) {        //Esta te devuelve el pair del numero asociado de la fila y la columna respectivamente
    return {x/m, x%m};
}

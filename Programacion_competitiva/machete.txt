
-----------------------------/ Compilar /-----------------------------


Vamos a compilar con g++, escribo en la terminal

g++ "fiel.cpp"

luego 

./a.out

e ingreso los input que me hagan falta


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


int main () {

    
}

-----------------------------/ Funciones con flotantes /-----------------------------


https://www.programacionfacil.org/cursos/c++/capitulo-19-funciones-matematicas.html


-----------------------------/ Formulas /-----------------------------


Division techo para int a, b; [a/b]:    (a+b-1)/b
Array de sumas parciales a[n]:    sum[n] = sum[n-1]+a[n]     donde sum[0] = 0 
    para calcular la suma entre un a[l] y a[r] siendo l<r:   sum[r+1]-sum[l]


-----------------------------/ Tipos de datos y sus tamaños /-----------------------------


https://ccia.ugr.es/~jfv/ed1/c/cdrom/cap2/cap24.html


-----------------------------/ Tiempos y orden /-----------------------------

Tiempo aprox de una pc es 1s = 10^8 operaciones
Funcion de ordenacion de c++ es de o(n log(n))
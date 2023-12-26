#include <bits/stdc++.h>
using namespace std; //esto es para no tenes que escribir std::string

int main() {
    int w;
    cin >> w;   //leo el standar input y guarda en w

    //w es menor igual a 2
    if (w <= 2) {
        cout << "NO" << endl;
    }
    //w es par
    if (w % 2 == 0 && 2 < w) {
        cout << "YES" << endl; // imprimo en el output YES y es el fin de la linea 
    }

    //w es impar
    if (w % 2 == 1 && 2 < w) {
        cout << "NO" << endl; //imprimo en el output NO y es el fin de la linea
    }
}

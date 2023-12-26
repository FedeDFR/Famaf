#include <bits/stdc++.h>
using namespace std;

int main() {
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
            cout << str << endl;
        }

    }
}

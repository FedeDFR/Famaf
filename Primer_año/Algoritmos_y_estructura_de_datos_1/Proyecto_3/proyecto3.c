#include <stdio.h>
#include <stdbool.h>

int ejercicio1 () {

    int x, y, z;

    printf ("Ingrese valor para x\n");
    scanf ("%d", &x);

    printf ("Ingrese valor para y\n");
    scanf ("%d", &y);

    printf ("Ingrese valor para z\n");
    scanf ("%d", &z);

    printf ("1) x+y+1=%d\n",x+y+1);

    printf ("2) z*z+y*45-15*x= %d\n",z*z+y*45-15*x);

    printf ("3) y-2==(x*3+1) % 5= %d\n",y-2==(x*3+1)%5);

    printf ("4) y/2*x= %d\n",y/2*x);

    printf ("5) y<x*z= %d\n",y<x*z);
    return 0;

    /*
    x=7, y=3, z=5
    1) x+y+1=11
    2) z*z+y*45-15*x= 55
    3) y-2==(x*3+1) % 5= 0
    4) y/2*x= 7
    5) y<x*z= 1

    x=1, y=10, z=8
    1) x+y+1=12
    2) z*z+y*45-15*x= 499
    3) y-2==(x*3+1) % 5= 0
    4) y/2*x= 5
    5) y<x*z= 0 */

}

int ejercicio2 () {

    int x, y, z, a, c, e; 
    int b, w;

    printf ("Ingrese el valor de x \n");
    scanf ("%d", &x);

    printf ("Ingrese el valor de y \n");
    scanf ("%d", &y);

    printf ("Ingrese el valor para z \n");
    scanf ("%d", &z);

    printf ("Ingrese el valor para b \n");
    scanf ("%d", &b);

    printf ("Ingrese el valor para w \n");
    scanf ("%d", &w);

    a = (x % 4 == 0);

    b = ((x+y == 0) && (y-x == (-1)*z));

    c = (!b && w);

    if (a!=0) {
        printf ("La expresion (x % 4 == 0) es True \n");
    }
    else {
        printf ("La expresion (x % 4 == 0) es False \n");
    }

    if (b!=0) {
        printf ("La expresion  (x+y == 0 && y-x == (-1)*z) es True \n");
    }
    else {
        printf ("la expresion  (x+y == 0 && y-x == (-1)*z) es False \n");
    }

    if (c!=0) {
        printf ("La expresion (not b && w) es True \n");
    }
    else {
        printf ("La expresion (not b && w) es False \n");
    }
    return 0;   

    /* x=4, y=-4, z=8, b=True, w=False */

}

int ejercicio3a () {

    int a;

    printf ("Ingrese valor para x \n");
    scanf ("%d", &a);

    a=5;

    printf ("El valor de a es %d", a);
    return 0;

    /* σ0=2, σ=5
       σ0=5, σ=5
       σ0=123, σ=5 */
}

int ejercicio3b () {
    
    int x, y;

    printf ("Ingrese valor para x \n");
    scanf ("%d", &x);

    printf ("Ingrese valor para y\n");
    scanf ("%d", &y);

    printf ("El nuevo valor de x es %d \n", x+y);

    printf ("El nuevo valor de y es %d \n", y+y);
    return 0; 

    /* σ0=(x=2, y=2) σ=(x=4, y=4)
       σ0=(x=3, y=4) σ=(x=7, y=8)
       σ0=(x=5 y=2) σ=(x=7, y=4) */
}

int ejercicio3c () {

    int x, y;

    printf ("Ingrese valor para x \n");
    scanf ("%d", &x);

    printf ("Ingrese valor para y\n");
    scanf ("%d", &y);

    printf ("El nuevo valor de y es %d \n", y=y+y);

    printf ("El nuevo valor de x es %d \n", x+y);
    return 0; 

    /*σ0=(x=2, y=2) σ=(x=4, y=4)
      σ0=(x=4, y=7) σ=(x=18, y=14)
      σ0=(x=6, y=5) σ=(x=16, y=10)*/
      

}

int ejercicio4a () {

    int x, y;

    printf ("Ingrese un valor para x\n");
    scanf ("%d", &x);
    
    printf ("Ingrese un valor para y\n");
    scanf ("%d", &y);

    if (x >= y) {
       printf ("El nuevo valor de x es %d \n", x=0);

       printf ("El nuevo valor de y es %d \n", y); 
    } else (x < y); {
        printf ("El nuevo valor de x es %d \n", x=2);

        printf ("El nuevo valor de y es %d \n", y);
    }
    return 0;
}

int ejercicio4b () {

    int x, y, z, m;

    printf ("Ingrese un valor para x \n");
    scanf ("%d", &x);

    printf ("Ingrese un valor para y \n");
    scanf ("%d", &y);

    printf ("Ingrese el valor para z \n");
    scanf ("%d", &z);

    printf ("Ingrese el valor para m \n");
    scanf ("%d", &m);

    if (x < y) {
        m=x;
    } else {
        m=y;
    }

    printf("El valor de x en σ1 es %d \n", x);
    printf("El valor de y en σ1 es %d \n", y);
    printf("El valor de z en σ1 es %d \n", z);
    printf("El valor de m en σ1 es %d \n", m);

    if (m < z) {}
    else {
        m = z;
    }

    printf("El valor final de x es %d \n", x);
    printf("El valor final de y es %d \n", y);
    printf("El valor final de z es %d \n", z);
    printf("El valor final de m es %d \n", m);

    return 0;
}

int ejercicio5a1 () {

    int i;

    printf ("Ingrese un valor para i \n");
    scanf ("%d", &i);

    while (i <=0) {
    printf("No se puede usar numeros negativos ni 0, porfavor seleccione otro valor para i:\n");
    scanf("%d" , &i);
    }

    while (!(i == 0)) {
        i=i-1;
    }

    printf("El valor de i es %d \n", i);
    
    return 0;
}

int ejercicio5a2 () {

    int i;

    printf ("Ingrese un valor para i \n");
    scanf ("%d", &i);

    while (!(i == 0)) {
        i = 0;
    }

    printf ("El valor de i es %d \n", i);

    return 0;
}

int ejercicio5b1 () {

    int x, y, i;

    printf("Ingrese valor para x\n");
    scanf("%d", &x);

    printf("Ingrese valor para y\n");
    scanf("%d", &y);

    printf("Ingrese valor para i\n");
    scanf("%d", &i);

    while (x >= y) {
        x = x - y;
        i = i + 1;
    }

    printf("Los valores de x, y, i son:\n x = %d ; y = %d ; i = %d\n" , x , y , i);

    return 0;
}

int ejercicio5b2 () {

    int x, i;
    bool res;

    printf ("Ingrese valor para x\n");
    scanf ("%d", &x);

    printf ("Ingrese valor para i\n");
    scanf ("%d", &i);

    i = 2;
    res = 1;

    while (i < x && res) {
        res = res && !(x % i == 0);
        i = i + 1;
    }

    printf ("El valor de x es %d \n", x);

    printf ("El valor de i es %d \n", i);

    if (res == 1) {
        printf("El valor de res es True \n");
    } else {
        printf("El valor de res es False \n");
    }
    return 0;
} 

int pedirEntero () {

    int x;

    printf ("Ingrese un valor \n");
    scanf ("%d", &x);

    return x;     
}

void imprimeEntero (int x) {

    printf ("El valor de x que eligio es %d", x);

    
}

int pedirBooleano () {

    int x;

    printf ("Ingrese valor para x 1=Verdadero, 0=Falso \n");
    scanf ("%d", &x);

    return x;
}

void imprimeBooleano (bool x) {

        if (x=1) {
            printf ("El valor de x es Verdadero \n");
        } else {
            printf ("El valor de x es Falso \n");
        }
}

int ejercicio6a () {

    imprimeEntero (pedirEntero ());

}   

int ejercicio6b () {

    imprimeBooleano (pedirBooleano ());
   
}

int ejercicio6c () {

    int x, y, z, m;

    x = pedirEntero ();
    y = pedirEntero ();
    z = pedirEntero ();
    m = pedirEntero ();

     if (x < y) {
        m=x;
    } else {
        m=y;
    }

    if (m < z) {}
    else {
        m = z;
    }

    printf("El minimo entre x, y, z, m es %d\n", m);

}

void imprimeHola () {

    printf ("Hola \n");

}

void imprimeChau () {

    printf ("Chau \n");

}

int ejercicio6d () {

    imprimeHola ();
    imprimeHola ();
    imprimeChau ();
    imprimeChau ();

} 



int main(void) {

    int a, b, c;

    printf ("Elija el ejercicio que desea \n");
    scanf ("%d", &a);

    if (a == 1) {
        ejercicio1 ();
    } else{}

    if (a == 2) {
        ejercicio2 ();
    } else {}

    if (a == 3) {
        printf ("Elija el inciso que desea a)=1, b)=2, c)=3 \n");
        scanf ("%d", &b);
        
        if (b == 1) {
            ejercicio3a ();
        } else {}

        if (b == 2) {
            ejercicio3b ();
        } else {}

        if (b == 3) {
            ejercicio3c ();
        } else {}
    } else {}

    if (a == 4) {
        printf ("Elija el inciso que desea a)=1, b)=2, \n");
        scanf ("%d", &b);
        
        if (b == 1) {
            ejercicio4a ();
        } else {}

        if (b == 2) {
            ejercicio4b ();
        } else {}
    } else {}

    if (a == 5) {
        printf ("Elija el inciso que desea a)=1, b)=2, \n");
        scanf ("%d", &b);

        if (b == 1) {          
            printf ("Elija el punto que desea \n");
            scanf ("%d", &c);
        
            if (c == 1) {
                ejercicio5a1 ();
            } else {}

            if (c == 2) {
                ejercicio5a2 ();
            } else {}
        } else {}

        if (b == 2) {
            printf("Elija el punto que desea \n");
            scanf("%d", &c);

            if (c == 1) {
                ejercicio5b1();
            } else {}

            if (c == 2) {
                ejercicio5b2();
            } else {}
        } else {}
    } else {}

    if (a == 6) {
        printf ("Elija el inciso que desea a)=1, b)=2, c)=3, d)=4 \n");
        scanf ("%d", &b);
        
        if (b == 1) {
            ejercicio6a ();
        } else {}

        if (b == 2) {
            ejercicio6b ();            
        } else {}

        if (b == 3) {
            ejercicio6c ();            
        } else {}

        if (b == 4) {
            ejercicio6d ();
        } else {}
    }    
    
    return 0;
}
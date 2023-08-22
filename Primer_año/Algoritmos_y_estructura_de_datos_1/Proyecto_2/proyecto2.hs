
--Ejercicio 1)

--a)

data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Eq,Show)

--b)

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"


--c)

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Ord,Eq,Show)

--d)

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

--Ejercicio 3)

--a)

minimoElemento :: Ord a => [a] -> a
minimoElemento [a] = a
minimoElemento (x:xs) = x `min` (minimoElemento xs)

--b)

minimoElemento' :: (Bounded a , Ord a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = x `min` (minimoElemento' xs)

{--c) Se uso la funcion minimoElemento con la lista [Fa, La, Sol, Re, Fa] y devolvio Re--}


--Ejercicio 4)

--a)

type Ingreso = Int
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar  deriving (Eq,Show)
data Area = Administrativa | Ensenanza | Economica | Postgrado deriving (Eq,Show)
data Persona = Decano | Docente Cargo | NoDocente Area | Estudiante Carrera Ingreso deriving (Eq,Show)


--b)el tipo de docente es Cargo


--c)

cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc [] c = 0
cuantos_doc (x:xs) c    | x == Docente c = 1 + cuantos_doc xs c
                        | otherwise = cuantos_doc xs c


--d)

cuantos_doc' :: [Persona] -> Cargo -> Int
cuantos_doc' (x:xs) c = length( filter (Docente c == ) (x:xs))
                         
  
                       
--Ejercicio 5)

--a)                      
                         
data Alteracion = Bemol | Sostenido | Natural deriving (Eq,Ord)
data NotaMusical = Nota NotaBasica Alteracion  deriving (Eq,Ord)    

sonido :: NotaBasica -> Int
sonido Do = 1
sonido Re = 3
sonido Mi = 5
sonido Fa = 6
sonido Sol = 8
sonido La = 10
sonido Si = 12              
 
                        
--b)

sonidoCromatico :: NotaMusical -> Int  
sonidoCromatico (Nota a b)  | b==Bemol = (sonido a)-1
                            | b==Sostenido = (sonido a)+1
                            | b==Natural = (sonido a)  
  
                       
--c)
                         
--d)


--Ejercicio 6)    

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x 


--Ejercicio 7)

data Cola = VaciaC | Encolada Persona Cola deriving (Show)              
  
                   
--a)

atender :: Cola -> Maybe Cola                          
atender VaciaC = Nothing
atender (Encolada a b) = Just b


--b)                
                         
encolar :: Persona -> Cola -> Cola                          
encolar a VaciaC = Encolada a VaciaC
encolar a (Encolada b c) = Encolada b (encolar a c)


--c)

busca :: Cola -> Cargo -> Maybe Persona
busca VaciaC c = Nothing
busca (Encolada a b) c | a == Docente c =  Just a
                       | a /=Docente c = busca b c                              
 
                         
--Ejercicio 8)                        


--a)

data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b ) deriving (Show,Eq)      

type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String    


--b)

--b)1)

la_long :: ListaAsoc a b -> Int
la_long Vacia =  0
la_long (Nodo a b c) = 1 + la_long c


--b)2)

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia Vacia = Vacia          
la_concat Vacia (Nodo a b c) = (Nodo a b c)
la_concat (Nodo a b c) Vacia = (Nodo a b c)
la_concat (Nodo a b c) (Nodo d e f) = (Nodo a b (la_concat c (Nodo d e f)))


--b)3)

la_agregar :: ListaAsoc a b -> a -> b -> ListaAsoc a b              
la_agregar Vacia a b = Nodo a b Vacia        
la_agregar (Nodo a b c) d e = Nodo d e (Nodo a b c)              


--b)4)

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b c) = (a,b) : la_pares c


--b)5)

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia a = Nothing
la_busca (Nodo d b c) a | d==a = Just b
                        | d/=a = la_busca c a
  
                     
--b)6)

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar a Vacia = Vacia
la_borrar a (Nodo b c d) | a==b = la_borrar a d
                         | a/=b = Nodo b c (la_borrar a d)

                       
--Ejercicio 9)

data Arbol a = Hoja | Rama ( Arbol a ) a ( Arbol a ) deriving (Show,Ord,Eq)

type Prefijos = Arbol String  
can , cana , canario , canas , cant , cantar , canto :: Prefijos

can = Rama cana "can" cant
cana = Rama canario "a" canas
canario = Rama Hoja "rio" Hoja
canas = Rama Hoja "s" Hoja
cant = Rama cantar "t" canto
cantar = Rama Hoja "ar" Hoja
canto = Rama Hoja "o" Hoja                                                  
 
                        
--a)

a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama b a c) = 1 + (a_long b) + (a_long c)  


--b)

a_hojas :: Arbol a -> Int
a_hojas Hoja = 1
a_hojas (Rama a b c) = a_hojas a + a_hojas c


--c)

a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama a b c) = Rama (a_inc a) (b+1) (a_inc c)


--d)

a_map :: (a -> b) -> Arbol a -> Arbol b
a_map x Hoja = Hoja
a_map  x (Rama a b c) = Rama (a_map x a) (x b) (a_map  x c)

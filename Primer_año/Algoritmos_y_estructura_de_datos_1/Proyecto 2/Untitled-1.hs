data Carrera = Matematica | Fisica | Computacion | Astronomia deriving Eq

titulo :: Carrera -> String
titulo Matematica = "Licienciatura de Matematica"
titulo Fisica = "Licienciatura de Fisica"
titulo Computacion = "Licieciasatura en ciencias de Computacion"
titulo Astronomia = "Licienciatura en Astronomia"

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving Show


cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

instance Eq NotaBasica where
    n1 == n2 = cifradoAmericano n1 == cifradoAmericano n2

instance Ord NotaBasica where
    n1 <= n2 = cifradoAmericano n1 <= cifradoAmericano n2


sumatoria :: [Int] -> Int
sumatoria [ ] = 0
sumatoria (x:xs) = x + sumatoria xs

minimoElemento :: Num a => [a] -> a 
minimoElemento [a] = a
minimoElemento (x:xs) = x `min` (minimoElemento xs)

minimoElemento' :: (Bounded a , Ord a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = x `min` (minimoElemento' xs)


type Ingreso = Int

data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar
data Area = Administrativa | Ensenanza | Economica | Postgrado

data Persona = Decano | Docente Cargo | NoDocente Area | Estudiante Carrera Ingreso

cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc [] = 0
cuantos_doc (a:xs) c | (a == Docente c)  = 1 + cuantos_doc xs c
                     | otherwise = cuantos_doc xs c

cuantos_doc' :: [Persona] -> Cargo -> Int
cuantos_doc' (x:xs) c = length ( filter (Docente c == ) (x:xs)) {-- length es cardinal --}


data Alteracion = Bemol | Sostenido | Natural
data NotaMusical = Nota NotaBasica Alteracion

sonido :: NotaBasica -> Int
sonido Do = 1
sonido Re = 3
sonido Mi = 5
sonido Fa = 6
sonido Sol = 8
sonido La = 10
sonido Si = 12

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota a b) | (b == Sostenido) = (sonido a) + 1
                           | (b == Bemol) = (sonido a) - 1
                           | (b == Natural) = (sonido a)

instance Eq NotaMusical where
    n1 == n2 = sonidoCromatico n1 == sonidoCromatico n2

instance Ord NotaMusical where
    n1 <= n2 = sonidoCromatico n1 <= sonidoCromatico n2


dividir :: Int -> Int -> Int
dividir x y = x `div` y

data Maybe a = Nothing | Just a

dividir :: Int -> Int -> Maybe Int
dividir x 0 = Nothing
dividir x y = Just ( x `div` y )

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x


data Cola = VaciaC | Encolada Persona Cola

atender :: Cola -> Maybe
atender VaciaC = Nothing
atender (Encolada a b) = Just b

encolar :: Persona -> Cola -> Cola
encolar a VaciaC = Encolada a VaciaC
encolar a (Encolada b c) = Encolada b (encolar a c)

buscar :: Cola -> Cargo -> Maybe Persona
buscar VaciaC a = Nothing
buscar (Encolada b c) a | (b == Persona c) = Just b
                        | otherwise = buscar c a


data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b ) deriving (Eq, Ord, Show)

type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String
type GuiaTel = ListaAsoc String Int

la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long Nodo a b c = 1 + la_long c

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia Vacia = Vacia
la_concat (Nodo a b c) Vacia = (Nodo a b c)
la_concat Vacia (Nodo a b c) = (Nodo a b c)
la_concat (Nodo a b c) (Nodo d e f) = (Nodo a b (la_concat c (Nodo d e f)))

la_agregar :: ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a b = Nodo a b Vacia
la_agregar (Nodo c d e) a b = (Nodo c d (la_agregar e a b))

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b c) = (a,b) : la_pares c

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia a = Nothing
la_busca (Nodo b c d) a | (b == a) =Just b
                        | otherwise la_busca d a

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar a Vacia = Vacia
la_borrar a (Nodo z c d) | (a == z) = la_borrar a d
                        | otherwise = Nodo z c (la_borrar a d)



----Parciales Viejos n1


data Palo = Treboles | Corazones | Picas | Diamantes

mismo_palo :: Palo -> Palo -> Bool
mismo_palo Treboles Treboles = True
mismo_palo Corazones Corazones = True
mismo_palo Picas Picas = True
mismo_palo Diamantes Diamantes = True
mismo_palo _ _ = False

type Numero = Int
data Naipe = Numerada Numero Palo | Rey Palo | Reyna Palo | Jota Palo | As Palo


valor_naipe :: Naipe -> Int
valor_naipe Jota a = 11
valor_naipe Reyna a = 12
valor_naipe Rey a = 13
valor_naipe As a = 14

instance Eq Naipe where
    n1 == n2 = valor_naipe n1 == valor_naipe n2

instance Ord Naipe where
    n1 <= n2 = valor_naipe n1 <= valor_naipe n2


solo_numeradas :: [Naipe] -> Palo -> [Numero]
solo_numeradas [] a = []
solo_numeradas ((Numerada b c):xs) a | (mismo_palo a c) = b:(solo_numeradas xs a)
                                     | otherwise = solo_numeradas xs a
solo_numeradas ((Rey a):xs) a = solo_numeradas xs a
solo_numeradas ((Reyna a):xs) a = solo_numeradas xs a 
solo_numeradas ((Jota a):xs) a = solo_numeradas xs a
solo_numeradas ((As a):xs) a = solo_numeradas xs a


la_menor :: (Eq b, Ord b) => ListaAsoc a b -> b -> ListaAsoc a b
la_menor Vacia d = Vacia
la_menor (Nodo a b c) d | (b < d) = Nodo a b (la_menor c d)
                        | otherwise = la_menor c d


----Parciales viejos n2

data Color = Rojo | Verde | Azul | Negro | Blaco

mismoColor :: Color -> Color -> Bool
mismoColor Rojo Rojo = True
mismoColor Verde Verde = True
mismoColor Azul Azul = True
mismoColor Negro Negro = True
mismoColor Blaco Blaco = True
mismoColor _ _ = False

type Nombre = String
type Costo = Int
type Daño = Int
type Resistencia = Int

data CartaMagic = CartaDeTerreno Nombre Color | CartaDeCriatura Nombre Costo Daño Resistencia

cuantoDaño :: CartaMagic -> Int
cuantoDaño CartaDeTerreno a b = 0
cuantoDaño CartaDeCriatura a b c d = c

instance Eq CartaMagic where
    n1 == n2 = cuantoDaño n1 == cuantoDaño n2

instance Ord CartaMagic where
    n1 <= n2 = cuantoDaño n1 <= cuantoDaño n2

soloTerreno :: [CartaMagic] -> Color -> [Nombre]
soloTerreno [] e = []
soloTerreno ((CartaDeCriatura a b c d):xs) e = soloTerreno xs e
soloTerreno ((CartaDeTerreno a b):xs) e | (e == b) = a:(soloTerreno xs e)
                                        | otherwise = soloTerreno xs e    

la_mismo_valor :: Eq b => ListaAsoc a b -> b -> ListaAsoc a b
la_mismo_valor Vacia a = Vacia
la_mismo_valor (Nodo b c d) a | (c == a) = Nodo b c (la_mismo_valor d) a
                              | otherwise = la_mismo_valor d a


----Parciales viejos n2

data Color = Rojo | Negro | Azul

mismo_color :: Color -> Color -> Bool 
mismo_color Rojo Rojo = True 
mismo_color Negro Negro = True 
mismo_color Azul Azul = True 
mismo_color _ _ = False 

data Tipo = Auto | Moto | Camion
data Vehiculo = Cons Tipo Color

pintar_auto :: Vehiculo -> Color -> Maybe Vehiculo
pintar_auto (Cons a b) c | (a == Auto) = Just Cons a c
                         | Otherwise = Nothing 

solo_de_color :: Color -> [Vehiculo] -> [Tipo]
solo_de_color c [] = []
solo_de_color c ((Cons a b):cs) | (c == b) = a:(solo_de_color c cs)
                                | otherwise = solo_de_color c cs

type Precio = Int 
type Nombre = String
type Cantidad = Int 
data Producto = Item Nombre Precio
data Compra = AgregarProd Producto Cantidad Compra | Nada 

costo :: Compra -> Precio
costo Nada = 0
costo (AgregarProd (Item a b) c d) = (b*c) + costo d


----Parciales viejos n3

type Titulo = String 
type Artista = String 
type Duracion = Int 
data Genero = Rock | Blues | Pop | Jazz 
data Cancion = Tema Titulo Artista Genero Duracion | Publicidad Duracion 

mismo_genero :: Genero -> Genero -> Bool 
mismo_genero Rock Rock = True 
mismo_genero Blues Blues = True 
mismo_genero Pop Pop = True 
mismo_genero Jazz Jazz = True 
mismo_genero _ _ = False 

duracion_de :: Cancion -> Duracion
duracion_de (Publicidad a) = a
duracion_de (Tema a b c d) = d

instance Eq Cancion where
    c1 == c2 = duracion_de c1 == duracion_de c2

instance Ord Cancion where
    c1 <= c2 = duracion_de c1 <= duracion_de c2

solo_genero :: [Cancion] -> Genero -> [Titulo]
solo_genero [] x = [] 
solo_genero ((Publicidad a):xs) x = solo_genero xs x
solo_genero ((Tema a b c d):xs) x | (mismo_genero c x) = a:(solo_genero xs x)
                                  | otherwise = solo_genero xs x

la_suma_mayores :: (Eq b, Ord b) => ListaAsoc a b -> b -> b
la_suma_mayores Vacia x = 0
la_suma_mayores (Nodo a b c) x | (b > x) = b + la_suma_mayores c x
                               | otherwise = la_suma_mayores c x


----Parciales viejos n4

type Titulos = Int 
--ya esta definido Nombre--

data Categoria = Simples | Dobles 
data Zona = Arco | Defensa | Mediocampo | Delantero 
data Deportista = Futbolista Nombre Zona Titulos | Tenista Nombre Categoria Titulos | Velocista Nombre Titulos

misma_zona :: Zona -> Zona -> Bool 
misma_zona Arco Arco = True 
misma_zona Defensa Defensa = True 
misma_zona Mediocampo Mediocampo = True 
misma_zona Delantero Delantero = True 
misma_zona _ _ = False

puntaje_titulos :: Deportista -> Int 
puntaje_titulos (Futbolista a b c) = 2*c 
puntaje_titulos (Tenista a b c) = c 
puntaje_titulos (Velocista a b) = 3*b

instance Eq Deportista where
    d1 == d2 = puntaje_titulos d1 == puntaje_titulos d2 

instance Ord Deportista where
    d1 <= d2 = puntaje_titulos d1 <= puntaje_titulos d2

futbolista_zona :: [Deportista] -> Zona -> [Nombre]
futbolista_zona [] z = []
futbolista_zona ((Futbolista a b c):xs) z | (misma_zona b z) = a:(futbolista_zona xs z)
                                          | otherwise = futbolista_zona xs z
futbolista_zona ((Tenista a b c):xs) z = futbolista_zona xs z
futbolista_zona ((Velocista a b):xs) z = futbolista_zona xs z

----futbolista_zona [(Futbolista "Leo" Delantero 12), (Tenista "Roger" Simple 31), (Futbolista "Sergio" Defensa 4)] Delantero 

----[("Leo")]

la_adicionar :: Num b => ListaAsoc a b -> b -> ListaAsoc a b
la_adicionar Vacia z = Vacia 
la_adicionar (Nodo a b c) z = Nodo a (z + b) (la_adicionar c) 

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving Show

dar_subarbol :: a -> Arbol a -> Arbol a
dar_subarbol e Hoja = Hoja
dar_subarbol e (Rama l c r) | e == c = (Rama l e r)
                            | otherwise = case (dar_subarbol e l) of
                            (Rama l e r) -> (Rama l e r)
                            Hoja -> (dar_subarbol e r)
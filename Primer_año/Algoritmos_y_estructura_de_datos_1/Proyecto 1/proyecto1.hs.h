--Ejercicio 1)

--a)

esCero :: Int -> Bool
esCero a = a==0 


--b)

esPositivo :: Int -> Bool
esPositivo a = a>0 


--c)

esVocal :: Char -> Bool
esVocal a = a=='a' || a=='o' || a=='e' || a=='i' ||a=='u'


--Ejercicio 2)

--a)

paratodo :: [Bool]-> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs


--b)

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs


--c)

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs


--d)

factorial :: Int -> Int
factorial 0 = 1
factorial a = a * factorial (a-1)


--e)

promedio :: [Int] -> Int
promedio (x:xs) = div (sumatoria (x:xs)) (length(x:xs))


--Ejercicio 3)

pertenece :: Int -> [Int] -> Bool
pertenece a [] = False
pertenece a (x:xs) = a==x || (pertenece a xs)


--Ejercicio 4)

--a)

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t = t x && paratodo' xs t


--b)

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False
existe' (x:xs) t = t x || existe' xs t


--c)

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] t = 0 
sumatoria' (x:xs) t = t x + sumatoria' xs t


--d)

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 1 
productoria' (x:xs) t = t x * productoria' xs t


--Ejercicio 5)

--a)

paratodo'' :: [a] -> (a -> Bool) -> Bool
paratodo'' (x:xs) t = paratodo' (x:xs) t 


--Ejercicio 6)

--a)

todosPares :: [Int] -> Bool
todosPares x = (paratodo' x even) 


--b)

multiplo :: Int -> Int -> Bool 
multiplo b a = mod a b == 0

hayMultiplo :: Int -> [Int] -> Bool 
hayMultiplo b (x:xs) = existe' (x:xs) (multiplo b)


--c)

sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria' ([1..x]) (^2)


--d)

factorial' :: Int -> Int
factorial' x = productoria' ([1..x]) (*1)


--e)

solopares :: [Int] -> [Int]
solopares [] = []
solopares (x:xs) | (mod x 2 == 0) = x:(solopares xs)
                 | (mod x 2 /= 0) = (solopares xs)                


multiplicaPares :: [Int] -> Int
multiplicaPares [a] = productoria' (solopares[a]) (+0)


--Ejercicio 7)

{--¿Que hacen estas funciones (map y filter)?

 La funcion map se encarga de aplicar una funcion "f" a cada elemento de una lista

ej: map f [x1, x2, ..., xn] == [f x1, f x2, ..., f xn]
    map f [x1, x2, ...] == [f x1, f x2, ...]

 Y la funcion filter se encarga de modificar la lista cumpliendo los requisitos de la funcion "f"

ej: filter odd [1, 2, 3]   (odd=f)
    [1,3]
   
   
   ¿A que equivale la expresi ́on map succ [1, -4, 6, 2, -8], donde succ n = n+1?:
   
   [2,-3,7,3,-7]
   
   ¿Y la expresi ́on filter esPositivo [1, -4, 6, 2, -8]?
   
   [1,6,2]
   
--}


--Ejercicio 8)

--a)

duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = (x*2):(duplica xs)


--b)

duplica' :: [Int] -> [Int]
duplica' [] = []
duplica' x = map(*2) x


--Ejercicio 9)

--a)

solopares2 :: [Int] -> [Int]
solopares2 [] = []
solopares2 (x:xs) | (mod x 2 == 0) = x:(solopares xs)
                  | (mod x 2 /= 0) = (solopares xs)
     
            
--b)

solopares2' :: [Int] -> [Int]
solopares2' [] = []
solopares2' x = filter even x


--Ejercicio 10)

--a)

primIgualesA ::  (Eq a) => a -> [a] -> [a]
primIgualesA a (x:xs) | (x==a) = x:(primIgualesA a xs)
                      | otherwise = []
      
               
--b)

primIgualesA' ::  (Eq a) => a -> [a] -> [a]
primIgualesA' a x = takeWhile (==a) x


--Ejercicio 11)

--a)

primIguales :: ( Eq a) => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x:y:xs) | (x==y) = x: primIguales (y:xs)
                     | (x/=y) = x:[]
    
                 
--b)

primIguales' :: ( Eq a) => [a] -> [a]
primIguales' [] = []
primIguales' [x] = [x]
primIguales' (x:y:xs) | (x==y) = takeWhile (==x) (x:y:xs)
                      | otherwise = (x:[])
         
                     
--Ejercicio 12)

cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op z [] t = z
cuantGen op z (x:xs) t = (t x) `op` (cuantGen op z xs t)                
                   
paratodo2 xs t =  cuantGen (&&) True xs t

existe2 xs t =  cuantGen (||) False xs t  
                   
sumatoria2 xs t =  cuantGen (+) 0 xs t

productoria2 xs t =  cuantGen (*) 1 xs t


--Ejercicio 13)


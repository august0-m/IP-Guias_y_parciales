{-ej 1.1-}
longitud :: [a] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud (xs)
{-ej 1.2-}
ultimo:: (Eq t) => [t] -> t
ultimo [x] = (x)
ultimo (x:xs) = ultimo xs
{-ej 1.3-}
principio :: [t] -> [t]
principio [x] = [x]
principio (x:xs) = (x:xs)
{-ej 1.4-}
reverso :: [t] -> [t]
reverso [] = []
reverso [x] = [x]
reverso (x:xs) = reverso xs ++ [x]
{-ej 2.1-}
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece x (y:ys) | x==y = True
                   |otherwise = (pertenece x ys)
{-ej 2.2-}
todosIguales :: (Eq t) => [t] -> Bool
todosIguales  [x] = True
todosIguales (x:xs) = x == head xs && todosIguales xs 
{-ej 2.3-}
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:y:xs) | x == y = False
                        | otherwise = todosDistintos (x:xs) && todosDistintos (y:xs)
{-ej 2.4-}
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [_] = False
hayRepetidos [] = False 
hayRepetidos (x:xs) = hayRepAux x xs || hayRepetidos xs
hayRepAux :: (Eq t) => t -> [t] -> Bool
hayRepAux y (x:xs) | y == x = True
                   | otherwise = hayRepAux y xs
{-ej 2.5-}
quitar :: (Eq t) => t -> [t] ->[t]
quitar a (x:xs) | x==a = xs
                |otherwise = x : quitar a xs
{-ej 2.6-}
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos a (x:xs) | x==a = quitarTodos a xs
                     | otherwise = x : quitarTodos a xs
{-ej 2.7-} {--PREGUNTARLE A seba
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (x:y:xs) |chequearRepetidos (x:y:xs) == False = x:eliminarRepetidos (y:xs)
                           |otherwise = eliminarRepetidos (y:xs)
chequearRepetidos :: (Eq t) => [t] -> Bool
chequearRepetidos [] = False
chequearRepetidos [x] = True
chequearRepetidos (x:y:xs)  | x /= y = chequearRepetidos (x:xs)
                            | otherwise =  True
--}
eliminarRepetidosAux :: (Eq t) => [t] -> [t]
eliminarRepetidosAux [] = []
eliminarRepetidosAux (x:xs) = x :eliminarRepetidosAux (quitarTodos x xs) 
{-ej 2.8-} 
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [x] [y] = x==y
mismosElementos _ [] = False
mismosElementos [] _ = False
mismosElementos (x:xs) ys | pertenece x ys = mismosElementos xs (quitarTodos x ys)
                          | otherwise = False
{-ej 2.9-}
capicua :: (Eq t) => [t] -> Bool
capicua (x:xs) |(x:xs) == reverso (x:xs) = True
               | otherwise = False
{-ej 3.1-}
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria [0] = 0
sumatoria (x:xs) = x + sumatoria (xs)
{-ej 3.2-}
productoria :: [Integer] -> Integer
productoria [] =  1
productoria [0] = 0
productoria (x:xs) = x * productoria xs
{-ej 3.3-} 
maximo :: [Integer] -> Integer 
maximo [] = 0
maximo [x] = x
maximo (x:y:xs) | y <= x = maximo (x:xs)
                | otherwise = maximo (y:xs)
{-ej 3.4-}
sumarN :: Integer -> [Integer] -> [Integer]
sumarN  x [] = [x]
sumarN x [y] = [y + x]       
sumarN n (x:xs) = n+x: sumarN n (xs)
{-ej 3.5-}
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero [x] = [x]
sumarElPrimero (x:xs) = sumarN x xs
{-ej 3.6-}
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo [x] = [x]
sumarElUltimo (x:xs) = sumarN (ultimo (x:xs)) xs
{-ej 3.7-}
pares :: [Integer] -> [Integer]
pares [] = []
pares [x] | mod x 2 == 0 = [x]
pares (x:y:xs)  | esPar (x) = x: pares (y:xs)
                | otherwise = pares (y:xs)
esPar :: Integer -> Bool
esPar x | mod x 2 ==0 = True
        | otherwise = False
{-ej 3.8-} 
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ []       = []
multiplosDeN n [x]      | esMultiplo x n = [x]
                        | otherwise = []
multiplosDeN n (x:y:xs) | esMultiplo x n = x: multiplosDeN n (y:xs)
                        |otherwise = multiplosDeN n (y:xs) 
esMultiplo :: Integer -> Integer -> Bool
esMultiplo _ 0 = False
esMultiplo 0 _ = False
esMultiplo x y | mod x y == 0 = True
               |otherwise = False
{-ej 3.9-} {--
ordenar :: [Integer] -> [Integer]
ordernar [] = []
ordenar [x] = [x]
ordenar (x:y:xs) | x>= y = y: ordenar (x:xs)
                 | otherwise = x: ordenar (y:xs)  --}
ordenar :: [Integer] -> [Integer]
ordernar [] = []
ordenar [x] = [x]
ordenar (x:xs) = ordenar (quitar (maximo (x:xs)) (x:xs)) ++ [maximo(x:xs)]
{-ej 4-1-}
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [' '] = [' ']
sacarBlancosRepetidos [x]= [x]
sacarBlancosRepetidos (x:y:xs) | x==y && y==' ' = sacarBlancosRepetidos (y:xs)
                               |otherwise = x: sacarBlancosRepetidos (y:xs)
{-ej 4.2-}
contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras [_] = 0
contarPalabras (x:y:xs) =  contarEspacios(eliminarBlancoInFin(sacarBlancosRepetidos(x:y:xs)))
contarEspacios :: [Char] -> Integer
contarEspacios [] = 0  
contarEspacios [x] = 1
contarEspacios (x:y:xs) | x/=y && y==' ' = 1 + contarEspacios (y:xs)
                        |otherwise = contarEspacios (y:xs)
eliminarBlancoInFin :: [Char] -> [Char]
eliminarBlancoInFin [] = []
eliminarBlancoInFin [x] = [x]
eliminarBlancoInFin (x:y:xs) | x == ' ' && ultimo (x:y:xs) == ' ' = y: ((quitar(ultimo(x:y:xs)))xs)
                             | x/= ' ' = (x:y:xs)
                             |ultimo (x:y:xs) == ' ' = x:y:((quitar(ultimo(x:y:xs)))xs)
                             |otherwise = (x:y:xs)
{-ej4.3-}
palabras :: [Char] -> [[Char]]
palabras [] = []
palabras [x] = [[x]]
palabras (x:y:xs) = [ultimo (x:y:xs) :((eliminarBlancoInFin(sacarBlancosRepetidos(x:y:xs))))]

{-ej 4.5-}
{-Mal hecho
aplanar:: [Char] -> [Char]
aplanar [' '] = [' ']
aplanar [x]= [x]
aplanar (x:y:xs) |x== ' ' = (aplanar (eliminarBlancoInFin(y:xs)))
                 |otherwise= x: (aplanar (eliminarBlancoInFin(y:xs)))
                 -}
{-ej 4.6-}



cantidadDeApariciones :: String -> [String] -> Integer
cantidadDeApariciones _ [] = 0
cantidadDeApariciones x (y:xs) | x == y = 1 + cantidadDeApariciones x xs
                               | otherwise = cantidadDeApariciones x xs

personaConMasAmigos1 :: [String] -> [String] -> String
personaConMasAmigos1 [x] _ = x
personaConMasAmigos1 (p1:p2:ps) (x:y:xs) | cantidadDeApariciones p1 (x:y:xs) > cantidadDeApariciones p2 (x:y:xs) =
                                           personaConMasAmigos1 (p1:ps) (x:y:xs)
                                         | otherwise = personaConMasAmigos1 (p2:ps) (x:y:xs)

personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos w = personaConMasAmigos1 (personas w) (personasConRep w)
personasConRep :: [(String,String)] -> [String]
personasConRep [] = []
personasConRep [x] = fst x : snd x : []
personasConRep (x:y:xs) = fst x : snd x : personasConRep (y:xs)















personas :: [(String,String)] -> [String]
personas [] = []
personas (x:xs) = sacarTodosRep (personasConRep (x:xs))

sacarRepInicial :: String -> [String] -> [String]
sacarRepInicial _ [] = []
sacarRepInicial v (y:xs) | v == y = sacarRepInicial v xs
                         | otherwise = y : sacarRepInicial v xs

sacarRep :: [String] -> [String]
sacarRep (x:y:xs) = x : sacarRepInicial x (y:xs)


sacarTodosRep :: [String] -> [String]
sacarTodosRep [] = []
sacarTodosRep [x] = [x]
sacarTodosRep (x:xs) = x : sacarTodosRep (tail (sacarRep (x:xs)))



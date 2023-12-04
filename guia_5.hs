--GUÍA 5-- Recursión sobre listas  (EJ 5.1 MAL)
{-Ejercicio 1. Definir las siguientes funciones sobre listas:
1. longitud :: [t] -> Integer, que dada una lista devuelve su cantidad de elementos.-}
longitud ::[t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs
   -- |x /= [] = 1 + longitud xs -- no encontre como igualar a x con el vacio o con algo /= del vacío 
{-2. ultimo :: [t] -> t según la siguiente especificación:
problema ultimo (s: seq <T> ) : T {
requiere: { |s| > 0 }
asegura: { resultado = s[|s| − 1] }
-}
ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs
{-3. principio :: [t] -> [t] según la siguiente especificación:
problema principio (s: seq<T>) : seq<T> {
requiere: { |s| > 0 }
asegura: { resultado = subseq(s, 0, |s| − 1) }
-}
principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs
{-4. reverso :: [t] -> [t] según la siguiente especificación:
problema reverso (s: seq<T>) : seq<T> {
requiere: { True }
asegura: { resultado tiene los mismos elementos que s pero en orden inverso.}
-}
reverso :: [t] ->[t]
reverso [x]=[x]
reverso (x:xs) = ultimo (x:xs) : reverso (principio (x:xs)) 
{-Ejercicio 2. Definir las siguientes funciones sobre listas:
1. pertenece :: (Eq t) => t -> [t] -> Bool según la siguiente especificación:
problema pertenece (e: T, s: seq <T>) : B {
requiere: { True }
asegura: { resultado = true ↔ e ∈ s }
-}
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece p (x:xs)
   | p == x = True
   |otherwise = pertenece p xs
{-2. todosIguales :: (Eq t) => [t] -> Bool, que dada una lista devuelve verdadero sí y solamente sí todos
sus elementos son iguales.-}
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [_] = True  
todosIguales (x:y:xs)
   |x==y = todosIguales (y:xs)
   |otherwise = False
{-3. todosDistintos :: (Eq t) => [t] -> Bool según la siguiente especificación:
problema todosDistintos (s: seq<T>) : B {
requiere: { True }
asegura: { resultado = false ↔ existen dos posiciones distintas de s con igual valor }
-}
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [_] = True
todosDistintos (x:y:xs) 
   |pertenece x (y:xs) == True = False
   |otherwise = todosDistintos (y:xs)
{-4. hayRepetidos :: (Eq t) => [t] -> Bool según la siguiente especificación:
problema hayRepetidos (s: seq<T>) : B {
requiere: { True }
asegura: { resultado = true ↔ existen dos posiciones distintas de s con igual valor }
-}
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [_] = False
hayRepetidos (x:xs)
   |todosDistintos (x:xs) == True = False
   |todosDistintos (x:xs) == False = True
{-5. quitar :: (Eq t) => t -> [t] -> [t], que dados un entero x y una lista xs, elimina la primera aparición de x en
la lista xs (de haberla).
-}
quitar :: (Eq t) => t -> [t] -> [t]  --unas re vueltas y encima esta mal
quitar _ [] = []
quitar k [j] | k==j = []
quitar q (x:y:xs)
   |pertenece q (x:y:xs) == False = (x:y:xs)
   |q== ultimo (x:y:xs) = principio(x:y:xs)
   |q/= ultimo (x:y:xs) =quitar q (principio(x:y:xs))
quitar_2 :: (Eq t) => t -> [t] -> [t]
quitar_2 _ [] =[]
quitar_2 w (x :xs)
   |w == x = xs
   |otherwise = x :quitar_2 w xs
{-6. quitarTodos :: (Eq t ) => t -> [t] -> [t], que dados un entero x y una lista xs, elimina todas las apariciones
de x en la lista xs (de haberlas). Es decir:
problema quitarTodos (e: T, s: seq<T>) : seq<T> {
requiere: { True }
asegura: { resultado es igual a s pero sin el elemento e. }
-}
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos q (x:xs)
   |pertenece q (x:xs)= quitarTodos q (quitar_2 q (x:xs))
   |otherwise = (x:xs)
{-7. eliminarRepetidos :: (Eq t) => [t] -> [t] que deja en la lista una única aparición de cada elemento, eliminando
las repeticiones adicionales.-}
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] =[]
eliminarRepetidos (x:xs)
   |pertenece x (xs) = x :eliminarRepetidos (quitarTodos x xs)
   |otherwise = (x:xs)
{-8. mismosElementos :: (Eq t) => [t] -> [t] -> Bool, que dadas dos listas devuelve verdadero sí y solamente sí
ambas listas contienen los mismos elementos, sin tener en cuenta repeticiones, es decir:
problema mismosElementos (s: seq<T>, r: seq<T>) : B {
requiere: { True }
asegura: { resultado = true ↔ todo elemento de s pertenece r y viceversa}
-}
mismosElementos_aux :: (Eq t) => [t] -> [t] ->[t]
mismosElementos_aux [] _ = []
mismosElementos_aux (x:xs) (ys)
   |pertenece x (ys) = x : mismosElementos_aux xs (ys)
   |otherwise =   mismosElementos_aux xs (ys)
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos (x:xs) (y:ys)
   =(longitud(eliminarRepetidos(mismosElementos_aux (x:xs) (y:ys))) ) == longitud (eliminarRepetidos ((x:xs)++(y:ys)))
{-9. capicua :: (Eq t) => [t] -> Bool según la siguiente especificación:
problema capicua (s: seq<T>) : B {
requiere: { True }
asegura: { (resultado = true) ↔ (s = reverso(s)) }
}
Por ejemplo capicua [´a’,’c’, ’b’, ’b’, ’c’, ´a’] es true, capicua [´a’, ’c’, ’b’, ’d’, ´a’] es false.-}
capicua :: (Eq t) => [t] -> Bool
capicua x
   =x == reverso x
{-Ejercicio 3. Definir las siguientes funciones sobre listas de enteros:
1. sumatoria :: [Integer] -> Integer según la siguiente especificación:
problema sumatoria (s: seq<Z>) : Z {
requiere: { True }
asegura: { resultado = sumatoria, desde i=0m hasta ((longitud s) -1), de s[i]
-}
sumatoria ::[Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs)
   =x + sumatoria xs
{-2. productoria :: [Integer] -> Integer según la siguiente especificación:
problema productoria (s: seq<Z>) : Z {
requiere: { True }
asegura: { resultado = productoria,desde i=0, hasta ((longitud s) -1), de s[i]
-}
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs)
   = x* productoria xs
{-3. maximo :: [Integer] -> Integer según la siguiente especificación:
problema maximo (s: seq<Z>) : Z {
requiere: { |s| > 0 }
asegura: { resultado ∈ s ∧ todo elemento de s es menor o igual a resultado }
-}
maximo :: [Integer] -> Integer
maximo [] = 0
maximo (x:y:xs)
   |longitud(x:y:xs) ==2 && x>y = x
   |longitud(x:y:xs) ==2 && x<y = y
   |x>=y = maximo (x:xs)
   |otherwise = maximo(y:xs)
{-4. sumarN :: Integer -> [Integer] -> [Integer] según la siguiente especificación:
problema sumarN (n: Z, s: seq<Z>) : seq<Z> {
requiere: { True }
asegura: {|resultado| = |s| ∧ cada posici´on de resultado contiene el valor que hay en esa posici´on en s sumado
n }
}-}
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = [] --si le agrego el caso vacío, longitud del rta va a ser mayor a longitud de secuencia de entrada
sumarN n (x:xs) 
   =x+n :sumarN n xs
{-5. sumarElPrimero :: [Integer] -> [Integer] según la siguiente especificación:
problema sumarElPrimero (s: seq<Z>) : seq<Z> {
requiere: { |s| > 0 }
asegura: {resultado = sumarN(s[0], s)}
Por ejemplo sumarElPrimero [1,2,3] da [2,3,4]
-}
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs)
   = sumarN x (x:xs)
{-6. sumarElUltimo :: [Integer] -> [Integer] según la siguiente especificación:
problema sumarElUltimo (s: seq<Z>) : seq<Z> {
requiere: { |s| > 0 }
asegura: {resultado = sumarN(s[|s| − 1], s) 
Por ejemplo sumarElUltimo [1,2,3] da [4,5,6]
-}
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo (x:xs)
   =sumarN (ultimo(x:xs)) (x:xs)
{-7. pares :: [Integer] -> [Integer] según la siguiente especificación:
problema pares (s: seq<Z>) : seq<Z> {
requiere: { True }
asegura: {resultado sólo tiene los elementos pares de s en el orden dado, respetando las repeticiones}
Por ejemplo pares [1,2,3,5,8,2] da [2,8,2]
-}
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)
   | mod x 2 == 0 = x: pares xs
   |otherwise = pares xs
{-8. multiplosDeN :: Integer -> [Integer] -> [Integer] que dado un número n y una lista xs, devuelve una lista
con los elementos de xs múltiplos de n.-}
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs)
   |mod x n == 0 = x : multiplosDeN n xs
   |otherwise = multiplosDeN n xs
{-9. ordenar :: [Integer] -> [Integer] que ordena los elementos de la lista en forma creciente.-}--(q no hayan rep)
el_menor :: [Integer] -> Integer
el_menor [x] = x
el_menor (x:y:xs)
   |x<y = el_menor(x:xs)
   |x>y = el_menor(y:xs) 
ordenar :: [Integer] ->[Integer]
ordenar [] = []
ordenar [x] = [x]
ordenar (x:y:xs) 
   =el_menor(x:y:xs) : ordenar((quitar_2 (el_menor(x:y:xs)) (x:y:xs)))
{-Ejercicio 4. Definir las siguientes funciones sobre listas de caracteres, interpretando una palabra como una secuencia de
caracteres sin blancos:
1. sacarBlancosRepetidos :: [Char] -> [Char], que reemplaza cada subsecuencia de blancos contiguos de la primera
lista por un solo blanco en la lista resultado.-}
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [x]=[x]
sacarBlancosRepetidos (x:y:xs)
   |x==' ' && x==y = sacarBlancosRepetidos(x:xs)
   |otherwise = x : sacarBlancosRepetidos (y:xs)
{-2. contarPalabras :: [Char] -> Integer, que dada una lista de caracteres devuelve la cantidad de palabras que tiene.-}
sacar_blancos_inicio_y_fin :: [Char] -> [Char]
sacar_blancos_inicio_y_fin [] = []
sacar_blancos_inicio_y_fin (x:xs)
   |x==' ' = sacar_blancos_inicio_y_fin xs
   |x/=' ' && ultimo (x:xs) == ' ' = sacar_blancos_inicio_y_fin(quitar_2 (ultimo(x:xs)) (x:xs))
   |otherwise = (x:xs)
contarPalabras :: [Char] -> Integer
--contarPalabras [_] = 0
contarPalabras [] = 0
contarPalabras [_] = 0
contarPalabras [_,_] = 1
contarPalabras (x:y:z:xs)
   |x/=' ' && y ==' ' && z/=' ' = 1 + contarPalabras xs
   |otherwise = contarPalabras (y:z:xs)
  -- |x==' ' = contarPalabras(sacar_blancos_inicio_y_fin(sacarBlancosRepetidos(xs)))      --era un  re quilombo al pedo
  -- |otherwise =contarPalabras(sacar_blancos_inicio_y_fin(sacarBlancosRepetidos(xs)))
{-3. palabras :: [Char] -> [[Char]], que dada una lista arma una nueva lista con las palabras de la lista original.-}
dame_la_primera :: [Char] -> [Char]
dame_la_primera [] = []
dame_la_primera (x:xs)
   |x /=' ' = x :dame_la_primera(xs)
   |otherwise = []
saca_la_primera :: [Char] -> [Char]
saca_la_primera [] = []
saca_la_primera (x:xs)
   |x/=' ' = saca_la_primera xs
   |otherwise = x:xs

palabras :: [Char] -> [[Char]] 
palabras [] = []
--palabras [x] = [[x]]
palabras p
    =  [dame_la_primera p] ++ palabras(sacar_blancos_inicio_y_fin(saca_la_primera p ))
 --  |dame_la_primera p /= [] =  [dame_la_primera p] ++ palabras(sacar_blancos_inicio_y_fin(saca_la_primera p ))
 --  |dame_la_primera p == (sacar_blancos_inicio_y_fin(saca_la_primera p )) = [p]
 --  |otherwise = []

{-4. palabraMasLarga :: [Char] -> [Char], que dada una lista de caracteres devuelve su palabra más larga.-} 
analiza_cantidad :: [Char] -> Integer
analiza_cantidad [] = 0
analiza_cantidad (x:xs)
   |x /=' ' =1 +analiza_cantidad xs
   |x==' ' = 0
palabraMasLarga :: [Char] -> [Char]  --un toque larga queda la funcion
palabraMasLarga [] =[]
palabraMasLarga x
   |contarPalabras x ==1 = dame_la_primera(sacar_blancos_inicio_y_fin(x))
   |analiza_cantidad(sacar_blancos_inicio_y_fin(x)) >= analiza_cantidad(sacar_blancos_inicio_y_fin(saca_la_primera(x))) =palabraMasLarga(dame_la_primera x ++(saca_la_primera(sacar_blancos_inicio_y_fin(saca_la_primera(sacar_blancos_inicio_y_fin(x))))))
   |analiza_cantidad(sacar_blancos_inicio_y_fin(x))<= analiza_cantidad(sacar_blancos_inicio_y_fin(saca_la_primera(x))) = palabraMasLarga(saca_la_primera(sacar_blancos_inicio_y_fin(x)))
{-5. aplanar :: [[Char]] -> [Char], que a partir de una lista de palabras arma una lista de caracteres concatenándolas-}  -- yo quería que me lo devuelva ['a','s','i'] pero creo q no se puede
aux :: [Char] -> [Char]  --esto no hace -literalmente- nada
aux [] = []
aux (x:xs)
   |x /=' ' = [x] ++ aux xs
   |otherwise = [x]

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs)
   |xs/=[] =aux x ++ aplanar xs
   |otherwise = x

aplanar_v2 :: [[Char]] ->[Char]  --jaja q pelotudes xdios
aplanar_v2 [] = []
aplanar_v2 (x:xs)
   |xs/= [] = x++ aplanar_v2(xs)
   |otherwise = x
{-6. aplanarConBlancos :: [[Char]] -> [Char], que a partir de una lista de palabras, arma una lista de caracteres
concatenándolas e insertando un blanco entre cada palabra.-}
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos (x:xs)
   |xs/=[] =x ++ [' ']++aplanarConBlancos xs
   |otherwise = x
{-7. aplanarConNBlancos :: [[Char]] -> Integer -> [Char], que a partir de una lista de palabras y un entero n,
arma una lista de caracteres concatenándolas e insertando n blancos entre cada palabra (n debe ser no negativo).
-}
los_n_blancos :: Integer -> [Char]
los_n_blancos 0 = []
los_n_blancos x
   |x>=1 = [' '] ++ los_n_blancos(x-1)
aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] _ = []
aplanarConNBlancos (x:xs) n
   |xs /= [] = x++ los_n_blancos n ++ aplanarConNBlancos xs n
   |otherwise = x
{-Ejercicio 5. Definir las siguientes funciones sobre listas:
1. sumaAcumulada :: (Num t) => [t] -> [t] según la siguiente especificación:
problema sumaAcumulada (s: seq<T>) : seq<T> {
requiere: {T ∈ [N, Z, R]}
asegura: {|s| = |resultado| ∧ el valor en la posición i de resultado es sumatoria(desde k=0,hasta i, de s[k]) --no me salió
Por ejemplo sumaAcumulada [1, 2, 3, 4, 5] es [1, 3, 6, 10, 15].
-}
sumarN_v2 :: (Num t) => t ->  [t] -> [t]
sumarN_v2 _ [] = []
sumarN_v2 n (x:xs) 
   = x+n :sumarN_v2 n xs

sumar_el_primero :: (Num t) => [t] -> [t]
sumar_el_primero [] = []
sumar_el_primero (x:xs)
   = sumarN_v2 x (xs)

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada x 
   |longitud x ==1 = x
sumaAcumulada (x:xs)
   = x:sumaAcumulada(sumar_el_primero(x:xs))
{-2. descomponerEnPrimos :: [Integer] -> [[Integer]] según la siguiente especificación:
problema descomponerEnPrimos (s: seq<Z>) : seq<seq<Z>> {
requiere: { Todos los elementos de s son mayores a 2 }
asegura: { |resultado| = |s| }
asegura: {todos los valores en las listas de resultado son números primos}
asegura: {multiplicar todos los elementos en la lista en la posición i de resultado es igual al valor en la posición i de s}
Por ejemplo descomponerEnPrimos [2, 10, 6] es [[2], [2, 5], [2, 3]].
-}
es_primo :: Integer -> Integer -> Bool
es_primo x y
   |y<x && mod x y == 0 = False
   |y<x && mod x y /=0 = es_primo x (y+1)
   |otherwise = True

descomponerEnPrimos_aux :: Integer -> Integer -> [Integer]
descomponerEnPrimos_aux x y
   |es_primo x y = [x]
   |es_primo x y == False && mod x y ==0 = y : descomponerEnPrimos_aux (div x y) ( y + 1 )
   |es_primo x y == False && mod x y /=0 =  descomponerEnPrimos_aux x ( y + 1 )

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs)
   =descomponerEnPrimos_aux x 2 : descomponerEnPrimos xs

--GUIA PRACTICA 3--- Introducción a Haskell
{-1. Definici´on de funciones b´asicas
Ejercicio 1. a) Implentar la funci´on parcial f :: Integer ->Integer definida por extensi´on de la siguiente manera:
f(1) = 8
f(4) = 131
f(16) = 16
cuya especificaci´on es la siguiente:
problema f (n: Z) : Z {
requiere: {n = 1 ∨ n = 4 ∨ n = 16}
asegura: {(n = 1 → result = 8) ∧ (n = 4 → result = 131) ∧ (n = 16 → result = 16)}
}
-}
funcion_basica :: Integer ->Integer
funcion_basica x 
    |x==1 =8
    |x==4 =131
    |x==16 =16
{-)b) An´alogamente, especificar e implementar la funci´on parcial g :: Integer ->Integer
g(8) = 16
g(16) = 4
g(131) = 1  
-}
funcion_basica_2 :: Integer ->Integer
funcion_basica_2 x
    |x==8 =16
    |x==16 =4
    |x==131 =1
--)c) A partir de las funciones definidas en los ´ıtems 1 y 2, implementar las funciones parciales h = f ◦ g y k = g ◦ f }
funcion_basica_fog :: Integer ->Integer
funcion_basica_fog x 
    |x==8 =16
    |x==16 =131
    |x==131 =8
funcion_basica_gof :: Integer -> Integer
funcion_basica_gof x
    |x==1 =16
    |x==4 =1
    |x==16 =131
{-Ejercicio 2. F Especificar e implementar las siguientes funciones, incluyendo su signatura.
a) absoluto: calcula el valor absoluto de un n´umero entero.-}
absoluto :: Integer -> Integer
absoluto x
    |x>=0 =x
    |x<=0 =x*(-1)
--b) maximoabsoluto: devuelve el m´aximo entre el valor absoluto de dos n´umeros enteros.
maximoabsoluto :: Integer ->Integer -> Integer
maximoabsoluto x y 
    |absoluto x >= absoluto y = x
    |otherwise = absoluto y
-- c) maximo3: devuelve el m´aximo entre tres n´umeros enteros.
maximo_3 :: Integer ->Integer -> Integer -> Integer
maximo_3 x y z
    |x>=y && x>=z = x
    |y>=x && y>=z = y
    |otherwise = z
{-d) algunoEs0: dados dos n´umeros racionales, decide si alguno de los dos es igual a 0 (hacerlo dos veces, una usando pattern
matching y otra no).-}
algunoEsCero :: Float -> Float -> Bool
algunoEsCero x y 
    |x == 0 || y == 0 = True
    |otherwise = False
alguno_es_cero :: Float -> Float -> Bool
alguno_es_cero x y 
    |x==0 =True
    |y==0 =True
    |otherwise = False
{-e) ambosSon0: dados dos n´umeros racionales, decide si ambos son iguales a 0 (hacerlo dos veces, una usando pattern matching
y otra no)-}
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y 
    |x==0 && y==0 = True
    |otherwise = False
ambos_son_cero :: Float -> Float -> Bool
ambos_son_cero x y 
    = x==0 && y==0
{-f) mismoIntervalo: dados dos n´umeros reales, indica si est´an relacionados considerando la relaci´on de equivalencia en R
cuyas clases de equivalencia son: (−∞, 3],(3, 7] y (7, ∞), o dicho de otra forma, si pertenecen al mismo intervalo.
-}
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y 
    |x<=3 && y<=3 = True
    |3<x && x<=7 && 3<y && y<=7 =True
    |7<x && 7<y =True
    |otherwise = False
-- g) sumaDistintos: que dados tres n´umeros enteros calcule la suma sin sumar repetidos (si los hubiera).
sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z
    |x/=y && x/=z && y/=z = x+y+z
    |x/=y && y==z = x+z
    |y/=z && x==z = x+y
    |x/=z && x==y = x+y
    |x==z && y==z = x
--h) esMultiploDe: dados dos n´umeros naturales, decidir si el primero es m´ultiplo del segundo.
esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y
    =mod x y ==0 
--i) digitoUnidades: dado un n´umero natural, extrae su d´ıgito de las unidades.
digitoUnidades :: Integer -> Integer
digitoUnidades x
    = mod x 10
-- j) digitoDecenas: dado un n´umero natural, extrae su d´ıgito de las decenas.
digitoDecenas :: Integer -> Integer
digitoDecenas x
    = mod x 100
{-Ejercicio 3. Implementar una funci´on estanRelacionados :: Integer ->Integer ->Bool
problema estanRelacionados (a:Z, b:Z) : Bool {
requiere: {a /= 0 ∧ b /= 0}
asegura: {(res = true) ↔ a ∗ a + a ∗ b ∗ k = 0 para alg´un k ∈ Z con k /= 0)}
-}
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados x y 
    = mod x y ==0 
{-Ejercicio 4. F
Especificar e implementar las siguientes funciones utilizando tuplas para representar pares, ternas de n´umeros.
a) prodInt: calcula el producto interno entre dos tuplas R × R.
-}
prodInt:: (Float,Float) -> (Float,Float) -> Float
prodInt (a,b)(c,d)
    =a*c + b*d
{-b) todoMenor: dadas dos tuplas R×R, decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada
correspondiente de la segunda tupla.
-}
todoMenor :: (Float,Float)-> (Float,Float)->Bool
todoMenor (a,b) (c,d)
    = a<c && b<d
--c) distanciaPuntos: calcula la distancia entre dos puntos de R2
distanciaPuntos::(Floating a,Num a)=>(a,a)->(a,a)->a
distanciaPuntos (a,b)(c,d) 
    = sqrt(((c-a)*(c-a))+((d-b)*(d-b)))
-- d) sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos
sumaTerna:: (Integer,Integer,Integer)-> Integer
sumaTerna (a,b,c)
    = a+b+c
{-e) sumarSoloMultiplos: dada una terna de n´umeros enteros y un natural, calcula la suma de los elementos de la terna que
son m´ultiplos del n´umero natural. Por ejemplo:
sumarSoloMultiplos (10,-8,-5) 2-> 2
sumarSoloMultiplos (66,21,4) 5 ->0
sumarSoloMultiplos (-30,2,12) 3 ->-18
-}
sumarSoloMultiplos :: (Integer,Integer,Integer)->Integer->Integer
sumarSoloMultiplos (a,b,c) x
    | esMultiploDe a x && esMultiploDe b x && esMultiploDe c x = a+b+c
    | esMultiploDe a x && esMultiploDe b x && (esMultiploDe c x==False) = a+b
    | esMultiploDe a x && esMultiploDe c x && (esMultiploDe b x==False) = a+c
    | esMultiploDe b x && esMultiploDe c x && (esMultiploDe a x==False) = b+c
    | esMultiploDe a x && (esMultiploDe c x==False) && (esMultiploDe b x==False) = a
    | esMultiploDe b x && (esMultiploDe c x==False) && (esMultiploDe a x==False) = b
    | esMultiploDe c x && (esMultiploDe b x==False) && (esMultiploDe a x==False) = c
    | (esMultiploDe a x==False) && (esMultiploDe c x==False) && (esMultiploDe b x==False) = 0
--otra idea
es_multiplo_de :: Int -> Int -> Int
es_multiplo_de x y 
    |mod x y == 0 =x
    |otherwise = 0
sumar_solo_multiplos :: (Int,Int,Int)-> Int -> Int
sumar_solo_multiplos (a,b,c) x = (es_multiplo_de a x)+ (es_multiplo_de b x) + (es_multiplo_de c x)
{-f) posPrimerPar: dada una terna de enteros, devuelve la posici´on del primer n´umero par si es que hay alguno, y devuelve
4 si son todos impares.
-}
posPrimerPar ::(Int,Int,Int)-> Int
posPrimerPar (a,b,c)
    |mod a 2==0 =0
    |mod b 2==0 =1
    |mod c 2==0 =2
    |otherwise = 4
{-g) crearPar :: a ->b ->(a, b): crea un par a partir de sus dos componentes dadas por separado (debe funcionar para
elementos de cualquier tipo)-}
crearPar:: a->b->(a,b)
crearPar a b 
    =(a,b)
{-h) invertir :: (a, b) ->(b, a): invierte los elementos del par pasado como par´ametro (debe funcionar para elementos
de cualquier tipo).-}
invertir :: (a,b)->(b,a)
invertir (x,y)
    =(y,x)
{-Ejercicio 5. Implementar la funci´on todosMenores :: (Integer, Integer, Integer) ->Bool
problema todosMenores ((n1,n2,n3) : Z × Z × Z) : Bool {
requiere: {T rue}
asegura: {(res = true) ↔ ((f(n1) > g(n1)) ∧ (f(n2) > g(n2)) ∧ (f(n3) > g(n3))))
}
problema f (n: Z) : Z {
requiere: {T rue}
asegura: {(n ≤ 7 → res = n2) ∧ (n > 7 → res = 2n − 1)}
}
problema g (n: Z) : Z {
requiere: {T rue}
asegura: {Si n es un n´umero par, entonces res = n/2, en caso contrario, res = 3n + 1}
-}
funcion_f :: Integer->Integer
funcion_f x
    |x<= 7 = x*x
    |otherwise = (2*x - 1)
funcion_g ::  Integer -> Integer
funcion_g x 
    |mod x 2== 0 =x `div` 2      -- si pongo x/2 con x=5 me da 2.5, si pongo  x`div` 2 con x=5 me da 2
    |otherwise =(3*x +1)
todosMenores ::(Integer,Integer,Integer) ->Bool
todosMenores (a,b,c)
    = (funcion_f a > funcion_g a) && (funcion_f b > funcion_g b) && (funcion_f c > funcion_g c)
{-Ejercicio 6. Programar una funci´on bisiesto :: Integer ->Bool seg´un la siguiente especificaci´on:
problema bisiesto (a˜no: Z) : Bool {
requiere: {T rue}
asegura: {res = f alse ↔ a˜no no es m´ultiplo de 4 o a˜no es m´ultiplo de 100 pero no de 400}
}
Por ejemplo:
bisiesto 1901 False, bisiesto 1904 True,
bisiesto 1900 False, bisiesto 2000 True.
-}    
bisiesto :: Integer -> Bool
bisiesto x
    |mod x 4 /= 0 =False       
    |mod x 100 == 0 && mod x 400 /=0 =False
    |otherwise =True
{-Ejercicio 7. Implementar una funci´on:
distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) ->Float
problema distanciaManhattan (p : R × R × R, q : R × R × R) : R {
requiere: {T rue}
asegura: {res =P2 i=0 |pi − qi|}
}
Por ejemplo:
distanciaManhattan (2, 3, 4) (7, 3, 8) 9
distanciaManhattan ((-1), 0, (-8.5)) (3.3, 4, (-4)) 12.8-}
absoluto_2 :: Float -> Float
absoluto_2 x
    |x>=0 =x
    |x<=0 =x*(-1)
distanciaManhattan ::  (Float, Float, Float) ->(Float, Float, Float) ->Float
distanciaManhattan (a,b,c) (x,y,z)
    = (absoluto_2(a-x)) + (absoluto_2(b-y))+ (absoluto_2(c-z))
{-Ejercicio 8. Implementar una funci´on comparar :: Integer ->Integer ->Integer
problema comparar (a:Z, b:Z) : Z {
requiere: {True}
asegura: {(res = 1 ↔ sumaUltimosDosDigitos(a) < sumaUltimosDosDigitos(b))}
asegura: {(res = −1 ↔ sumaUltimosDosDigitos(a) > sumaUltimosDosDigitos(b))}
asegura: {(res = 0 ↔ sumaUltimosDosDigitos(a) = sumaUltimosDosDigitos(b)))}
}
problema sumaUltimosDosDigitos (x: Z) : Z {
requiere: {True}
asegura: {res = (x m´od 10) + (b(x/10)c m´od 10)}
}
Por ejemplo:
comparar 45 312 -1 porque 312 ≺ 45 y 1 + 2 < 4 + 5.
comparar 2312 7 1 porque 2312 ≺ 7 y 1 + 2 < 0 + 7.
comparar 45 172 0 porque no vale 45 ≺ 172 ni tampoco 172 ≺ 45.-}
sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x 
    = mod x 10 + (mod (div x 10) 10)
comparar :: Integer -> Integer -> Integer
comparar x y 
    |sumaUltimosDosDigitos x < sumaUltimosDosDigitos y = 1
    |sumaUltimosDosDigitos x > sumaUltimosDosDigitos y = (-1)
    |otherwise = 0
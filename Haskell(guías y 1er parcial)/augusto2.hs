    {-ej 2-}
digitoUnidades :: Integer ->   Integer
digitoUnidades x = mod x 10

digitoDecenas :: Integer ->    Integer
digitoDecenas x = mod x 100

    {- ej 3-}
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados x y = (x/=0) && (y/=0) && (mod x y == 0)

    {-ej 4-}
prodInt :: (Float,Float,Float) -> (Float,Float,Float) -> Float
prodInt (a,b,c)(x,y,z)= (a*x)+(b*y)+(c*z)

todoMenor :: (Float,Float) -> (Float,Float) -> Bool
todoMenor  (a,b)(c,d) = a<c && b<d 

todoMenorr :: (Float,Float) -> (Float,Float) -> Bool
todoMenorr x y = (fst x < fst y ) && (snd x < snd y)

distanciaPuntos :: (Float,Float) -> (Float,Float) -> (Float,Float)
distanciaPuntos (x,y)(a,b) = (x-a,y-b)

sumaTerna :: (Integer,Integer,Integer) -> Integer
sumaTerna (x,y,z) = x+y+z

sumarSoloMultiplos :: (Integer,Integer,Integer) -> (Integer) -> (Integer)
sumarSoloMultiplos (x,y,z) a = (esMultiplo x a)+ (esMultiplo y a) + (esMultiplo z a)

esMultiplo :: Integer -> Integer -> Integer
esMultiplo x y | mod x y ==0 =x
               | otherwise = 0

posPrimerPar :: (Integer,  Integer) -> Integer
posPrimerPar (x,y)  | mod x 2 ==0 = 1
                    | mod y 2 ==0 = 2
                    | otherwise   = 4

crearPar :: a -> b -> (a,b)
crearPar x y= (x,y)

invertir :: a -> b -> (b,a)
invertir x y = (y,x)

    {-ej 5 -} 
todosMenores :: (Integer,Integer,Integer) -> Bool
todosMenores (x,y,z) = ((problemaF x > problemaG x) && (problemaF y > problemaG y) && (problemaF z > problemaG z) ) 

problemaF ::  Integer -> Integer 
problemaF x | x<= 7 = x ^ 2 
            | otherwise = 2*x - 1

problemaG :: Integer -> Integer
problemaG x| mod x 2 ==0 = div x 2
           |otherwise = 3*x+1

    {-ej 6-}
problemaBisiesto :: Integer -> Bool
problemaBisiesto x | mod x 4 ==0 = True
                   |mod x 100 /= 0 && mod x 400 == 0  =True
                   |otherwise = False
    {-ej 7-}
distanciaManhattan :: (Float,Float,Float) -> (Float,Float,Float) -> Float 
distanciaManhattan (x,y,z)(a,b,c) = abs (x-a) + abs(y-b) + abs (z-c)
    {-ej 8-}
comparar :: Integer -> Integer -> Integer
comparar x y | ((sumaUltimosDosDigitos x)  < (sumaUltimosDosDigitos y) ) = 1
              | ((sumaUltimosDosDigitos x)  > (sumaUltimosDosDigitos y))  = (-1)
             | ((sumaUltimosDosDigitos x) == (sumaUltimosDosDigitos y))  = 0

sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = mod x 10 + (mod (div x 10) 10)

{-ej 9
a) f1 (x:r):r {
    requiere : {true}
    asegura:{res=1 <-> x=0, si no res=0}
}
b)f2 (x:R): R {
    requiere :{true}
    asegura:{res=15 <-> x=1,res=-15 <-> x=-1}
}
c)f3 (x:R):R{
    requiere:{true}
    asegura:{res=7 <-> x<=9,res=5 <-> x=>3}
}
d) f4 (x:r, y:r):r {}
    requiere :{true}
    asegura:{(x+y)/2}
}
e)f5:(t:rXr): r {
    requiere :{true}
    asegura:{res= (t0+t1)/2}
}
f) f6 (x:R,y:Z): Bool {
    requiere:{true}
    asegura:{res=true,si x es positivo entonces y será el numero entero mas cercano redondeando hacia abajo.Si x es negativo y será es el numero entero mas cercano al redondear hacia arriba)}
}
-}
                                        {- practica 4 -}
    {- ej 1 -}
fibonacci :: Integer ->    Integer
fibonacci n | n==0 =0
            | n==1 =1
            |otherwise =fibonacci(n-1) +fibonacci(n-2)

fibonacci2 :: Integer -> Integer
fibonacci2 0=0
fibonacci2 1=1
fibonacci2 n = fibonacci2 (n-1) + fibonacci2 (n-2)
    {-ej 2-}
parteEntera :: Float -> Integer
parteEntera x |(-1) < x && x<=1 =0
              | x > 1 = 1 + parteEntera(x-1) 
              |otherwise =1 + parteEntera(x-1)
    {-ej3-}
esDivisible :: Integer -> Integer -> Bool
esDivisible x 0 = False
esDivisible 0 y = True
esDivisible x y | x < y = False
                |otherwise = esDivisible (x-y) y 
{-ej 4-}
 {- ej 4 (x:N): N
 requiere :{true}
 asegura:{resultado= suma los n números impares}
 -}
sumaImpares :: Integer -> Integer
sumaImpares x |x <=0 =0
              |otherwise= (x*2-1) + sumaImpares (x-1)
{-ej5-} 
equisMenosDos :: Integer -> Integer
equisMenosDos x | x < 1 = 1
                |otherwise = (x)* equisMenosDos(x-2)
{-ej 6-}
{-ej 6(x:N): N
requiere: {true}
asegura:{res=suma de digitos del mismo número}
-}

sumaDigitos :: Integer -> Integer
sumaDigitos x | x < 10 = x 
              |otherwise = (mod x 10) + sumaDigitos(div x 10) 
{-ej 7 -}
todosDigitosIguales :: Integer -> Bool 
todosDigitosIguales x |x < 10 = True
                      |otherwise = daUltD x== daUltD(sacaUltD x) && todosDigitosIguales (sacaUltD x)
                      
daUltD :: Integer -> Integer
daUltD x = mod x 10 

sacaUltD :: Integer -> Integer
sacaUltD x = div x 10
    {-ej 8-}
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito x y |y == cantDigitos x = daUltD x
                 |otherwise = iesimoDigito (sacaUltD x) y
                

cantDigitos :: Integer -> Integer
cantDigitos x |x <10 = 1
              |otherwise = 1+ cantDigitos(sacaUltD x)
{-ej 9-}
{-ej 9(x:N):Bool
requiere:{n>=0 true}
asegura:{res= true <-> n es capicua(se lee igual de izq a derecha)}
-}

esCapicua :: Integer -> Bool
esCapicua x |x < 10 = True
            | mod x 10 == daElPrimer x =esCapicua (eliminarPrimerYUltimoDigito x)
            |otherwise = False 
            
daElPrimer:: Integer -> Integer
daElPrimer x | x<10 = x
             | otherwise = daElPrimer(div x 10)

contarDigitos :: Integer -> Integer
contarDigitos x
    | x < 10    = 1
    | otherwise = 1 + contarDigitos (x `div` 10)

eliminarPrimerYUltimoDigito :: Integer -> Integer
eliminarPrimerYUltimoDigito x   | x < 10 = x
                                | otherwise = mod (div x 10) (10 ^ (contarDigitos x - 2))
                               
    {-ej13-}
{-
ej 13 (x:F,y:F): F {
requiere: {true}
asegura:{res= la sumatoria de x hasta x, elevado a y, hasta y.Para todo x e y mayor= 1}
}
-}
sumatoriaInf :: (Integer,Integer) -> Integer
sumatoriaInf (x,y) |x==1 = y
                   |otherwise = ((x-1)^y) + sumatoriaAux (x, y)

sumatoriaAux :: (Integer,Integer) -> Integer
sumatoriaAux (x, y) |y==1 =x
                    | otherwise = x^y + sumatoriaAux (x, (y-1))
    {-ej 16-}
{-
ej 16 ()
-}
menorDivisor :: Integer -> Integer
menorDivisor x|x==1 = 1
              |otherwise = divisor x 2
divisor :: Integer -> Integer -> Integer
divisor x y|x==y =x
           |mod x y ==0 =y
           |otherwise = divisor x (y+1)
 {-ej 19- -----------------------------------------rehacer
 sumaInicialDePrimos :: Integer -> Bool
 sumaInicialDePrimos x | restaPrimos x 2 
-
 restaPrimos :: Integer -> Integer -> Bool
 restaPrimos x y |(x -(primos y)) == 0 = True
                 |(x - (primos y))< 0 = False
                 |otherwise = restaPrimos (x- (primos y)) (y+1) 
--}
primos :: Integer -> Integer
primos x| menorDivisor x /=x =0 
        |otherwise = x
{-------------------practica 5---rehacer hayrepetidos---------------------}
longitud :: [t] -> Integer
longitud []= 0
longitud x= 1 + longitud (tail x)
{-
hayRepetidos :: (Eq t) => t -> [t] -> Bool
hayRepetidos []= False
hayRepetidos |x==y = True
             |otherwise = sacaLista (x:xs)

 
sacaLista :: (Eq t)=> t-> [t] -> Bool
sacaLista (x:y:xs) | x== xs = True
                   |otherwise = y==xs = True
-}
hayRep :: (Eq t) => [t] -> Bool
hayRep []= False
hayRep (x:xs) = esMiembro x xs || hayRep xs

esMiembro ::  (Eq t) => t -> [t] -> Bool
esMiembro x s |s==[]= False
              |x == head s = True
              |otherwise = esMiembro x (tail s)
{-ej3-}
maximo :: [Integer] -> Integer
maximo [] = 0
maximo  [x]=x
maximo (x:y:xs) | y<=x = maximo (x:xs)
                | otherwise = maximo (y:xs)
                
otroMaximo :: [Integer] -> Integer
otroMaximo [x] =x
otroMaximob (x:y:s) | x>= y = otroMaximo (x:s)
                    | x< y = otroMaximo (y:s)

  
        {- testeos-} 
test1=(todosDigitosIguales 2738917938721987321) == False


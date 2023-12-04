--GUIA PRACTICA 4-- Recursión sobre números enteros
--(ult ej sin hacer)
{-Ejercicio 1. Implementar la funci´on fibonacci:: Integer ->Integer que devuelve el i-´esimo n´umero de Fibonacci.
Recordar que la secuencia de Fibonacci se define como:
f ib(n) =
0 si n = 0
1 si n = 1
f ib(n − 1) + f ib(n − 2) en otro caso
problema fibonacci (n: Z) : Z {
requiere: { n ≥ 0 }
asegura: { resultado = f ib(n) }
-}
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n 
    = fibonacci(n-1) + fibonacci(n-2)
{-Ejercicio 2. Implementar una funci´on parteEntera :: Float ->Integer seg´un la siguiente especificaci´on:
problema parteEntera (x: R) : Z {
requiere: { T rue }
asegura: { resultado ≤ x < resultado + 1 }
}-}
parte_Entera :: Float -> Integer                   --Este lo habían hecho en clase creo
parte_Entera x |(-1) < x && x<=1 =0
               | x > 1 = 1 + parteEntera(x-1) 
               |otherwise =1 + parteEntera(x-1)
parteEntera :: Float -> Integer
parteEntera x
    =floor x
{-Ejercicio 3. Especificar e implementar la funci´on esDivisible :: Integer ->Integer ->Bool que dados dos numeros
naturales determinar si el primero es divisible por el segundo. No esta permitido utilizar las funciones mod ni div.-}
esDivisible ::  Integer -> Integer -> Bool
esDivisible 0 _ = True
esDivisible x y 
    |(x - y) == 0 =True
    |(x - y) /= 0 = False
    |otherwise= esDivisible(x-y) y
{-Ejercicio 4. Especificar e implementar la funcion sumaImpares :: Integer ->Integer que dado n ∈ N sume los primeros
n numeros impares. Por ejemplo: sumaImpares 3 --> 1+3+5--> 9.
-}
sumaImpares :: Integer -> Integer  --quee jaja
sumaImpares 0 = 0
sumaImpares x
    =x*x
{-Ejercicio 5. Implementar la funcion medioFact :: Integer ->Integer que dado n ∈ N calcula n!! = n (n−2)(n−4)· · · .
problema medioFac (n: Z) : Z {
requiere: { n ≥ 0 }
asegura: { resultado =b n−1 2Yc i=0 (n − 2i) } -- es una productoria pero vs no reconoce el simbolo
}
Por ejemplo:
medioFact 10 -> 10 ∗ 8 ∗ 6 ∗ 4 ∗ 2 -> 3840.
medioFact 9 -> 9 ∗ 7 ∗ 5 ∗ 3 ∗ 1 -> 945.
medioFact 0 -> 1.
-}
medioFact :: Integer -> Integer    -- no funciona
medioFact x
    |(x-2)<= 1 = 1
    |(x-4)<=1 = 2
    |otherwise=x*(x-2) * medioFact(x-4)
medio_facto :: Integer -> Integer  -- no se como no me di cuenta estaba en discord jaja
medio_facto x
    |x < 1 = 1
    |otherwise = x * medio_facto(x-2)
{-Ejercicio 6. Especificar e implementar la funcion sumaDigitos :: Integer ->Integer que calcula la suma de dıgitos de
un numero natural. Para esta funci´on pueden utilizar div y mod.-}
sumaDigitos :: Integer -> Integer
sumaDigitos x
    |x <10 = x
    |x ==10 = 1
    |otherwise= mod x 10 + sumaDigitos(div x 10)
{-Ejercicio 7. Implementar la funcion todosDigitosIguales :: Integer ->Bool que determina si todos los dıgitos de un numero natural son iguales, es decir:
problema todosDigitosIguales (n: Z) : B {
requiere: { n > 0 }
asegura: { resultado = true ↔ todos los dıgitos de n son iguales }
-}
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales x
    |x<10 = True
    |mod x 10 /= (mod (div x 10) 10) = False
    |otherwise = todosDigitosIguales(div x 10)
{-Ejercicio 8. Implementar la funcion iesimoDigito :: Integer ->Integer ->Integer que dado un n ∈ N≥0 y un i ∈ N
menor o igual a la cantidad de dıgitos de n, devuelve el i-esimo dıgito de n.
problema iesimoDigito (n: Z, i: N) : Z {
requiere: { n ≥ 0 ∧ 1 ≤ i ≤ cantDigitos(n) }
asegura: { resultado = (n div 10^(cantDigitos(n)−i)) mod 10 }
}
problema cantDigitos (n: Z) : N {
requiere: { n ≥ 0 }
asegura: { n = 0 → resultado = 1}
asegura: { n /= 0 → (n div 10^(resultado−1) > 0 ∧ n div 10^(resultado) = 0) }
-}
cantDigitos :: Integer -> Integer  --juju
cantDigitos x 
    | x <10 = 1
    |div x 10 /=(div(div x 10) 10 ) = 1 + cantDigitos( div x 10)
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito x y 
    = mod(div x (10^((cantDigitos x) - y))) 10
{-Ejercicio 9. Especificar e implementar una funcion esCapicua :: Integer ->Bool que dado n ∈ N≥0 determina si n es
un n´umero capic´ua.-}
primero_y_ult :: Integer -> Bool
primero_y_ult x 
    = (div x (10^((cantDigitos x)  -1))) == mod x 10 
esCapicua :: Integer -> Bool
esCapicua x
    | x<10 = True
    |primero_y_ult x /= True = False
    |primero_y_ult x == True = esCapicua(div(mod x (10^((cantDigitos x) -1)))  10)
{-Ejercicio 10. Especificar, implementar y dar el tipo de las siguientes funciones (simil Ejercicio 4 Practica 2 de Algebra 1). -}
--a) f1(n) = hasta n desde i=0 2^i , n ∈ N0.
sumatoria_a :: Integer -> Integer
sumatoria_a x
    = (2^(x +1)) -1 
--b) f2(n, q) = hasta n desde i=1 q^i , n ∈ N y q ∈ R
contador :: Integer -> Bool  -- al pedo encima siempre da false claramente pero queria hacer algo como si fuese python con un while o algo asi
contador x 
    | x-1 >0 = contador(x-1)
    |x-1 <=0 = False
sumatoria_b :: Float -> Integer -> Float
sumatoria_b x y
    |y>=1 = (x^(y)) + sumatoria_b x (y-1)
    |otherwise = 0
--c) f3(n, q) =  hasta 2n desde i=1 q^i, n ∈ N0 y q ∈ R
sumatoria_c :: Float -> Integer -> Float
sumatoria_c x y
    |y>=1 = (x^(2*y)) + (x^((2*y)-1)) + sumatoria_c x (y-1) 
    |otherwise = 1
-- d) f4(n, q) = hasta 2n desde i=n q^i , n ∈ N0 y q ∈ R   
sumatoria_d ::  Float -> Integer -> Float
sumatoria_d q n
    |n>=(n + 1) = (q^(2*n)) + (q^((2*n)-1))  + sumatoria_d q (n-1) 
    |otherwise = 1
f4 :: Integer -> Float -> Float                          --con chatGPT porq ya no me daba el cerebro, claro con una funcion aux como pensaba pero no me salia
f4 n q
    | n >= 0 = sumatoria n (2 * n) q
    | otherwise = error "El valor de n debe ser no negativo."

sumatoria :: Integer -> Integer -> Float -> Float
sumatoria i limite q
    | i > limite = 0
    | otherwise = q^i + sumatoria (i + 1) limite q
{-Ejercicio 11.
 a) Especificar e implementar una funcion eAprox :: Integer ->Float que aproxime el valor del numero e
a partir de la siguiente sumatoria:
eˆ(n) = desde i=0, hasta n, (1/i!)-}
factorial :: Integer -> Integer
factorial n 
    | n-1 == 0 = n
    | (n-1)>=0 = n*(n-1) * factorial(n-2)
    | otherwise = 1
eAprox :: Integer -> Float
eAprox n 
    | (n-1) >= 0 = ( 1/ fromIntegral(factorial n)) + eAprox(n-1)
    |otherwise = 1
{-b) Definir la constante e :: Float como la aproximacion de e a partir de los primeros 10 terminos de la serie anterior.
¡Atencion! A veces ciertas funciones esperan un Float y nosotros tenemos un Int. Para estos casos podemos utilizar la
funcion fromIntegral :: Int ->Float definida en el Preludio de Haskell.-}
e :: Float
e = eAprox 10
{-Ejercicio 12. Para n ∈ N se define la sucesion:
an = 2 + 1/( 2 + 1/(...2 + 1/(2 +1/ 2)
(aparece n veces el 2).
Lo cual resulta en la siguiente definici´on recursiva: a1 = 2, an = 2 + 1/(an−1)
. Utilizando esta sucesion, especificar e implementar
una funcion raizDe2Aprox :: Integer ->Float que dado n ∈ N devuelva la aproximacion de √2 definida por √2 ≈ an−1.
Por ejemplo:
raizDe2Aprox 1 1
raizDe2Aprox 2 1,5
raizDe2Aprox 3 1,4-}
raizDe2Aprox :: Integer -> Float
raizDe2Aprox n 
    |n == 1   = 2
    |n-1 >= 1 = (2 + (1/raizDe2Aprox(n-1))) 
raiz_de_dos :: Integer -> Float
raiz_de_dos ñ
    = (raizDe2Aprox ñ) -1
{-Ejercicio 13. Especificar e implementar la siguiente funcion:
f(n, m) = sum (desde i=1 hasta n) sum(desde j=1,hasta m) i^j -}
sumatoria_e :: Float-> Integer -> Float
sumatoria_e n m
    |n-1>=1 =(sumatoria_b n m) + (sumatoria_e (n-1) (m))
    |otherwise = fromIntegral m -- le agrego el caso cuando n==1 que no entiendo porque no entra
{-Ejercicio 14. Especificar e implementar una funcion sumaPotencias :: Integer ->Integer ->Integer ->Integer que
dados tres naturales q, n, m sume todas las potencias de la forma q
a+b
con 1 ≤ a ≤ n y 1 ≤ b ≤ m.-}
sumatoria_f :: Float -> Integer -> Integer -> Float
sumatoria_f q n m 
    = (sumatoria_b q (n+m)) - (q)
{-Ejercicio 15. Especificar e implementar una funcion sumaRacionales :: Integer ->Integer ->Float que dados dos
naturales n, m sume todos los numeros racionales de la forma p/q con 1 ≤ p ≤ n y 1 ≤ q ≤ m, es decir:
problema sumaRacionales (n : N, m : N) : R {
requiere: { True}
asegura: { resultado = sum(desde p=1,hasta n)sum(desde q=1,hasta m)p/q
-}
sumatoria_g :: Integer -> Integer -> Float
sumatoria_g p q 
    |q>=1 = (fromIntegral p/fromIntegral q) + (sumatoria_g p (q-1))
    |otherwise = 0
sumatoria_h :: Integer -> Integer -> Float
sumatoria_h p q 
    |p>=1 = (sumatoria_g p q) + (sumatoria_h(p-1) q)
    |otherwise = 0
{-Ejercicio 16. Recordemos que un entero p > 1 es primo si y solo si no existe un entero k tal que 1 < k < p y k divida a p.
a) Implementar menorDivisor :: Integer ->Integer que calcule el menor divisor (mayor que 1) de un natural n pasado
como parametro.-}
menorDivisorAux :: Integer -> Integer -> Integer
menorDivisorAux x y 
    |mod x y == 0 = y
    |otherwise = (menorDivisorAux x (y+1))
menorDivisor :: Integer -> Integer           
menorDivisor x
    = menorDivisorAux x 2
--b) Implementar la funcion esPrimo :: Integer ->Bool que indica si un numero natural pasado como parametro es primo.
esPrimo :: Integer -> Bool
esPrimo x
    |x==1 = False
    |menorDivisor x == x = True
    |otherwise = False
{-c) Implementar la funcion sonCoprimos :: Integer ->Integer ->Bool que dados dos numeros naturales indica si no
tienen algun divisor en comun mayor estricto que 1.-}
--factorizar :: Integer
sonCoprimos :: Integer -> Integer -> Bool        --buenarda
sonCoprimos x y 
    |esPrimo x || esPrimo y = True
    |mod x y == 0 || mod y x == 0 = False
    |menorDivisor x == menorDivisor y = False
    |menorDivisor x /= menorDivisor y = (sonCoprimos(fromIntegral(div x (menorDivisor x ))) (fromIntegral(div y (menorDivisor y))))
    |otherwise = True
{-d) Implementar la funcion nEsimoPrimo :: Integer ->Integer que devuelve el n-esimo primo (n ≥ 1). Recordar que el
primer primo es el 2, el segundo es el 3, el tercero es el 5, etc.-}
nEsimoPrimo_Aux :: Integer -> Integer -> Integer -> Integer
nEsimoPrimo_Aux x y z
    |y==z = (x-1)
    |esPrimo x == True = nEsimoPrimo_Aux (x+1) (y+1) z
    |esPrimo x /= True = nEsimoPrimo_Aux (x+1)   y   z
nEsimoPrimo :: Integer -> Integer                    -----es buenisimaaaaaaa
nEsimoPrimo x
    = nEsimoPrimo_Aux 1 0 x
{-Ejercicio 17. Implementar la funcion esFibonacci :: Integer ->Bool segun la siguiente especificacion:
problema esFibonacci (n: Z) : B {
requiere: { n ≥ 0 }
asegura: { resultado = true ↔ n es algun valor de la secuencia de Fibonacci definida en el ejercicio 1}
-}
esFibonacci_Aux :: Integer -> Integer -> Bool
esFibonacci_Aux x  y
    |(fibonacci x)==y = True
    |(fibonacci x)/=y && (fibonacci x)<= y = esFibonacci_Aux (x+1)  y
    |otherwise = False
esFibonacci :: Integer -> Bool
esFibonacci x
    =esFibonacci_Aux 1 x
{-Ejercicio 18. Implementar una función mayorDigitoPar :: Integer ->Integer según la siguiente especificación:
problema mayorDigitoPar (n: N) : N {
requiere: { T rue }
asegura: { resultado es el mayor de los dígitos pares de n. Si n no tiene ningún dígito par, entonces resultado es -1.
}
}-}
{-pense en. si 8 esta en n rta-> 8,si 8no esta en n, pero 6 si rta-> 6,y asi suc
tambien pense en ir sacando los numeros impares y cuando te queden los pares ver cual es mas grande pero no me gusta tanto-}
ninguno_es_y :: Integer -> Integer -> Bool
ninguno_es_y x y
    |x < 10 &&  x/=y = True
    |mod x 10 == y = False
    |mod x 10 /= y = ninguno_es_y (div x 10) y
mayorDigitoPar_Aux :: Integer -> Integer -> Integer
mayorDigitoPar_Aux x y
    |y>=2 && ninguno_es_y x y  == False = y
    |y >=2 && ninguno_es_y x y == True = mayorDigitoPar_Aux x (y-2) 
    |otherwise = (-1)
mayorDigitoPar :: Integer -> Integer       
mayorDigitoPar x 
    = mayorDigitoPar_Aux x 8
{-Ejercicio 19. Implementar la función esSumaInicialDePrimos :: Int ->Bool según la siguiente especificación:
problema esSumaInicialDePrimos (n: Z) : B {
requiere: { n ≥ 0 }
asegura: { resultado = true ↔ n es igual a la suma de los m primeros números primos, para algún m.}
-}
va_restando_primos :: Integer -> Integer -> Bool
va_restando_primos x y 
    |(x - (nEsimoPrimo y)) < 0 = False
    |(x - (nEsimoPrimo y)) == 0 = True
    |(x - (nEsimoPrimo y)) /= 0 = va_restando_primos(x -(nEsimoPrimo y)) (y+1)
esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos x
    = va_restando_primos x 1
{-Ejercicio 20. Especificar e implementar la función tomaValorMax :: Int ->Int ->Int que dado un número entero n1 ≥ 1
y un n2 ≥ n1 devuelve algún m entre n1 y n2 tal que sumaDivisores(m) = máx{sumaDivisores(i) | n1 ≤ i ≤ n2}-}
-- no se si la entendi del todo bien
primo_anterior_mas_cercano :: Integer -> Integer
primo_anterior_mas_cercano x
    |esPrimo x = x
    |otherwise = primo_anterior_mas_cercano (x-1)
tomaValorMax :: Integer -> Integer -> Integer
tomaValorMax x y
    |esSumaInicialDePrimos y  = y
    |otherwise = primo_anterior_mas_cercano y
{-Ejercicio 21. Especificar e implementar una función pitagoras :: Integer ->Integer ->Integer ->Integer que dados  --no se ya no me da el cerebro
m, n , r ∈ N≥0, cuente cuántos pares (p, q) con 0 ≤ p ≤ m y 0 ≤ q ≤ n satisfacen que p^2 + q^2 <= r^2
 Por ejemplo:
pitagoras 3 4 5 ->20
pitagoras 3 4 2 ->6  
-}
pitagoras_aux :: Integer -> Integer -> Integer -> Integer -> Integer -> Integer -> Integer  
pitagoras_aux m n r contador limite_m limite_n
    |m<limite_m && n<=limite_n && ((m*m) +(n*n))>=(r*r) = pitagoras_aux (m+1) (n) r (contador ) limite_m limite_n
    |m<=limite_m && n<limite_n && ((m*m) +(n*n))>=(r*r) = pitagoras_aux (m) (n+1) r (contador ) limite_m limite_n
    |m<limite_m && n<=limite_n && ((m*m) +(n*n))<=(r*r) = pitagoras_aux (m+1) (n) r (contador +1) limite_m limite_n
    |m<=limite_m && n<limite_n && ((m*m) +(n*n))<=(r*r) = pitagoras_aux (m) (n+1) r (contador +1) limite_m limite_n
    |otherwise = contador
pitagoras :: Integer -> Integer -> Integer -> Integer  --lo hago en otra funcion para cumplir especificacion de 3 valores de entrada
pitagoras m n r
    = pitagoras_aux 0 0 r 0 m n
--recueperatorio del parcial de haskell
{-Parcial - tema1
Nota: 9.25 / 10.0 (APROBADO)

puntaje ej1: 2
puntaje ej2: 2
puntaje ej3: 2
puntaje ej4: 1
puntaje ej5: 2.25
Datos del alumno
Nombre: --

DNI/Pasaporte:--

LU:--

Maquina: --

Enunciado
Introducción a la Programación
Recuperatorio Haskell
El recuperatorio se aprueba con 6 puntos
Podrás utilizar las siguientes funciones del prelude
Numéricas: todas las operaciones numéricas: suma, resta, mod, etc.
Listas: head, tail, last, init, length, elem, ++
Tuplas: fst, snd
Operaciones lógicas: &&, ||, not
Constructores de listas: (x:xs), []
Constructores de tuplas: (x,y)
Utilizar este archivo fuente de base para la programación. Ya cuenta con los las signaturas correctas y la implementación de 3 funciones auxiliares que pueden utilizar:
esMin :: Char -> Bool recibe un caracter e indica si es una letra minúscula
charANat :: Char -> Int recibe un caracter en minúscula y devuelve el número natural correspondiente
natAChar :: Int -> Char recibe un número natural entre 0 y 25 y devuelve el caracter correspondiente
Para testear el código pueden usar este archivo que ya cuenta con todo lo necesario para desarrollar sus propios tests (este archivo no se entrega)
Para aprobar el parcial es requisito indispensable que todos los programas pasen los tests del archivo del punto anterior
Mensaje codificado
En el último debate presidencial cada equipo de campaña quería comunicarse con su candidato por teléfono sin que el otro equipo pudiera interceptar y leer el mensaje.
Como no tuvieron mucho tiempo desde las elecciones decidieron implementar en Haskell el código de César, que es una de las técnicas de cifrado más simples. 
Consiste en una codificación por sustitución en el que una letra en el texto original es reemplazada por otra letra que se encuentra un número fijo de posiciones
 más adelante en el alfabeto. Para mayor simplicidad, codificaron solo las letras minúsculas del mensaje y eliminaron la "ñ" del conjunto de letras minúsculas. 
 Todos los restantes símbolos quedarían inalterados en el mensaje codificado.
-}
-- Funciones implementadas por la cátedra que pueden ser utilizadas en la resolución de los ejercicios.
esMin :: Char -> Bool
esMin a = ord a >= ord 'a' && ord a <= ord 'z'

charANat :: Char -> Int
charANat a | esMin a = (ord a) - (ord 'a')

natAChar :: Int -> Char
natAChar n | 0 <= n && n <= 25 = chr ((ord 'a' )+n)
{-
1) Desplazar [2 puntos]
problema desplazar (a: Char, n: Z) : Char {
  requiere: {-25 <= n <= 25}
  asegura: {ord a >= ord 'a' ∧ ord a <= ord 'z' ∧ 0 <= n <= 25 → res es el caracter que se encuentra a n posiciones más adelante en el alfabeto (si se llega al final se comienza desde el principio)}
  asegura: {ord a >= ord 'a' ∧ ord a <= ord 'z' ∧ -25 <= n < 0 → res es el caracter que se encuentra a n posiciones más atrás en el alfabeto (si se llega al principio se comienza desde el final)}
  asegura: {¬ (ord a >= ord 'a' ∧ ord a <= ord 'z') → res = a }

Ejemplos:

desplazar 'b' 2 devuelve 'd'
desplazar 'b' -1 devuelve 'a'
desplazar 'x' 4 devuelve 'b'
desplazar 'b' -3 devuelve 'y'
desplazar ';' 2 devuelve ';'
-}-}
-- Ejercicio 1
minusculas =['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

desplazar ::  Char -> Int -> Char      
desplazar a x 
    |pertenece_a_minusculas a minusculas == False = a
    |x + charANat a >25 = natAChar((charANat a) + x -26 )
    |x + charANat a <0 = natAChar((charANat a) + x +26 )
    |otherwise = natAChar((charANat a)+ x )
{-2) Cantidad de caracteres en minúscula [2 puntos]
problema cantMinuscula (mensaje: String) : Z {
  requiere: {True}
  asegura: {res = cantidad de caracteres en minúscula en mensaje}
}-}
-- Ejercicio 2
pertenece_a_minusculas :: Char -> [Char] -> Bool
pertenece_a_minusculas _ [] = False
pertenece_a_minusculas c (x:xs)
    |c == x = True
    |otherwise = pertenece_a_minusculas c xs

cantMinusculas :: String -> Int
cantMinusculas [] = 0
cantMinusculas (x:xs)
    |pertenece_a_minusculas x minusculas =1 + cantMinusculas xs
    |otherwise = cantMinusculas xs
{-3) Codificar mensaje [2 puntos]
problema codificar (mensaje: String, n: Z) : String {
  requiere: {0 <= n <= 25}
  asegura: {res = versión codificada del mensaje, donde cada caracter en minúscula del mensaje se sustituye por la letra minúscula que se encuentra n posiciones más adelante en el alfabeto. Los caracteres que no son minúscula no se sustituyen.}
}-}
-- Ejercicio 3
codificar :: String -> Int -> String
codificar [] _ = []
codificar (x:xs) n  
    |pertenece_a_minusculas x minusculas = desplazar x n : codificar xs n
    |otherwise = x: codificar xs n
{-4) Decodificar mensaje [1 puntos]
problema decodificar (mensaje: String, n: Z) : String {
  requiere: {0 <= n <= 25}
  asegura: {res = versión decodificada del mensaje, donde cada caracter en minúscula del mensaje se sustituye por la letra minúscula que se encuentra n posiciones más atrás en el alfabeto. Los caracteres que no son minúscula no se sustituyen.}
}-}
-- Ejercicio 4
decodificar :: String -> Int -> String
decodificar [] _ = []
decodificar (x:xs) n  
    |pertenece_a_minusculas x minusculas = desplazar x (-n) : decodificar xs n
    |otherwise = x: decodificar xs n
{-5) Mensaje con cantidad de cambios máxima [3 puntos]
problema maximoCambios (mensajes: seq< String >) : String {
  requiere: {| mensajes | > 0}
  asegura: {res = mensaje perteneciente a mensajes tal que la cantidad de cambios (letras minúsculas a reemplazar) que tienen que hacerse para codificarlo es máxima. En caso de haber más de un mensaje máximo, res puede ser cualquiera de ellos.}
}-}
-- Ejercicio 5
maximoCambios :: [String] -> String
maximoCambios [] = ""
maximoCambios [x] = x
maximoCambios (x:y:xs)
    |cantMinusculas x > cantMinusculas y = maximoCambios (x:xs)
    |cantMinusculas x < cantMinusculas y = maximoCambios (y:xs)
{-Ejecucion de los tests
Tema1-test-ej1.hs.compilacion.out
Puntaje del ej: 2 / 2



Cases: 1  Tried: 0  Errors: 0  Failures: 0


Cases: 1  Tried: 1  Errors: 0  Failures: 0


Cases: 9  Tried: 0  Errors: 0  Failures: 0

Cases: 9  Tried: 1  Errors: 0  Failures: 0

Cases: 9  Tried: 2  Errors: 0  Failures: 0

Cases: 9  Tried: 3  Errors: 0  Failures: 0

Cases: 9  Tried: 4  Errors: 0  Failures: 0

Cases: 9  Tried: 5  Errors: 0  Failures: 0

Cases: 9  Tried: 6  Errors: 0  Failures: 0

Cases: 9  Tried: 7  Errors: 0  Failures: 0

Cases: 9  Tried: 8  Errors: 0  Failures: 0


Cases: 9  Tried: 9  Errors: 0  Failures: 0

Tema1-test-ej2.hs.compilacion.out
Puntaje del ej: 2 / 2



Cases: 1  Tried: 0  Errors: 0  Failures: 0


Cases: 1  Tried: 1  Errors: 0  Failures: 0


Cases: 9  Tried: 0  Errors: 0  Failures: 0

Cases: 9  Tried: 1  Errors: 0  Failures: 0

Cases: 9  Tried: 2  Errors: 0  Failures: 0

Cases: 9  Tried: 3  Errors: 0  Failures: 0

Cases: 9  Tried: 4  Errors: 0  Failures: 0

Cases: 9  Tried: 5  Errors: 0  Failures: 0

Cases: 9  Tried: 6  Errors: 0  Failures: 0

Cases: 9  Tried: 7  Errors: 0  Failures: 0

Cases: 9  Tried: 8  Errors: 0  Failures: 0


Cases: 9  Tried: 9  Errors: 0  Failures: 0

Tema1-test-ej3.hs.compilacion.out
Puntaje del ej: 2 / 2



Cases: 1  Tried: 0  Errors: 0  Failures: 0


Cases: 1  Tried: 1  Errors: 0  Failures: 0


Cases: 12  Tried: 0  Errors: 0  Failures: 0

Cases: 12  Tried: 1  Errors: 0  Failures: 0

Cases: 12  Tried: 2  Errors: 0  Failures: 0

Cases: 12  Tried: 3  Errors: 0  Failures: 0

Cases: 12  Tried: 4  Errors: 0  Failures: 0

Cases: 12  Tried: 5  Errors: 0  Failures: 0

Cases: 12  Tried: 6  Errors: 0  Failures: 0

Cases: 12  Tried: 7  Errors: 0  Failures: 0

Cases: 12  Tried: 8  Errors: 0  Failures: 0

Cases: 12  Tried: 9  Errors: 0  Failures: 0

Cases: 12  Tried: 10  Errors: 0  Failures: 0

Cases: 12  Tried: 11  Errors: 0  Failures: 0


Cases: 12  Tried: 12  Errors: 0  Failures: 0

Tema1-test-ej4.hs.compilacion.out
Puntaje del ej: 1 / 1



Cases: 1  Tried: 0  Errors: 0  Failures: 0


Cases: 1  Tried: 1  Errors: 0  Failures: 0


Cases: 12  Tried: 0  Errors: 0  Failures: 0

Cases: 12  Tried: 1  Errors: 0  Failures: 0

Cases: 12  Tried: 2  Errors: 0  Failures: 0

Cases: 12  Tried: 3  Errors: 0  Failures: 0

Cases: 12  Tried: 4  Errors: 0  Failures: 0

Cases: 12  Tried: 5  Errors: 0  Failures: 0

Cases: 12  Tried: 6  Errors: 0  Failures: 0

Cases: 12  Tried: 7  Errors: 0  Failures: 0

Cases: 12  Tried: 8  Errors: 0  Failures: 0

Cases: 12  Tried: 9  Errors: 0  Failures: 0

Cases: 12  Tried: 10  Errors: 0  Failures: 0

Cases: 12  Tried: 11  Errors: 0  Failures: 0


Cases: 12  Tried: 12  Errors: 0  Failures: 0

Tema1-test-ej5.hs.compilacion.out
Puntaje del ej: 2.25 / 3



Cases: 1  Tried: 0  Errors: 0  Failures: 0


Cases: 1  Tried: 1  Errors: 0  Failures: 0


Cases: 8  Tried: 0  Errors: 0  Failures: 0

Cases: 8  Tried: 1  Errors: 0  Failures: 0

Cases: 8  Tried: 2  Errors: 0  Failures: 0


### Error in:   2: lista con empate
Solucion.hs:(52,1)-(56,63): Non-exhaustive patterns in function maximoCambios



Cases: 8  Tried: 3  Errors: 1  Failures: 0

Cases: 8  Tried: 4  Errors: 1  Failures: 0

Cases: 8  Tried: 5  Errors: 1  Failures: 0


### Error in:   5: lista sin elemento con minuscula con empate
Solucion.hs:(52,1)-(56,63): Non-exhaustive patterns in function maximoCambios



Cases: 8  Tried: 6  Errors: 2  Failures: 0

Cases: 8  Tried: 7  Errors: 2  Failures: 0


Cases: 8  Tried: 8  Errors: 2  Failures: 0

FIN-}
--GUIA 2 ESPECIFICACIÓN, HAGO LOS ALGORITMOS PARA PRACTICAR--

{-Ejercicio 1. Dadas las siguientes especificaciones, dar valores de entrada y salida que cumplan con los requiere y asegura {-HAGO LAS FUNCIONES PARA PRACTICAR-}
respectivamente:
a) problema duplicar (x: Z) : Z {
requiere: {True}
asegura: {resultado es el doble de x}-}
duplicar :: Integer -> Integer
duplicar x = x + x
{-b) problema raizCuadrada (x: Z) : R {
requiere: {x es positivo}
asegura: {resultado es la ra´ız cuadrada de x}
-}
raizCuadrada :: (Floating a)=>a -> a    {-no se porque hay q usar este floating con la raíz cuadrada-}
raizCuadrada x = (sqrt x)
{-c) problema enteroMasCercanoPositivo (x: R) : Z {
requiere: {True}
asegura: {resultado es el entero m´as cercano de x}
asegura: {resultado es positivo}
-}
enteroMasCercanoPositivo :: Float -> Int          {-ceiling= da el mayor más cercano
                                                    floor= da el menor más cercano  -}
enteroMasCercanoPositivo x |x<=0 =1
                           |otherwise = round x
{-d) problema raicesCuadradasUno (s: seq⟨Z⟩) : seq⟨R⟩ {
requiere: {Todos los elementos de s son positivos}
requiere: {No hay elementos repetidos en s}
asegura: {resultado tiene la misma cantidad de elementos que s}
asegura: {Los elementos de resultado son la salida de aplicar el problema raizCuadrada() a todos los elementos de
la secuencia s}
asegura: {El orden de la secuencia resultado es el mismo que en la secuencia s}
-}
raicesCuadradasUno::(Floating a)=>[a] ->[a]
raicesCuadradasUno [] = []
raicesCuadradasUno (x:xs) = (sqrt x) : (raicesCuadradasUno xs)
{-e) problema raicesCuadradasDos (s: seq⟨Z⟩) : seq⟨R⟩ {                         ESTE PROBLEMA ES LO MISMO NADA MÁS QUE NO ASEGURA EL ORDEN, POR ENDE AL NO ESPECIFICAR
requiere: {Todos los elementos de s son positivos}                             UNO PUEDE HACER LO QUE QUIERE POR LO QUE SERÍA VÁLIDA LA ANTERIOR RESOLUCIÓN
requiere: {No hay elementos repetidos en s}
asegura: {resultado tiene la misma cantidad de elementos que s}
asegura: {Los elementos de resultado son la salida de aplicar el problema raizCuadrada() a todos los elementos de
la secuencia s}

f) problema raicesCuadradasTres (s: seq⟨Z⟩) : seq⟨R⟩    ESTE PROBLEMA ES LO MISMO NADA MÁS QUE NO ASEGURA HACER LA RAÍZ DE TODOS, NI SU ORDEN, POR ENDE AL NO ESPECIFICAR
requiere: {Todos los elementos de s son positivos}                           UNO PUEDE HACER LO QUE QUIERE POR LO QUE SERÍA VÁLIDA LA ANTERIOR RESOLUCIÓN
requiere: {No hay elementos repetidos en s}
asegura: {resultado tiene la misma cantidad de elementos que s}
asegura: {Los elementos de resultado son la salida de aplicar el problema raizCuadrada() a uno o varios elementos
de la secuencia s}
-}
raicesCuadradasTres:: (Floating a,Eq a,Ord a)=>[a]->[a]
raicesCuadradasTres []=[]
raicesCuadradasTres (x:xs) | (log x > 2) = (sqrt x) : (raicesCuadradasTres xs)
                           |otherwise = x: raicesCuadradasTres xs
{-g) problema raicesCuadradasCuatro (s: seq⟨Z⟩) : seq⟨R⟩ {
requiere: {Existen elementos de s que son positivos}
requiere: {No hay elementos repetidos en s}
asegura: {Los elementos de resultado son la salida de aplicar el problema raizCuadrada() a todos los elementos de s
que son positivos}
-}
raicesCuadradasCuatro:: (Floating a,Ord a)=>[a]->[a]
raicesCuadradasCuatro [] = []
raicesCuadradasCuatro (x:xs)  |x>0 = sqrt x: raicesCuadradasCuatro xs
                              | otherwise = raicesCuadradasCuatro xs
{-h) problema raicesCuadradasCinco (s: seq⟨Z⟩) : seq⟨R⟩ {               ES COMO EL PRIMERO
requiere: {Todos los elementos de s son positivos} 
asegura: {Cada posici´on de resultado es la salida de aplicar raizCuadrada() a cada elemento que se encuentra en esa
posici´on en s}
i) problema raicesCuadradasSeis (s: seq⟨Z⟩) : seq⟨R⟩ {
requiere: {Todos los elementos de s son positivos}                  ES COMO EL PRIMERO
asegura: {La longitud de resultado es como m´aximo la misma que s}
asegura: {Cada posici´on de resultado es la salida de aplicar raizCuadrada() a cada elemento que se encuentra en esa
posici´on en s}
-}
{-Ejercicio 3. Responder las preguntas dada la siguiente especificaci´on para el problema de ordenar una secuencia de enteros (es
decir, dada una secuencia de enteros, devolver los mismos elementos ordenados de menor a mayor):
problema ordenar (s: seq⟨Z⟩) : seq⟨Z⟩ {
requiere: {True}
asegura: {resultado es una secuencia en la cual cada elemento es estrictamente mayor que el anterior-}
{--minimo::(Eq a,Ord a)=>[a]->a
minimo []= 0
minimo (x:y:xs) | x<y && minimo
              | otherwise = minimo xs  -}

{-compararConResto :: (Ord a) => [a] -> Bool
compararConResto [] = True  -- Lista vacía, no hay nada para comparar
compararConResto [_] = True  -- Lista con un solo elemento, trivialmente cierto
compararConResto (x:xs) = comparaConRestoElemento x xs

comparaConRestoElemento :: (Ord a) => a -> [a] -> Bool
comparaConRestoElemento _ [] = True  -- Si la lista está vacía, siempre es cierto
comparaConRestoElemento x (y:ys) = x <= y && comparaConRestoElemento x ys
-}----estas dos funciones son como (minimum) pero las hizo chat gpt
ordernar ::(Ord a)=>[a]->[a]
ordernar [] = []
ordenar (x:y:xs) 
    |(minimum (x:y:xs) )== x = x : ordenar (y:xs)
    |(minimum (x:y:xs) )/= y = y: ordenar xs ++ [x] 
    |otherwise = ordenar xs ++ [x]

ordenar_2 ::(Ord a)=>[a]->[a]
ordenar_2 []=[]
ordenar_2 (x:xs) 
    |minimum (x:xs) == x = x : ordenar_2 xs
    |minimum (x:xs) /=x =  ordenar_2 (xs) ++[x]
{-no puedo hacer esta funcion, volver a intentar cuando haya terminado todos los ejercicios-}
{-Ejercicio 4. Se desea especificar el problema de duplicar todos los valores de la secuencia y se cuenta con la siguiente especificaci´on:
problema duplicarTodos (s: seq⟨Z⟩) : seq⟨Z⟩ {
requiere: {True}
asegura: {resultado tiene la misma cantidad de elementos que s}
-}
duplicarTodos:: [Float]->[Float]
duplicarTodos []=[]
duplicarTodos (x:xs) = x*2 : duplicarTodos xs
{-Ejercicio 6. T´ıtulo: Control de Notas en el Departamento de Ciencias
En el prestigioso Departamento de Ciencias de una reconocida universidad, un grupo de alumnos se ha embarcado en su
jornada acad´emica, cursando diversas materias bajo el cuidadoso seguimiento del cuerpo docente. En este departamento, cada
alumno ha sido registrado con su respectivo nombre y apellido, asegur´andose de que no existan duplicados.
La informaci´on relevante de las cursadas de los estudiantes se encuentra almacenada en un sistema que contiene una secuencia
de tuplas en formato (materia, nota obtenida). Las notas se encuentran en un rango de calificaciones entre 0 y 10.
El Departamento ha establecido una pol´ıtica de aprobaci´on y recursado que dicta que si un alumno aprueba una materia con
una nota igual o superior a 4, no deber´a volver a cursarla, quedando esta materia registrada como aprobada en su expediente
acad´emico. Sin embargo, si no logra alcanzar la nota m´ınima de aprobaci´on, tendr´a la posibilidad de recursar la materia en un
futuro intento.
Adem´as existe en el sistema una estructura de datos llamada “NotasDelDc” que contendr´a la informaci´on relevante de los
alumnos y sus cursadas. Esta estructura es una secuencia de tuplas en el formato (Alumno × Cursada), donde “Alumno” es el
nombre y apellido del estudiante y “Cursada” es la secuencia de tuplas mencionada m´as arriba.
Considerando lo mencionado, se pide especificar lo siguiente:
-}
notas::(String,String)->(String,Int) -> Bool
notas (" ", " ") (" ", _)  = False
notas (nombre,apellido)(materia,calificacion) 
    |calificacion>= 4 = True
    |otherwise = False
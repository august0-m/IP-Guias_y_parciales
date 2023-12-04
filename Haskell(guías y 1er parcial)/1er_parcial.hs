--1er parcial que rendí
{-Parcial - tema2
Nota: 1.9 / 10.0 (DESAPROBADO)

puntaje ej1: 0.2
puntaje ej2: 0.6
puntaje ej3: 0.6
puntaje ej4: 0.5
Datos del alumno
Nombre: --

LU: --

Enunciado
Introducción a la Programación
Primer Parcial - Turno Mañana
El parcial se aprueba con 6 puntos
Podrás utilizar las siguientes funciones del prelude
Listas: head, tail, last, init, length, elem, ++
Tuplas: fst, snd
Operaciones lógicas: &&, ||, not
Constructores de listas: (x:xs), []
Constructores de tuplas: (x,y)
Si querés utilizar Hunit para testear tu código acá tenés un script de ejemplo.
Viva la democracia:

La elección periódica de los gobernantes es la base de los Estados Modernos. Este sistema, denominado "democracia" (término proveniente de la antigua Grecia),
 tiene diferentes variaciones, que incluyen diferentes formas de elección del/a máximo/a mandatario/a. Por ejemplo, en algunos países se eligen representantes 
 en un colegio electoral (EEUU). En otros se vota a los/as miembros del parlamento (España). En nuestro país elegimos de forma directa la fórmula presidencial (Presidente/a y Vicepresidente/a) 
 cada 4 años.

A continuación presentamos una serie de ejercicios que tienen como objetivo implementar funciones para sistema de escrutinio de una elección presidencial. 
Leer las descripciones y especificaciones e implementar las funciones requeridas en Haskell, utilizado sóĺamente las herramientas vistas en clase.

Las fórmulas presidenciales serán representadas por tuplas (String x String), donde la primera componente será el nombre del candidato a presidente,
 y la segunda componente será el nombre del candidato a vicepresidente.

En los problemas en los cuales se reciban como parámetro secuencias de fórmulas y votos, cada posición de la lista votos representará la cantidad de votos obtenidos por
 la fórmula del parámetro formulas en esa misma posición. Por ejemplo, si la lista de fórmulas es [("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] 
 y la lista de votos fuera [34, 56], eso indicaría que la fórmula encabezada por María Montero obtuvo 56 votos, y la lista encabezada por Juan Pérez obtuvo 34 votos.
-}
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
{-1) Porcentaje de Votos Afirmativos [1 punto]
problema porcentajeDeVotosAfirmativos (formulas: seq⟨String x String⟩,votos:seq< Z >, cantTotalVotos: Z) : R {
  requiere: {¬formulasInvalidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {La suma de todos los elementos de votos es menor o igual a cantTotalVotos}
  asegura: {res es el porcentaje de votos no blancos (es decir, asociados a alguna de las fórmulas) sobre el total de votos emitidos}
}
Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la división entre dos números de tipo Int:

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)
-}
-- Ejercicio 1
porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int  -> Float
porcentajeDeVotosAfirmativos _ _ _ = 0
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
{-
2) Formulas Inválidas [3 puntos]
problema formulasInvalidas (formulas: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> formulas contiene un candidato se propone para presidente y vicepresidente en la misma fórmula;
   o algún candidato se postula para presidente o vice en más de una fórmula }-}
-- Ejercicio 2
formulasInvalidas :: [(String, String)] -> Bool
formulasInvalidas [] = False
formulasInvalidas (x:y:xs) | fst x == fst y && snd x == snd y = True
                           | pertenece (x:y:xs) = True
                           | otherwise = formulasInvalidas (y:xs)
pertenece :: [(String,String)] -> Bool
pertenece    [] = False
pertenece  (x:y:xs)  | fst x == fst y   || fst x == snd y  =  True
                     | snd x == fst y   || snd x == snd y  =  True
                     | pertenece (x:xs) || pertenece (y:xs) = True
                     | otherwise = False
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
{-3) Porcentaje de Votos [3 puntos]
problema porcentajeDeVotos (vice: String, formulas: seq⟨String x String⟩,votos:seq< Z >) : R {
  requiere: {La segunda componente de algún elemento de formulas es vice}
  requiere: {¬formulasInvalidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {Hay al menos un elemento de votos mayores estricto a 0}
  asegura: {res es el porcentaje de votos que obtuvo vice sobre el total de votos afirmativos}
}

Para resolver este ejercicio pueden utilizar la función division presentada en el Ejercicio 1.
-}
-- Ejercicio 3
porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos _ _ _ = 0.0
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
{-4) Menos Votado [3 puntos]
problema menosVotado (formulas: seq⟨String x String⟩, votos:seq< Z >) : String {
  requiere: {¬formulasInvalidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {Hay al menos un elemento de votos mayores estricto a 0}
  requiere: {|formulas| > 0}
  asegura: {res es el candidato a presidente de formulas menos votado de acuerdo a los votos contabilizados en votos}
-}
-- Ejercicio 4
menosVotado :: [(String, String)] -> [Int] -> String
menosVotado [(x,y)] _ = x
menosVotado [x:y:xs] [z] | asignarVotos x>= asignarVotos y = head x
                         | otherwise = menosVotado (y:xs) [z]

asignarVotos :: [(String,String)] -> [Int] -> Int
asignarVotos [(x,y)] _ = 0
{-Ejecucion de los tests
Tema2-test-ej1.hs.compilacion.out
Puntaje del ej: 0.2 / 1


### Failure in: 3: sin votos en blanco
Tema2-test-ej1.hs:50
expected any of: [100.0,1.0]
 but got: 0.0

### Failure in: 4: un solo voto en blanco
Tema2-test-ej1.hs:50
expected any of: [93.75,0.9375]
 but got: 0.0

### Failure in: 5: 7 votos en blanco
Tema2-test-ej1.hs:50
expected any of: [68.181816,0.6818182]
 but got: 0.0

### Failure in: 7: una formula con cero votos
Tema2-test-ej1.hs:50
expected any of: [100.0,1.0]
 but got: 0.0

### Failure in: 8: ultima formula con cero votos
Tema2-test-ej1.hs:50
expected any of: [83.33333,0.8333333]
 but got: 0.0

### Failure in: 9: ultima formula con cero votos muchos votos en blanco
Tema2-test-ej1.hs:50
expected any of: [10.0,0.1]
 but got: 0.0

Cases: 10  Tried: 10  Errors: 0  Failures: 6

Tema2-test-ej2.hs.compilacion.out
Puntaje del ej: 0.6 / 3


### Error in:   2: 1 formula valida 
Solucion.hs:(10,1)-(13,65): Non-exhaustive patterns in function formulasInvalidas


### Error in:   3: 1 formula valida II 
Solucion.hs:(10,1)-(13,65): Non-exhaustive patterns in function formulasInvalidas


### Error in:   4: 1 formula invalida 
Solucion.hs:(10,1)-(13,65): Non-exhaustive patterns in function formulasInvalidas


### Error in:   5: 2 formulas validas I 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   6: 2 formulas validas II
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   7: 2 formulas validas III
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   8: 2 formulas validas IV
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   9: 2 formulas validas V 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   10: 2 formulas validas VI
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   11: 2 formulas validas VII
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   12: 2 formulas validas VIII
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   13: 3 formulas validas I 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   14: 3 formulas validas II
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   15: 3 formulas validas III
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   16: 3 formulas validas IV
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   17: 3 formulas validas V
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   18: 3 formulas validas VI
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   19: 5 formulas validas 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   20: 5 formulas validas II
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   21: 5 formulas validas III
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   22: primera formula invalida 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   23: cuarta formula invalida 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   24: ultima formula invalida 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   25: varias formulas invalidas 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   28: mismo presidente f3 y f4 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   29: mismo presidente f2 y f5 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   32: mismo vice f3 y f4 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   33: mismo vice f2 y f5 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   38: presi f3 vice f4 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   39: vice f3 presi f4 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   40: presi f2 vice f5 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   41: vice f2 presi f5 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   42: formula repetida f1 f2 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   43: formula repetida f3 f4 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   44: formula repetida f2 f5 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   46: formula flipeada f3 f4 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


### Error in:   47: formula flipeada f2 f5 
Solucion.hs:(15,1)-(19,40): Non-exhaustive patterns in function pertenece


Cases: 49  Tried: 49  Errors: 37  Failures: 0

Tema2-test-ej3.hs.compilacion.out
Puntaje del ej: 0.6 / 3


### Failure in: 1:"15:30 primero"
Tema2-test-ej3.hs:61
expected any of: [50.0,0.5]
 but got: 0.0

### Failure in: 2:"5:30 medio"
Tema2-test-ej3.hs:61
expected any of: [16.666668,0.16666667]
 but got: 0.0

### Failure in: 3:"10:30 ultimo"
Tema2-test-ej3.hs:61
expected any of: [33.333336,0.33333334]
 but got: 0.0

### Failure in: 5:"5:20 medio"
Tema2-test-ej3.hs:61
expected any of: [25.0,0.25]
 but got: 0.0

### Failure in: 6:"1:1 primero"
Tema2-test-ej3.hs:61
expected any of: [100.0,1.0]
 but got: 0.0

### Failure in: 7:"1:1 medio"
Tema2-test-ej3.hs:61
expected any of: [100.0,1.0]
 but got: 0.0

### Failure in: 8:"1:1 ultimo"
Tema2-test-ej3.hs:61
expected any of: [100.0,1.0]
 but got: 0.0

### Failure in: 10:"18:18 medio"
Tema2-test-ej3.hs:61
expected any of: [100.0,1.0]
 but got: 0.0

### Failure in: 11:"15:45 ultimo"
Tema2-test-ej3.hs:61
expected any of: [33.333336,0.33333334]
 but got: 0.0

### Failure in: 12:unica formula 1 voto
Tema2-test-ej3.hs:61
expected any of: [100.0,1.0]
 but got: 0.0

### Failure in: 13:unica formula 17 votos
Tema2-test-ej3.hs:61
expected any of: [100.0,1.0]
 but got: 0.0

### Failure in: 14:unica formula 537 votos
Tema2-test-ej3.hs:61
expected any of: [100.0,1.0]
 but got: 0.0

### Failure in: 15:conVariosVotos1
Tema2-test-ej3.hs:61
expected any of: [1.529052,1.529052e-2]
 but got: 0.0

### Failure in: 17:conVariosVotos3
Tema2-test-ej3.hs:61
expected any of: [3.82263,3.82263e-2]
 but got: 0.0

Cases: 18  Tried: 18  Errors: 0  Failures: 14

Tema2-test-ej4.hs.compilacion.out
Puntaje del ej: 0.5 / 3


### Error in:   3:el primero
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   4:el segundo
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   5:el ultimo
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   6:el primero con cero
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   7:el segundo con cero
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   8:el ultimo con cero
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   9:empate 2-3
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   10:empate 1-3
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   11:empate 1-2
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   12:empate con ceros 2-3
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   13:empate con ceros 1-3
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   14:empate con ceros 1-2
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   15:empateEntreTres
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   16:sieteFormulas sin empate
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


### Error in:   17:sieteFormulas con empate entre tres
Solucion.hs:(27,1)-(29,61): Non-exhaustive patterns in function menosVotado


Cases: 18  Tried: 18  Errors: 15  Failures: 0

FIN-}
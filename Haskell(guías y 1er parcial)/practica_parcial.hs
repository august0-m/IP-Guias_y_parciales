--1 ER PARCIAL 4  MODELOS,1 ERO CON 2BLE RESOLUCIÓN
{-Introducción a la Programación
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
 tiene diferentes variaciones, que incluyen diferentes formas de elección del/a máximo/a mandatario/a. Por ejemplo, en algunos países se eligen representantes en un colegio electoral (EEUU).
 En otros se vota a los/as miembros del parlamento (España). En nuestro país elegimos de forma directa la fórmula presidencial (Presidente/a y Vicepresidente/a) cada 4 años.
A continuación presentamos una serie de ejercicios que tienen como objetivo implementar funciones para sistema de escrutinio de una elección presidencial.
 Leer las descripciones y especificaciones e implementar las funciones requeridas en Haskell, utilizado sóĺamente las herramientas vistas en clase.
Las fórmulas presidenciales serán representadas por tuplas (String x String), donde la primera componente será el nombre del candidato a presidente, y la segunda componente será 
el nombre del candidato a vicepresidente.
En los problemas en los cuales se reciban como parámetro secuencias de fórmulas y votos, cada posición de la lista votos representará la cantidad de votos obtenidos
 por la fórmula del parámetro formulas en esa misma posición. Por ejemplo, si la lista de fórmulas es [("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] y 
 la lista de votos fuera [34, 56], eso indicaría que la fórmula encabezada por María Montero obtuvo 56 votos, y la lista encabezada por Juan Pérez obtuvo 34 votos.-}
{-1) Votos en Blanco [1 punto]
problema votosEnBlanco (formulas: seq⟨String x String⟩,votos:seq< Z >, cantTotalVotos: Z) : Z {
  requiere: {formulasValidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {La suma de todos los elementos de votos es menor o igual a cantTotalVotos}
  asegura: {res es la cantidad de votos emitidos que no correspondieron a niguna de las fórmulas que se presentaron}
}-}
elementos_mayores_a_cero :: [Int] -> Bool
elementos_mayores_a_cero [] = True
elementos_mayores_a_cero (x:xs)
  |x>0 = elementos_mayores_a_cero xs
  |otherwise = False
suma_elementos :: [Int] -> Int
suma_elementos [] = 0
suma_elementos (x:xs)
  =x +  suma_elementos xs
longitud_para_integer :: [Int] -> Int
longitud_para_integer [] = 0
longitud_para_integer (x:xs)
  = 1 + longitud_para_integer xs
votosEnBlanco :: [(String, String)] -> [Int] -> Int  -> Int
votosEnBlanco (x) (n) w
  |formulasValidas (x) && elementos_mayores_a_cero(n) && longitud_formulas(x) == longitud_para_integer (n) && suma_elementos(n)<= w = w - suma_elementos(n) 
  |otherwise = -1
-- Ejercicio 2
{-2) Formulas Válidas [3 puntos]
problema formulasValidas (formulas: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> formulas no contiene nombres repetidos, es decir que cada candidato está en una única fórmula 
  (no se puede ser candidato a presidente y a vicepresidente ni en la misma fórmula ni en fórmulas distintas)}
}-}
longitud_formulas :: [(String,String)] -> Int -- al pedo
longitud_formulas [] = 0
longitud_formulas (x:xs)
  =1 +longitud_formulas xs
formulasValidas_aux :: [(String, String)] -> Bool
formulasValidas_aux [] = False
formulasValidas_aux [(x,y)]
  | x==y =False 
  |otherwise = True
formulasValidas_aux ((x,y):(a,b):xs)
  |x/=y && x/=a && x/=b && y/=a && y/=b && a/=b = formulasValidas_aux ((x,y):xs)
  |otherwise = False
 --   |longitud (x:y:xs) == 2 && fst x/=snd x && fst y/=snd y &&  fst x /=fst y && fst x/=snd y && snd x/=fst y && snd x/=snd y = True         --justo había perdido independiente, no estaba concentrado
--    |longitud (x:y:xs) == 2 && not (fst x/=snd x && fst y/=snd y &&  fst x /=fst y && fst x/=snd y && snd x/=fst y && snd x/=snd y) = False
 --   |longitud (x:y:xs) > 2 &&  fst x/=snd x && fst y/=snd y &&  fst x /=fst y && fst x/=snd y && snd x/=fst y && snd x/=snd y) = False
  --  |otherwise =  formulasValidas_aux (x:xs)
{-
formulasValidas_aux ((x,y):(a,b):xs)
    |longitud((x,y):(a,b):xs) ==2 && (x,y) /= (a,b) && (x,y) /= (b,a) = True
    |longitud((x,y):(a,b):xs) ==2 && not ((x,y) /= (a,b) && (x,y) /= (b,a)) = False
    |longitud((x,y):(a,b):xs) >2 && (x,y) /= (a,b) && (x,y) /= (b,a) = formulasValidas_aux  ((x,y):xs)
    |otherwise = False
-}
formulasValidas :: [(String, String)] -> Bool
formulasValidas [(x,y)] = x/=y
formulasValidas (x:xs)
  | formulasValidas_aux (x:xs) = formulasValidas xs
  |otherwise = False
{-
    |longitud(x:y:xs) == 2 && formulasValidas (x:y:xs) == True = True
    |longitud(x:y:xs) == 2 && formulasValidas (x:y:xs) /= True = False
    |longitud(x:y:xs) > 2 && formulasValidas_aux (x:y:xs) == True = formulasValidas (y:xs)
    |otherwise = False
-}
-- Ejercicio 3
{-3) Porcentaje de Votos [3 puntos]
problema porcentajeDeVotos (presidente: String, formulas: seq⟨String x String⟩,votos:seq< Z >) : R {
  requiere: {La primera componente de algún elemento de formulas es presidente}
  requiere: {formulasValidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {Hay al menos un elemento de votos que es mayor que estricto que 0}
  asegura: {res es el porcentaje de votos que obtuvo la fórmula encabezada por presidente sobre el total de votos afirmativos}
}

Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la división entre dos números de tipo Int:

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)
-}
presidente_en_candidatos :: String -> [(String,String)] -> Bool
presidente_en_candidatos x [] = False
presidente_en_candidatos presi ((x,y):xs)
  |presi /= x = presidente_en_candidatos presi xs
  |otherwise = True
encuentra_al_presidente :: String -> [(String,String)] -> Int
encuentra_al_presidente _ [] = 0
encuentra_al_presidente presi ((x,y):xs)
  |presi /=x = 1+ encuentra_al_presidente presi (xs)
  |otherwise = 1
saca_el_ultimo :: [Int] -> [Int]
saca_el_ultimo [] = []
saca_el_ultimo (x:xs)
  |longitud_para_integer (x:xs) > 1 = x : saca_el_ultimo xs
  |longitud_para_integer (x:xs) == 1 = []
dame_el_ultimo :: [Int] -> Int
dame_el_ultimo [] = 0
dame_el_ultimo (x:xs)
  |longitud_para_integer (x:xs) > 1 =  dame_el_ultimo xs
  |otherwise = x
da_enesimo ::  Int -> [Int] -> Int
da_enesimo n (x:xs)
  |longitud_para_integer(x:xs)== n = dame_el_ultimo (x:xs)
  |longitud_para_integer(x:xs)>n = da_enesimo n (saca_el_ultimo(x:xs))
porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float  --si le das numeros exagerademente grandes a algun candidato lo rompe, puse q cumpla los requiere para practicar pero no es nesesario
porcentajeDeVotos presidente (x:xs) (n) 
  |formulasValidas(x:xs) && elementos_mayores_a_cero(n) && presidente_en_candidatos presidente (x:xs) && longitud_formulas(x:xs)==longitud_para_integer(n) =fromIntegral ((da_enesimo(encuentra_al_presidente presidente (x:xs)) (n)) * 100)   / fromIntegral (suma_elementos (n))
  |otherwise = -1
  -- Ejercicio 4
{-4) Próximo Presidente [3 puntos]
problema proximoPresidente (formulas: seq⟨String x String⟩, votos:seq< Z >) : String {
  requiere: {formulasValidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {Hay al menos un elemento de votos mayores estricto a 0}
  requiere: {|formulas| > 0}
  asegura: {res es el candidato a presidente de formulas más votado de acuerdo a los votos contabilizados en votos}
}-}
da_mas_grande :: [Int] -> Int
da_mas_grande [] = 0
da_mas_grande [x] = x
da_mas_grande (x:y:xs)
  |x>=y = da_mas_grande (x:xs)
  |otherwise = da_mas_grande (y:xs) 
da_pos_grande ::Int -> [Int] -> Int
da_pos_grande _ [] = 0
da_pos_grande g (x:xs)
  |g /= x = 1 + da_pos_grande g xs
  |otherwise = 1
dame_el_ultimo_presi :: [(String,String)] -> String
dame_el_ultimo_presi [] = ""
dame_el_ultimo_presi ((x,y):xs)
  |longitud_formulas((x,y):xs) == 1 = x
  |otherwise = dame_el_ultimo_presi xs
saca_el_ultimo_presi :: [(String,String)] -> [(String,String)]
saca_el_ultimo_presi [] = []
saca_el_ultimo_presi ((x,y):xs)
  |longitud_formulas((x,y):xs)>1 = (x,y) : saca_el_ultimo_presi xs
  |otherwise = []
da_x_presidente :: Int -> [(String,String)] -> String
da_x_presidente _ [] = " "
da_x_presidente x ((a,b):xs)
  |longitud_formulas((a,b):xs) == x = dame_el_ultimo_presi((a,b):xs)
  |longitud_formulas((a,b):xs) > x = da_x_presidente x (saca_el_ultimo_presi((a,b):xs))

proximoPresidente :: [(String, String)] -> [Int] -> String
proximoPresidente presidentes votos
  = da_x_presidente(da_pos_grande(da_mas_grande(votos))votos) presidentes


------------------------------------------------------------------------------------------------------------------resolución del campus
{-
-- Ejercicio 1
votosEnBlanco :: [(String, String)] -> [Int] -> Int  -> Int
votosEnBlanco _ votos cantTotalVotos = cantTotalVotos - (votosAfirmativos votos)

votosAfirmativos :: [Int] -> Int
votosAfirmativos [] = 0
votosAfirmativos (v:vs) = v + (votosAfirmativos vs) 

-- Ejercicio 2
formulasValidas :: [(String, String)] -> Bool
formulasValidas [] = True
formulasValidas (f:fs) = fst f /= snd f && not (estaEnFormulas (fst f) fs) && not (estaEnFormulas (snd f) fs) && (formulasValidas fs)

estaEnFormulas :: String -> [(String, String)] -> Bool
estaEnFormulas _ [] = False
estaEnFormulas c (f:fs) | c == (fst f) = True
                        | c == (snd f) = True
                        | otherwise = estaEnFormulas c fs

-- = c == (fst f) || c == (snd f) || estaEnFormulas c fs

-- Ejercicio 3
division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos presi fs votos = division (contarVotos presi fs votos) (votosAfirmativos votos)

contarVotos :: String -> [(String, String)] -> [Int] -> Int
contarVotos presi [f] [v] = v
contarVotos presi (f:fs) (v:vs) | presi == fst f = v
                                | otherwise = contarVotos presi fs vs

-- Ejercicio 4
proximoPresidente :: [(String, String)] -> [Int] -> String
proximoPresidente [(presi,_)] _ = presi
proximoPresidente (f1:f2:fs) (v1:v2:vs) | v1 >= v2 = proximoPresidente (f1:fs) (v1:vs)
                                        | otherwise = proximoPresidente (f2:fs) (v2:vs)
  -}

------------------------------------------------------------------------------------------------------------------------------------------------2DO MODELO PARCIAL
{-
En los problemas en los cuales se reciban como parámetro secuencias de fórmulas y votos, cada posición de la lista votos representará
 la cantidad de votos obtenidos por la fórmula del parámetro formulas en esa misma posición. Por ejemplo, si la lista de fórmulas es 
 [("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] y la lista de votos fuera [34, 56],
  eso indicaría que la fórmula encabezada por María Montero obtuvo 56 votos, y la lista encabezada por Juan Pérez obtuvo 34 votos.

Se pueden usar las siguientes funciones del preludio:
	- Listas: head, tail, last, init, length, elem, ++
	- Tuplas: fst, snd
	- Operaciones Lógicas: &&, ||, not
	- Constructores de listas: (x:xs), []
	- Constructores de tuplas: (x, y)
-}
-----------------------------------------------------------------------------------------------------------------------------------------------
{-
1) Porcentaje de Votos Afirmativos [1 punto]
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

-----------------------------------------------------------------------------------------------------------------------------------------------
{-
2) Formulas Inválidas [3 puntos]
problema formulasInvalidas (formulas: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> formulas contiene un candidato se propone para presidente y vicepresidente en la misma fórmula; 
  o algún candidato se postula para presidente o vice en más de una fórmula -}
-----------------------------------------------------------------------------------------------------------------------------------------------
{-
3) Porcentaje de Votos [3 puntos]
problema porcentajeDeVotos (vice: String, formulas: seq⟨String x String⟩,votos:seq< Z >) : R {
  requiere: {La segunda componente de algún elemento de formulas es vice}
  requiere: {¬formulasInvalidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {Hay al menos un elemento de votos mayores estricto a 0}
  asegura: {res es el porcentaje de votos que obtuvo vice sobre el total de votos afirmativos} }

Para resolver este ejercicio pueden utilizar la función division presentada en el Ejercicio 1.-}
-----------------------------------------------------------------------------------------------------------------------------------------------
{-
4) Menos Votado [3 puntos]
problema menosVotado (formulas: seq⟨String x String⟩, votos:seq< Z >) : String {
  requiere: {¬formulasInvalidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {Hay al menos un elemento de votos mayores estricto a 0}
  requiere: {|formulas| > 0}
  asegura: {res es el candidato a presidente de formulas menos votado de acuerdo a los votos contabilizados en votos}
-}
{-
-----------------------------------------------------------------------------------------------------------------------------------------------3ER MODELO PARCIAL
(• Podrás utilizar las siguientes funciones del prelude
• Listas: head, tail, last, init, length, elem, ++
• Tuplas: fst, snd
• Operaciones lógicas: &&, ||, not
• Constructores de listas: (x:xs), []
• Constructores de tuplas: (x,y)
• Si querés utilizar Hunit para testear tu código acá tenés un script de ejemplo.
En los problemas en los cuales se reciban como parámetros secuencias goleadoresPorEquipo y goles, cada posición de la lista goles representará 
la cantidad de goles obtenidos por el goleador del equipo que se encuentra en en esa misma posición de goleadoresPorEquipo. 
Por ejemplo, si la lista goleadoresPorEquipo es [("Sacachispas","Robertino Giacomini"), ("Fénix","Matías Domínguez")] y la lista goles es [3, 5], 
eso indica que Robertino Giacomini metió 3 goles, y Matías Domínguez 5.
-}
-----------------------------------------------------------------------------------------------------------------------------------------------
{-
1) Goles de no goleadores [1 punto]
problema golesDeNoGoleadores (goleadoresPorEquipo: seq<String x String>,goles:seq<Z >, total Goles Torneo: Z): Z{
	requiere: {equipos Validos(goleadoresPorEquipo)}
	requiere: {goleadoresPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {La suma de todos los elementos de goles es menor o igual a total Goles Torneo}
	asegura:  {res es la cantidad de goles convertidos en el torneo por jugadores que no son los goleadores de sus equipos}
  -- Ejercicio 1-}
suma_goles :: [Int] -> Int
suma_goles [] = 0
suma_goles (x:xs) 
  =x + suma_goles xs
golesDeNoGoleadores :: [(String, String)] -> [Int] -> Int -> Int 
golesDeNoGoleadores _ x y 
  =  y - suma_goles x
-----------------------------------------------------------------------------------------------------------------------------------------------
{-
2) Equipos Válidos [3 puntos]
problema equiposValidos (goleadoresPorEquipo: seq<String x String>): Bool {
	requiere: {True}
	asegura: {(res = true) <=> goleadoresPorEquipo no contiene nombres de clubes repetidos, ni goleadores repetidos, ni jugadores con nombre de club}
  -- Ejercicio 2-}
cantidad_palabras :: String -> Integer
cantidad_palabras [] = 1
cantidad_palabras (x:xs)
  |x== ' ' = 1+ cantidad_palabras xs
  |otherwise= cantidad_palabras xs

jugador_con_nombre_de_club :: [(String,String)] -> Bool
jugador_con_nombre_de_club [] = True
jugador_con_nombre_de_club ((x,y):xs)
  |cantidad_palabras x >1 = False
  |otherwise = jugador_con_nombre_de_club xs
no_se_repite ::  [(String,String)] -> Bool
no_se_repite [] = True
no_se_repite ((x,y):(a,b):xs)
  |x/=y && x/=b && x/=a && y/=b && y/=a && a /=b = no_se_repite((x,y):xs)
  |x/=y && x/=b && x/=a && y/=b && y/=a && a /=b && length ((x,y):(a,b):xs) ==1 = True
  |otherwise = False
equiposValidos :: [(String, String)] -> Bool
equiposValidos ((x,y):(a,b):xs) 
  |jugador_con_nombre_de_club((x,y):(a,b):xs) == True && x/=y && x/=b && x/=a && y/=b && y/=a && a /=b = True
-----------------------------------------------------------------------------------------------------------------------------------------------
{-
3) Porcentaje de Goles [3 puntos]
problema porcentajeDeGoles (goleador: String, goleadoresPorEquipo: seq<String x String>,goles:seq< Z >): R {
	requiere: {La segunda componente de algún elemento de goleadoresPorEquipo es goleador}
	requiere: {equipos Validos (goleadoresPorEquipo)}
	requiere: {goleadoresPorEquipo = goles}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {Hay al menos un elemento de goles mayores estricto a 0}
	asegura: {res es el porcentaje de goles que marcó goleador sobre el total de goles convertidos por goleadores}
Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la división entre dos números de tipo Int:
division: Int -> Int -> Float
division a b = (fromIntegral a) (fromIntegral b)

-- Ejercicio 3-}
porcentajeDeGoles :: String -> [(String, String)] -> [Int]-> Float
porcentajeDeGoles _ _ _ = 0
-----------------------------------------------------------------------------------------------------------------------------------------------
{-
4) Botín de Oro [3 puntos]
problema botinDeOro (goleadoresPorEquipo: seq<String x String>, goles:seq< Z>): String {
	requiere: {equipos Validos (goleadoresPorEquipo)}
	requiere: {goleadoresPorEquipo| = |goles]}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {goles >0}
	asegura: {res es alguno de los goleadores de goleadoresPorEquipo que más tantos convirtió de acuerdo a goles}
-- Ejercicio 4-}
botinDeOro :: [(String, String)] -> [Int] -> String
botinDeOro _ _ = ""

--------------------------------------------------------------------------------------------------------------------------------------------4TO MODELO PARCIAL
{-En los problemas en los cuales se reciben como parámetros secuencias arquerosPorEquipo y goles, cada posición de
la lista goles representará la cantidad de goles recibidos por el arquero del equipo que se encuentra en esa misma
posicion de arquerosPorEquipo. Por ejemplo, si la lista arquerosPorEquipo es [("Sacachispas", "Neyder Aragon"),
("Fenix", "Nahuel Galardi")] y la lista de goleses [3, 5], eso indicaría que Neyder Aragon recibió 3 goles, y
Nahuel Galardi 5.

Se pueden usar las siguientes funciones del preludio:
	- Listas: head, tail, last, init, length, elem, ++
	- Tuplas: fst, snd
	- Operaciones Lógicas: &&, ||, not
	- Constructores de listas: (x:xs), []
	- Constructores de tuplas: (x, y)
-}
-----------------------------------------------------------------------------------------------------------------------------------------------
{-
1) Atajaron Suplentes
problema atajaronSuplentes (arquerosPorEquipo: seq<String X String>, goles: seq<Z>, totalGolesTorneo: Z): Z {
	requiere: {equiposValidos(arquerosPorEquipo)
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {La suma de todos los elementos de goles es menor o igual a totalGolesTorneo}
	asegura: {res es la cantidad de goles recibidos en el torneo por arqueros que no son titulares en sus equipos.	}
  -}
-----------------------------------------------------------------------------------------------------------------------------------------------
{-
2) Equipos Válidos
problema equiposValidos (arquerosPorEquipo: seq<String X String>): Bool {
	requiere: {True}
	asegura: {
	(res = True) <=> arquerosPorEquipo no contiene nombres de clubes repetidos, ni arqueros repetidos, ni jugadores con nombre del club
-}
-----------------------------------------------------------------------------------------------------------------------------------------------
{-
3) Porcentaje de goles
problema porcentajeDeGoles (arquero: String, arquerosPorEquipo: seq<String X String>, goles: seq<Z>): R {
	requiere: {La segunda componente de algún elemento de arquerosPorEquipo es arquero}
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {Hay al menos un elemento de goles mayores estricto a 0}
	asegura: {
	res es el porcentaje de goles que recibió arquero sobre el total de goles recibidos por arqueros titulares }

Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como float la división entre dos
numeros de tipo Int.

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b
-}
-----------------------------------------------------------------------------------------------------------------------------------------------
{-
4) Valla Menos Vencida
problema vallaMenosVencida (arquerosPorEquipo: seq<String X String>, goles: seq<Z>): String {
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {|goles| > 0}
	asegura: {res es alguno de los arqueros de arquerosPorEquipo que menor goles recibió de acuerdo a goles }
  -}

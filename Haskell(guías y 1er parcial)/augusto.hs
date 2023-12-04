
{-practica 2
    ej 5 a'frecuencia de bondis'
    problema:cantidadColectivosLinea (bondis:seq<Z>) : Z
    requiere:{bondis pertenece a(28,33,34,37,45, 107,160,166)}
    requiere:{cantidad que veces que aparece bondis en el sistema }
    asegura:{devuelve cantidad de veces linea aparece por bondis}
ej 5 b'compararlineas'
    problema:comprarlineas(L1:Z,L2:z,bondis:seq<z>): Z
    requiere:{bondis pertenece a(28,33,34,37,45, 107,160,166)}
    requiere:{L1 y L2 es alguna linea que pertenece a bondis}
    asegura:{si (cantidadColectivosLinea,L1)>(cantidadColectivosLinea,L2)=L1}
    asegura:{si (cantidadColectivosLinea,L2)>(cantidadColectivosLinea,L1)=L2}
       
Ej 6a'promedio'
     problemapromedioDeAlumno(NotasDelDc:seq⟨Char×Z⟩):R 
    requiere:{NotasDelDc==(Alumno×Cursada), &&Cursada==(materia,notaobtenida)}
    requiere:{usando Cursada, se suman todos los elementos de notaobtenida y se dividen por la suma de los elementos de materia}
    asegura:{resultado= promedio}
    asegura:{promedio es la suma de sus notas dividido por cantidad de materia cursada}
ej 6b ´mayor nota´
    problemaMayorNota
    (NotasDelDc:seq⟨Char×Z⟩):R  
     requiere:{NotasDelDc==(Alumno×Cursada), &&Cursada==(materia,notaobtenida)}
     requiere:{numero mas grande de notaobtenida=MayorNota}
     reguiere:{materia vnculada a MayorNota=resultado}
     asegura:{resultado=materia vinculada a MayorNota}
ej 6b.2 ´listado de notas'
    problemalistadenotas
    requiere:{NotasDelDc==(Alumno×Cursada), &&Cursada==(materia,notaobtenida)}
-}
    
f :: Integer -> Integer
f x |x==1  =8
    |x==4 =131
    |x==16 =16
    |otherwise = 0

b :: Integer -> Integer
b x |x==8  =16
    |x==16 =4
    |x==131 =1
    |otherwise = 0
c :: Integer ->  Integer
c x = f (b x)

absoluto :: Integer -> Integer
absoluto x |x>=0 =x
           |x<0 =x*(-1) 

maximoabsoluto :: Integer -> Integer -> Integer
maximoabsoluto x y |absoluto(x)>absoluto(y)=absoluto(x) 
                |absoluto(y)>absoluto(x)=absoluto(y) 
                    |otherwise=absoluto(y)
maximo3 :: Integer ->  Integer ->   Integer ->  Integer
maximo3 x y z | x > y && x > z = x
              | y > x && y > z = y
              | z > x && z > y = z
algunoEs0 ::   Float -> Float -> Bool
algunoEs0 x y |x==0  =True
              |y==0  =True   
              |otherwise = False
ambosSon0 ::  Float -> Float -> Bool
ambosSon0 x y |x==0   && y==0  =True   
              |otherwise = False
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y |x <= 3 && y <= 3 =True
                   |x > 3 && x <= 7 && y > 3 && y <= 7 =True
                   |x > 7 && y > 7 =True
                   |otherwise = False

sumaDistintos :: Integer -> Integer ->  Integer -> Integer 
sumaDistintos x y z |x==y && y==z =x
                    | x==y = (y+z) 
                    | x==z = (x+y) 
                    |z==y =  (y+x)
                    |otherwise = x+y+z
esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y | mod x y  ==0 = True
                 | otherwise = False

digitoUnidades :: Integer -> Integer
digitoUnidades x | mod x 10

{- rta con chatgpt
digitoUnidades :: Int -> Int
digitoUnidades numero = numero `mod` 10

digitoDecenas :: Int -> Int
digitoDecenas numero = (numero `div` 10) `mod` 10
-}
ej 3


 | todosDistintos (x:xs) == True = (x:xs)
            

import math
import random
import numpy as np
from queue import LifoQueue as pila
from queue import Queue as Cola
# PRIMER CODIGO PYTHON,°!!°""##$%%&%&//77" PREGUNTAR COMO ESCRIBO EL BACKSLAH  o barra inversa
#EJ 1.1
def hola_mundo () :
    print("¡Hola Mundo!")
## 1.2
def imprimir_un_verso ():
    print("Lo saco 'e la liga, lo afronto (y vo' no)"
         '\n' "Fuck eso' trapper' tan tontos (y vo' no)"
         '\n' "Fuck eso' trapper' tan locos (y vo' no)")
##1.3
def raizde2() :
    print("1,4142")
##1.4
def factorial_de_dos ():
    print("4")
##1.5 
def perimetro () :
    return 2*math.pi
#2.1 
def imprimir_saludo (x:str) -> str :
    print("hola " + str(x) )
#2.2
def raiz_cuadrada_de (x:float) -> float :
    return math.sqrt(x)
#2.3 
def farenheit_a_celcius(x:float)-> float :
    return (x -32)* (5/9)
#2.4 preguntar###################################################
def imprimir_dos_veces(x:str) -> str :
      x *=2 
#2.5
def es_multiplo_De (x: int,y: int)-> bool :
    res: bool = x/y == int (x/y)
    return res
    #return (x/y == int(x/y))
    # res:bool = x%y == 0
    # if x%y == 0 :
    #(sigue) return True
    #(sigue) else:
    #(sigue) return False
#2.6 preguntar xq no funciona 1er idea
def es_par (x:int) -> bool :
    res: bool 
    if (es_multiplo_De (x,2)) == True :
        res= True
    else : 
        res= False
    #res= es_multiplo_De (x,2)
    return res
#2.7 
def cantidad_de_pizzas(comensales:int, min_cant_de_porciones:int) -> int :
    return int(((comensales* min_cant_de_porciones)/8)+0.9) 
#3.1
def alguno_es_cero (x:float,y:float) -> bool :
   res :bool = (x== 0 or y == 0 )  
   return res
#3.2
def ambos_son_0 (x:float,y:float) -> bool :
   res :bool = (x== 0 and y == 0 ) 
   return res
## 3.3
def es_nombre_largo (nombre:str) -> bool :
    res : bool = (len(nombre)) > 3 and not (len (nombre)) > 8 
    return  res
#3.4
def es_bisiesto (x:int) -> bool :
    res :bool= (x%400 == 0 or (x%4==0 and not x%100==0))
    return res
#4.1 
def peso_pino (altura:float)-> float :
    res: float
    if (1.3333333333333333<=altura and altura<=3) :
        res = altura*300
    elif (3<altura and altura<=3.5) :
        res = 900 + (altura-3)*200
    else :
        res = "tu pino es una mierda"
    return res
#4.2
def peso_es_util (peso:float) -> str:
    res:str 
    if (400<=peso<=1000) :
       res= "nos sirve tu pino reyyy"
    else : 
        res = "flaco tu pino es una mierda"
    return res
#4.3
def sirve_pino (recibealtura:float) -> str:
    res:str
    if (1.3333333333333333<= recibealtura<=3.5) :
     res="nos sirve tu pino reyyy"
    else :
     res="flaco tu pino es una mierda"
    return res
def sirve_pino_compuesto (recibealtura:float) -> str:
    res:str
    if peso_es_util(recibealtura)== True : 
        res="nos sirve tu pino reyyy"
    else : 
        res="flaco tu pino es una mierda"
    return res
#5.1 hasta 5.6
def devolver_el_doble_si_es_par (x:int) -> int :
     if x%2 == 0: x*2
     else : return x
     # res:int = x
     # if(x%2==0):
     #res= 2*x
     #return res
#5.2
def devolver_valor_si_es_par_sino_el_que_sigue(x:int) -> int:
    res:int
    if x%2==0 :
        res= x
    else : 
        res=x+1
    return res
#5.3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9 (x:int) -> int:
    res:int
    if x%9==0 :
        res= x*3
    elif x%3==0 :
        res=x*2 
    else : 
        res= x
    return res
#5.4
def lindo_nombre(nombre:str)-> str :
    res:str
    if (len(nombre)>=5) :
        res=" Tu nombre tiene muchas letras!"
    else : 
        res="Tu nombre tiene menos de 5 caracteres"
    return res
#5.5
def elRango(x:int) -> str :
    res:str
    if x<5 : 
        res="Menor a 5"
    elif 10<=x<=20 : 
        res="Entre 10 y 20"
    elif x>20 : 
        res="Mayor a 20"
    return res
#5.6
def que_te_toca(sexo:str,edad:int)-> str:
    res:str
    if edad<18 and(sexo=='F'or sexo=='M'):
        res="Anda de vacas chaval"
    elif 18<=edad<60 and(sexo=='F'or sexo=='M') :
        res="agarra la pala"
    elif edad>=60 and sexo=='F' : 
        res="disfrute señora"
    elif edad>=65 and sexo=='M' : 
        res="disfrute señor"
    return res
#6.1
def del_1_al_diez (contador:int):
    contador:  int=1
    while contador <=10:
        print(contador)
        contador+=1
        contador <=10
def del_1_al_10(i:int):
    for i in range(1,11,1):
      print (i)
#6.2 usarlo con for
def pares_desde_10_hasta_40(i:int):
    i: int=10
    while i <= 40:
        print(i)
        i+=2
        i<=40
def hasta_40(inicio:int):
    for i in range(inicio,41,1):
     if i%2==0: 
        print (i)
#6.3
def imprime_eco_10_veces (contador:int):
    contador : int=1
    while contador <=10:
        print("eco")
        contador +=1
        contador <=10
def imprime_10_veces_eco():
    i: int=1
    for i in range (0,10,1):
        print("eco")
#6.4
def cuenta_regresiva_for(n:int):
    n: int= n
    for n in range (n,0,-1):
        print(n)
        n-=1
    print("DESPEGA CAGONNNNN") 
def cuenta_regresiva(n:int):
    i:int = n
    while i>=1:
     print(i)
     i-=1
    print("Despegue!!!")
#6.5
def viaje_tiempo(añopartida:int,añollegada:int):
   for añollegada in range(añopartida,añollegada,-1):
       print("Viajó un año al pasado,estamos en el año :")
       añopartida-=1
       print(añopartida)
   print("se termino la joda")
def viaje_tiempo_while(añopartida:int,añollegada:int):
    while añollegada<añopartida:
     print("Viajó un año al pasado,estamos en el año :")
     añopartida-=1
     print(añopartida)
    print("se termino la joda")
#6.6
def viaje_tiempo_hasta_aristoteles(añopartida:int):
   for añopartida in range(añopartida,(-374),-20):
       print("Viajó un año al pasado,estamos en el año :")
       añopartida-=20 
       print(añopartida)
   if (-374)==añopartida:
        print("Viajó un año al pasado,estamos en el año :")
        añopartida-=20
        print(añopartida)
   print("se termino la joda")
def viaje_tiempo_hasta_aristoteles_while(añopartida:int):
    while (-374)<añopartida:
     print("Viajó un año al pasado,estamos en el año :")
     añopartida-=20
     print(añopartida)
    if (-374)==añopartida:
        print("Viajó un año al pasado,estamos en el año :")
        añopartida-=20
        print(añopartida)
    print("se termino la joda")
#8.3 no se que da
#9.1
def rt(x:int,g:int)->int: 
    g=g+1 
    return x+g
g:int=0 
def ro(x:int)->int:
 global g 
 g=g+1 
 return x+g

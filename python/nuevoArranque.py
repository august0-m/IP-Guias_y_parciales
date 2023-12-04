import math
import random
import numpy as np
from queue import LifoQueue as pila
from queue import Queue as Cola
## PRIMER CODIGO PYTHON,°!!°""##$%%&%&//77" PREGUNTAR COMO ESCRIBO EL BACKSLAH  o barra inversa
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
#-------------------------Guia_7-------------------------#
#1.1
def pertenece(s:list,e:int)-> bool:
    res: bool
    if e not in s : 
        res=False
    else :
        res=True
    return res
def pertenece2(s:list,e:int)->bool:
    res:bool=False
    for i in range (len(s)):
        if s[i]==e :
            res=True
    return res
def pertenece3(s:[int],e:int):
    res:bool=False
    if e in s :
        res=True
    return res
#test1=pertenece3([1,2,3,4,5],4)
#print(test1)
#test1=pertenece2([1,2,3,4,5],4)
#print(test1)
#1.2
def divideATodos(s:list,e:int) -> bool:
    res= True
    for i in range (len(s)):
       if s[i] % e !=0:
           res=False
    return res
#1.3
def sumaTotal(s:list):
    sumatoria:int=0
    for i in range (0,len(s),1):
     sumatoria= sumatoria + s[i] 
    return sumatoria
#test12=(sumaTotal([1,2,3]))
#print(test12)
#1.4
def ordenados(s:list)->bool:
    res:bool= False
    for i in range(0,len(s)-1,1):
        if s[i]<s[i+1]:
            res=True
    return res
#test14=ordenados([1,2,3,4,45])
#print(test14)
#1.5
def longitud_7(s:[str])->bool:
    res:bool=False
    for i in range(0,len(s),1):
        if len(s[i]) or len(s[i+1])>7:
            res=True
        return res
#test15=longitud_7(["augusto","capo","estudia","boludo","automovil"])
#print(test15)
#1.6 porque cuando pones bool:false res=true cambiando la condicion por igual enves de distinto no da lo mismo?
def es_palindromo(x:str)->bool:
    res:bool=True
    for i in range(0,len(x),1):
       if x[i]!=x[len(x)-1-i]:
        res=False
    return res
#test16=(es_palindromo("asado"))
#print(test16)
#test161=(es_palindromo("amadaladama"))
#print(test161)
#1.7
def contraseña(x:str)->str:
     res:str= "AMARILLO"
     if len(x)<5 :
            res=print("ROJA")
     elif mayus(x) and minus(x) and nume(x) and len(x)>8 :
            res= print("VERDE")
     return res
def mayus(x:str)->bool:
    res:bool=False
    for i in range(len(x)):
        if "A"<=x[i]<="Z" :
            res=True
    return res
def minus(x:str)->bool:
    res:bool=False
    for i in range(len(x)):
        if "a"<=x[i]<="z" :
            res=True
    return res
def nume(x:str)-> bool:
     res:bool=False
     for i in range(len(x)):
          if "0"<=x[i]<="9" :
            res=True
     return res
#test1=contraseña("9kfghfhgOPO")
#print(test1)
#8. Dada una lista de tuplas, que representa un historial de movimientos en una cuenta bancaria, devolver el saldo actual.
#Asumir que el saldo inicial es 0. Las tuplas tienen una letra que nos indica el tipo de movimiento “I” para ingreso de
#dinero y “R” para retiro de dinero, y adem´as el monto de cada operaci´on. Por ejemplo, si la lista de tuplas es [(‘‘I’’,
#2000), (‘‘R’’, 20),(‘‘R’’, 1000),(‘‘I’’, 300)] entonces el saldo actual es 1280.
#1.8
def mov_bancario(x:list)->int:
     res:int=0
     for i in range(len(x)):
      if x[i][0]=="I":
          res=res+x[i][1]
      elif x[i][0]=="R":
          res=res-x[i][1]
     return res
#test18=mov_bancario([("I",1900),("R",500),("R",300),("I",100)])
#print(test18)
#1.9 9. Recorrer una palabra en formato string y devolver True si ´esta tiene al menos 3 vocales distintas y False en caso
#                          contrario.
def min_vocales(palabra:str)->bool:
    vocales=["A","E","I","O","U","a","e","i","o","u"]
    res:bool=False
    contador:int=0
    for y in range(len(vocales)):
        for x in range(len(palabra)):
         if palabra[x]==vocales[y]:
            contador+=1
            vocales[y]=""
    if contador>=3:
        res=True
    return res
#test19=min_vocales("ae")
#print(test19)
#2.1
# 1.Dada una lista de n´umeros,en las posiciones pares borra el valor original y coloca un cero.
# Esta funci´on modifica el par´ametro ingresado,es decir,la lista es un par´ametro de tipo inout.
def coloca_cero(lista:[int])->[int]:
    for i in range(0,len(lista)-1,1):
        if lista[(1+i)]%2==0:
            lista[1-i]=0
    return lista
#test21=coloca_cero([1,2,3,4,5,6,7,8])
#print(test21)
#2.2 res = s.copy()
def coloca_cero_2(lista:[int])->[int]:
    res = lista.copy()
    for i in range(0,len(res)-1,1):
        if lista[(1+i)]%2==0:
            res[1-i]=0
    return res
#test22=coloca_cero([1,2,3,4,5,6,7,8])
#print(test22)
#2.3 Dada una cadena de caracteres devuelva una cadena igual a la anterior, CON AYUDA
# pero sin las vocales.No se agregan espacios, 
# si no que borra la vocal y concatena a continuaci´on.        OBS: NO SE PUEDE REASIGNAR UN VALOR A UN CARACTER DE UN STRING
def sin_vocales(palabra:str)->str:
    vocales=["A","E","I","O","U","a","e","i","o","u"]
    res:str=""
    for p in range(len(palabra)):
        if (pertenecestr(vocales,palabra[p])):
             res=res
        else:
            res=res+palabra[p]
    return res
def pertenecestr(vocales:[str],letra:str)->bool:
    res:bool=False
    for v in range(len(vocales)):
        if vocales[v]==letra:
            res=True
    return res
#test23=sin_vocales("arbol")   
#print(test23)
#test232=pertenecestr(["a","e","i"],"i")
#print(test232)
#2.4 
# 4.problemareemplazaVocales(in s:seq<Char>):seq<Char>{ 
# requiere:{True}
#  asegura:{Para todo i ∈ Z,si 0 ≤ i<|res|→(pertenece(<‘a’,‘e’,‘i’,‘o’,‘u’>,s[i])∧res[i]=‘’)∨
#  (¬pertenece(<‘a’,‘e’,‘i’,‘o’,‘u’>,s[i])∧res[i]=s[i]))} }
def reemplazar_vocales(palabra:str)->str:
    vocales=["A","E","I","O","U","a","e","i","o","u"]
    res:str=""
    for p in range(len(palabra)):
        if (pertenecestr(vocales,palabra[p])):
             res=res + " "
        else:
            res=res+palabra[p]
    return res
#print(reemplazar_vocales("messi"))
#2.5 
#5.problemadaVueltaStr(ins:seq<Char>):seq<Char>{ 
# requiere:{True}
#  asegura:{Para todo i ∈ Z si 0 ≤ i < |res| → res[i]=s[|s|−i−1]}
def da_vuelta_str(palabra:str)->str:
    res:str=""
    for p in range(0,len(palabra),1):
         res=res+ palabra[len(palabra)-1-p]
    return res
#print(da_vuelta_str("messi campeon del mundo"))
#2.6
#problema eliminarRepetidos(ins:seq<Char>):seq<Char>{
#  requiere:{True} 
# asegura:{(|res|≤|s|) ∧ (para todo i ∈ Z si 0≤i<|s|→
# pertenece(s[i],res)) ∧ (para todo i,j ∈ Z si (0≤i,j<|res|∧i=j)→res[i]=res[j])} }
def eliminar_repetidos(palabra:str)->str:
    res:str=""
    #se_repite:bool=False
    for p in range(0,len(palabra),1):
    #   for l in range(p+1,len(palabra)):
     #      if palabra[p]==palabra[l]:
      #        se_repite=True
    #if se_repite==False:
     #    res+=palabra[p]
       if pertenecestr(res,palabra[p]):
           res=res
       else:
         res+=palabra[p]
    return res
#print(eliminar_repetidos("aeiounaaaaaaaaa"))
#3
#Ejercicio3.Implementar una funci´on para conocer el estado de aprobaci´on de una materia a partir de las notas obtenidas
#  por un/a alumno/a cumpliendo con la siguiente especificaci´on : problemaaprobado(innotas:seqZ):Z{ 
# requiere:{|notas|>0} 
# requiere:{Para todo i ∈ Z si0≤i<|notas|→0≤notas[i]≤10)} 
# asegura:{res=1↔todos los elementos de notas son mayores o iguales a 4 y el promedio es mayor o igual a 7} 
# asegura:{res=2↔todos los elementos de notas son mayores o iguales a 4 y el promedio est´a entre 4(inclusive)y7} 
# asegura:{res=3↔alguno de los elementos de notas es menor a 4 o el promedio es menor a 4} }
def cantidad_elementos(x:[int])->int: # re al pedo si existe LEN xd
    res:int=0
    for i in range(len(x)):
        if i!="":
            res+=1
    return res
#print(cantidad_elementos([1,2,3,4,5,6,7]))
def alguno_menor_a_4(x:[int])->bool:
    res:bool=False
    for i in range(0,len(x),1):
        if x[i]<4:
            res=True
        return res
#print(alguno_menor_a_4([4,4,4,4,5]))
def problema_aprobado(notas:[int])->str:      
        if (alguno_menor_a_4(notas)or((sumaTotal(notas)/len(notas))<=4) ):
            res="recursa uwunt"
        elif ((sumaTotal(notas)/(len(notas)))>=7):
           res= "PROMOCIONA"
        elif ((sumaTotal(notas)/len(notas))<=7):
            res= "A FINAL"
            return res
#print(problema_aprobado([4,4,4,4,5,6,7,]))
#4
#Ejercicio4.
# Vamos a elaborar programas interactivos (usando la funci´on input()1) que nos permita solicitar al usuario informaci´on cuando usamos las funciones. 
# 1. Implementar una funci´on para construir una lista con los nombres de mis estudiantes.
# Lafunci´on solicitar´a al usuario los nombres hasta que ingrese la palabra “listo”.
# Devuelve la lista con todos los nombres ingresados.
def alumnos()->[str]:
    res: [str]= []
    nombre: str = (input("Nombre:"))
    while (nombre != "listo"): 
        res.append(nombre)
        nombre =str(input("Nombre:"))
    return res
def alumnado()->[str]:
    print("Escriba el nombre del alumno luego de (Nombre:), cuando quiera finalizar escriba (listo) en dicho espacio")
    lista_alumnos:list=[]
    nombre_ingresado:str=(input("Nombre:"))
    while (nombre_ingresado !="listo"):
        lista_alumnos.append(nombre_ingresado)
        nombre_ingresado=(input("Nombre:"))
       # if nombre_ingresado!="listo":
        # lista_alumnos.append(nombre_ingresado)
    return lista_alumnos
#2. Implementar una funci´on que devuelve una lista con el historial de unmonedero electr´onico (porejemplolaSUBE). El usuario debe seleccionar en cada paso si quiere
# : “C”=Cargar cr´editos , “D”=Descontar cr´editos, “X”=Finalizar la simulaci´on (terminar el programa). En los casos de cargar y descontar cr´editos,
# el programa debe adem´as solicitar el monto para la operaci´on.Vamos a asumir que el monedero comienza en cero.
# Para guardar la informaci´on grabaremos en el historial tuplas que representen los casos de cargar(“C”,monto a cargar) y descontar cr´edito(“D”,monto a descontar).
def sube():
    print("Para cargar escriba C y luego el monto a cargar,para descontar D y el monto a descontar, para terminar reporte X.")
    d:int=0
    c:int=0
    monto_ingresado:int=0
    #historial_carga:list=["C",c]
    #historial_descarga:list=["D",d]
    operacion_a_realizar:str=(input("Operación a relizar:"))
    #monto_ingresado:int=(input())
    while(operacion_a_realizar!="X"):   
     #monto_ingresado:int=(input()) PRIMERO HABRIA Q VER QUE ES PARA SOLICITAR MONTO
     #operacion_a_realizar=(input("Operación a realizar:")) VA CUANDO TERMINA EL WHILE
      if operacion_a_realizar=="C":
        monto_ingresado:int=input("Monto:")
        c=c+int(monto_ingresado)
        #historial_carga:list=["C",c]
      elif operacion_a_realizar=="D":
          monto_ingresado=input("Monto:")
          d+=int(monto_ingresado)
          #historial_descarga:list=["D",d]
      elif (operacion_a_realizar!= "X") and (operacion_a_realizar!="C") and (operacion_a_realizar!="D"):
         print("Acción ingresada no detectada")
      operacion_a_realizar:str=(input("Operación a relizar:"))
    total:int=c-d
    respuesta_final=[("Cargas",c),("Descargas",d),("Tu saldo total",total)]
    return respuesta_final
#sube()
def sube_1()->list: # ES LO MISMO Q LO DE ARRIBA, SI LO PROBAS CON PLAY NO DEVUELVE NADA PERO NO ME DABA CUENTA Q LO TENIA Q PROBAR CON LA TERMINAL Y PYTHON
    print("Para cargar escriba C y luego el monto a cargar,para descontar D y el monto a descontar, para terminar reporte X.")
    d:int=0
    c:int=0
    monto_ingresado:int=0
    operacion_a_realizar:str=(input("Operación a relizar:"))
    while(operacion_a_realizar!="X"): 
        if operacion_a_realizar=="C":
            monto_ingresado:int=input("Monto:")
            c=c+int(monto_ingresado)
        elif  operacion_a_realizar=="D":
             monto_ingresado=input("Monto:")
             d+=int(monto_ingresado)
        elif (operacion_a_realizar!= "X") and (operacion_a_realizar!="C") and (operacion_a_realizar!="D"):
            print("Acción ingresada no detectada")
        operacion_a_realizar:str=(input("Operación a relizar:"))
    cargas=("C",c)
    descargas=("D",d)
    return [(cargas),(descargas)]
#sube_1()
def sube_3(): #ES LO MISMO Q LO DE ARRIBA(ESTE LO HICE EN CLASE CON AYUDA DE LOS BEPIS), 
    #SI LO PROBAS CON PLAY NO DEVUELVE NADA PERO NO ME DABA CUENTA Q LO TENIA Q PROBAR CON LA TERMINAL Y PYTHON
    operacion_a_realizar:str=input("Operacion a realizar:")
    carga_monto:int=0
    c:int=0
    d:int=0
    while (operacion_a_realizar !="X"):
        if operacion_a_realizar=="C":
            carga_monto=input("Monto:")
            c+=int(carga_monto)
        elif operacion_a_realizar=="D":
            carga_monto=input("Monto:")
            d+=(int(carga_monto))
        operacion_a_realizar=input("Operacion a realizar:")
    tupla_carga=("C",c)
    tupla_descarga=("D",d)
    return [(tupla_carga),(tupla_descarga)]
#sube_3()
def sube_2()->[tuple]: # ESTE ES DE SEBA O GIAN PERO NO DEVUELDE LA SUMA DE CARGA Y DESCARGAS Q ERA LO Q QUERIA HACER YO
    res:[tuple] = []
    movimiento: str = input("Que quiere hacer?")
    while (movimiento != "X"):
        if (movimiento == "C"):
            monto: int = input("Ingresar monto")
            res.append(("C",monto))
            movimiento: str = input("Que quiere hacer?")
        else:
            monto: int = input("Ingresar monto")
            res.append(("D",monto))
            movimiento: str = input("Que quiere hacer?")
    return res
# Vamos a escribir un programa para simular el juego conocido como 7 y medio.El mismo deberá generar un número aleatorio entre 0 y 12(excluyendo el 8 y 9) y deber´a luego 
# preguntarle al usuario si desea seguir sacando otra “carta” o plantarse.En este ultimo caso el programa debe terminar.Los n´umeros aleatorios obtenidos deber´an sumarse 
# seg´un el n´umero obtenido salvo por las “figuras”(10,11 y 12) que sumar´an medio punto cada una.El programa debe ir acumulando los valores y si se pasa de 7.5
# debe informar que el usuario ha perdido.Al finalizar la funcion devuelve el historial de “cartas” que hizo que el usuario gane o pierda.Para generar numeros pseudo-aleatorios
# entre 1 y 12 utilizaremos la funcion random.randint(1,12).Al mismo tiempo,la funcion random.choice() puede ser de gran ayuda a la hora de repartir cartas.
def siete_y_medio():  #ERROR Q DA ES CUANDO Y>9, ME DICE Q LA NUEVA CARTA ES UNA DE ESAS PERO NO LA SUMA COMO 0.5, ENTONCES NO SEEE(IGUAL NO RESPETE LAS CONSIGNAS DEL TOD_O)
    print("Este es el juego de 7 y medio, a continuación se te asignará una carta entre 1 y 12, si deseas seguir jugando vas a contestar con SI o con NO ")
    res:int=0
    w:int=0.5
    lista_cartas:list=[]
    x=random.randint(1,12)
    lista_cartas.append(x)
    posibles_valores=(1,2,3,4,5,6,7,10,11,12)
    y=random.choice(posibles_valores)
    if x>9:
            print("Tu carta fue:")
            print(x)
            print("Has perdido de entrada menudo parguelita")
    elif y>7:
        res=res+x+w
    elif x==8 or x==9:
            x=random.randint(0,12)
            res+=x
    else:
        print("Tu carta es:",x)
        res+=x
        que_haces=input("Deseas sacar otra carta?:")
        while True:
            if que_haces=="SI":
                y=random.choice(posibles_valores)
                lista_cartas.append(y)
                res+=y
                if  res==7.5:
                    print("Has ganado, tu nueva carta fue",y,"y la suma de tus cartas fue",res)
                    break
                elif(res)<7.5:
                    print("Tu nueva carta es:",y)
                    print("La suma de tus cartas es:",res)
                elif (res)>7:
                    print("Has perdido, tu nueva carta es",y,"y la suma de tus cartas llegó hasta",res)
                    break     
            elif que_haces=="NO" and res<7.5:
                print("La suma de tus cartas es:",res)
                print("Has ganado!")
                break
            elif que_haces!="NO" or que_haces!="SI":
                print("Introduzca acción valida")
            que_haces=input("Deseas sacar otra carta?:")
    return lista_cartas
#siete_y_medio()
#def carta():
 #   x=random.randint(0,12)
  #  if x>9:
    #while que_haces=="SI":
        #if x==10 or x==11 or x==12:
         #   x=0.5
          #  res=res+x
        #if x==8 or x==9:
        #    x=random.randint(1,12)
        #    res=x+res
        #if que_haces!="SI":
         #   print("Introduzca una respuesta coherente")
        #else:
         #   res+=random.randint(1,12)
          #  if res>7.5:
           #     print("Has perdido, si deseas volver a jugar introduzca RASIN BOTON")
        #print("Este es el historial de tus cartas:")
        #print(res)
        #print("Este es la suma de tus cartas:")

       # que_haces=input("Deseas seguir jugando?:")
    #return 
def siete_y_medio_2(): #ESTE ES DE CHATGPT Y ESTA MAL TAMBIEN
    print("Este es el juego de 7 y medio, a continuación se te asignará una carta entre 1 y 12, si deseas seguir jugando vas a contestar con SI o con NO ")
    x = 0
    res = 0
    lista_cartas = []
    x = random.randint(1, 12)
    posibles_valores = (0.5, 1, 2, 3, 4, 5, 6, 7)
    y = random.choice(posibles_valores)
    lista_cartas.append(x)
    if x > 9:
        print(x)
        print("Has perdido de entrada menudo parguelita")   
    elif x == 8 or x == 9:
        x = random.randint(1, 7)   
    else:
        print(x)
        que_haces = input("Deseas sacar otra carta?: ")
        while que_haces != "NO":
            y = random.choice(posibles_valores)
            print("tu nueva carta es:", y)
            res = x + y
            lista_cartas.append(y)
            if res > 7.5:
                print("perdiste")
                break
            que_haces = input("Deseas sacar otra carta?: ")
    return lista_cartas
def sumaDelJuego(x:float, y:float)->float: #este es de seba esta bien la funcion sumadeljuego soluciona mi problema creo
    res: int = x
    if (y>=10):
        res = res + 0.5
    else:
        res = res + y
    return res
def sieteYmedio()->[int]:
    contador: int = 0
    numeros: [int] = [1,2,3,4,5,6,7,10,11,12]
    primerCarta: int = random.choice(numeros)
    print("Tu carta es", str(primerCarta))
    res: [int] = [primerCarta]
    contador = sumaDelJuego(0,primerCarta)
    print("Y vas",str(contador))
    siguientePaso: str = input("Que vas a hacer?")
                               
    while (siguientePaso == "sigo" and contador<7.5):
        otraCarta: int = random.choice(numeros)
        print("Tu carta es", str(otraCarta))
        res.append(int(otraCarta))
        contador = sumaDelJuego(contador,otraCarta)
        if (contador < 7.5):
            print("Y vas",str(contador))
            siguientePaso: str = input("Que vas a hacer?")
    
    if(contador == 7.5):
        print("GANASTE!")
    elif(contador<7.5):
        print("CORTO")
    else:
        print("PERDISTE!!")
    return res
#EJERCICIO 5
#Implementar las siguientes funciones sobre listas de listas: 
# 1.problema perteneceACadaUno(ins:seq<seq<Z>>,in e:Z,out res:seq<Bool>) 
# { requiere:{True} 
# asegura:{Para todo i ∈ Z si 0 ≤i<|res|→(res[i]=true↔pertenece(s[i],e))} }
#  Nota:Reutilizar la funciOn pertenece()implementada previamente para listas
#5.1
def perteneceACadaUno(lista:[[int]],x:int)->list:
    res:bool=False
    lista_buleana_xd:list=[]
    for i in range(len(lista)):
        for j in range(len(lista[i])):
            if x==lista[i][j]:
                lista_buleana_xd.append(True)
            elif x!=lista[i][j]:
                lista_buleana_xd.append(False)
    return lista_buleana_xd
#print(perteneceACadaUno([[1,2,3],[4,7,9],[4,2,1]],2)) #A LA PRIMERA, SOY CRACK UWU
#2.problemaesMatriz(ins:seq<seq<Z>>):Bool {
#  requiere:{True}
#  asegura:{res=true↔(|s|>0)∧(|s[0]|>0)∧(Para todo i ∈ Z si 0 ≤i<|s|→|s[i]|=|s[0]|)} }   
def es_matriz(lista:[[int]])->bool: #es muy buenoooooooooooo
    res:bool=False
    cantidad_numeros:int=0
    cantidad_filas:int=0
    for i in range(len(lista)):
        if i!="":
            cantidad_filas+=1
        for j in range(len(lista[i])):
            if j!="":
                cantidad_numeros+=1
    if cantidad_numeros%cantidad_filas==0:
        res=True
    return res
#print(es_matriz([[1,2,3,45,1],[1,22,345,6]]))
#print(es_matriz([[1,2,3],[3,524,1]]))
#print(es_matriz([[1],[1,2,3,5,667,4]]))
#print(es_matriz([[],[1,2,4]]))
#3.problema filasOrdenadas(inm:seq<seq<Z>>,outres:seq<Bool>) { 
# requiere:{esMatriz(m)}
#  asegura:{Para todo i ∈ Z si 0 ≤ i<|res|→(res[i]=true ↔ ordenados(s[i]))} } 
# Nota:Reutilizar la funcion ordenados() implementada previamente para listas
def ordena_2(s:list)->bool:
    res:bool= False
    for i in range(0,len(s)-1,1):
        if s[i]<s[i+1]:
            res=True
    return res
def filas_ordenadas(matriz:[[int]])->list:
    lista_vuleana_xd:list=[]
    for i in range(len(matriz)):
            if ordena_2(matriz[i]):
                lista_vuleana_xd.append(True)
            else:
                lista_vuleana_xd.append(False)
    return lista_vuleana_xd
#print(filas_ordenadas([[1,2,3],[4,2,1],[],[99,100,1]]))
#4. Implementar una funcion que tome un entero d y otro p y eleve una matriz cuadrada de tamano d con valores generados al azar a la potencia p.
# Es decir,multiplique a la matriz generada al azar por sı misma p veces.Realizar experimentos condiferentes valores de d.
# ¿Que pasa con valores muy grandes? Nota1:recorda que en la multiplicacion de una matriz cuadrada de dimension d por si misma cada posicion se calcula como
# res[i][j]= d−1 k=0(m[i][k]×m[k][j]) 
# Nota2:para generar unam atriz cuadrada de dimension d con valores aleatorios hay muchas opciones de implementacion,analizar las siguientes usando la biblioteca 
# numpy(verrecuadro): Opcion1: import numpy as np 
# m =np.random.random((d,d))2
#  Opcion2: importnumpy as np 
# m=np.random.randint(i,f,(d,d))3
def matriz_d_a_la_p(tamaño:int,potencia:int)->list:   #ESTA MAL SOLO SIRVE PARA M ELEVADO A LA 2
    res:list=[]
    m=np.random.random((tamaño,tamaño))**2
    print("Esta es la matriz generada:",m)
    #res=m*potencia
    for i in range(1,potencia):
        if i<=potencia:
            res=(m@m)
    return ["Esta es la matriz M a la potencia P:",res]
#print(matriz_d_a_la_p(2,5))
def elevarMatrices (d: int, p:int)->[[float]]: #ESTAS SON DE SEBA Q ES CRA
    m = np.random.random((d, d))**2
    if (p == 0):
        res: [[int]] = np.identity(d)
    else:
        res: [[int]] = m
        for i in range (1,p+1):
            if (p == 1):
                res = res
            else:
                res: [[int]] = multiplicacionDeMatrices(res,m)
    return res
def multiplicacionDeMatrices (a:[[int]], b:[[int]]):
    res: [[int]] = np.random.random((len(b[0]),len(a)))
    for i in range (len(a)):
        for k in range (len(b)):
            valor = 0
            for j in range (len(a[i])):
                valor = valor + a[i][j] * b[j][k]
                res[i][k] = valor
    return res
#print(elevarMatrices(2,2))
#print(multiplicacionDeMatrices([[5,2,1],[2,1,2],[4,1,3]],[[1,4,2],[0,3,0],[2,1,3]]))

#------------------EMPIEZA GUIA  8 ------------------------------------------------------

#Ejercicio 1. Implementar en Python:
#1. Una funcion contar lineas(in nombre archivo : str) → int que cuenta y devuelva la cantidad de lıneas de texto del
#archivo dado
def contar_lineas(archivo:str)->int:
    archivo=open(archivo,"r")
    lineas=archivo.readlines()   #si pongo readline lee la cantidad de letras de la primer linea
    res:int=0
    for linea in lineas:
        if not linea.strip()=="": 
        #if linea!="":            #esto cuenta todas las lineas, aunque no haya nada, y le resta una no se porq, 
        # si le dejas readline sin s cuenta las letras y espacios y le suma 1
         res+=1
    archivo.close()
    return res
#print(contar_lineas("archivo_palabras.txt"))

def contar_lineas_3(nombre_archivo): # AL FINNN GATOOOOOO
    contador = 0
    archivo=open(nombre_archivo, 'r')
    linea=archivo.readline()
    while linea:
        if linea=="" or linea=="\n":
            contador=contador
        else:
            contador+=1
        linea=archivo.readline()
    archivo.close()
    return contador
#print(contar_lineas_3("archivo_palabras.txt"))

    #if linea=="" or linea=="\n":
     #   contador=contador
    #while linea:
        #if linea!="" or linea!="\n":
     #    contador+=1
      #   linea=archivo.readline()
    #archivo.close()
    #return contador
#print(contar_lineas_3("archivo_palabras.txt"))

def jugando():
    while True: #JUGANDO
        respuesta = input("¿Quieres continuar? (si/no): ")
        if respuesta == 'no':
            break
        elif respuesta=="si":
         print("Continuando....")
        elif respuesta!="si" or respuesta!="no":
         print("Introduzca una opcion valida")
#print(jugando())


#2. Una funcion existe palabra(in palabra : str, in nombre archivo : str) → bool que dice si una palabra existe en un
#archivo de texto o no
def pruebas(palabra:str,archivo:str)->bool: #probando
    res:bool=False
    lista_palabras:list=[]
    archivo=open(archivo,"r")
    lineas=archivo.readline()
    #linea_2=archivo.readline(2)
    no_se=archivo.read()
    print(no_se)
    palabras=lineas.split()
    #palabraas_2=linea_2.split()
    lista_palabras.extend(palabras)
    #lista_palabras.extend(palabraas_2)
    #print(lineas)
    #print(palabras)
    #print(lista_palabras)
   # for linea in lineas:
    #    for palabras in linea:
     #       if palabra==linea[palabras]:
      #          res=True
    #archivo.close()
    #return res
#print(pruebas("anana",("archivo_palabras.txt")))
def existe_palabra(palabra_en_duda:str,archivo:str):
    res:bool=False
    #lista_palabras:list=[]
    archivo=open(archivo,"r")
    linea=archivo.readline()
    lista_palabras:list=[]
    #while linea!="" or linea!="\n":
    while linea:
        palabras=linea.split()
        #lista_palabras=lista_palabras.append(palabras)
    linea=archivo.readline()
    for i in range (len(lista_palabras)):
        if lista_palabras[i]==palabra_en_duda:
            res=True
    archivo.close()
    return lista_palabras
#print(existe_palabra("anana",("archivo_palabras.txt")))
def da_palabras(nombre_archivo:str):
    lista=[]
    archivo=open(nombre_archivo,"r")
    linea=archivo.readline()
    #print(linea)
    while linea:
        palabras=linea.split()
        lista.extend(palabras)
        linea=archivo.readline()
    archivo.close()
    #print(lista)
    return lista
#print(da_palabras("archivo_palabras.txt"))
def existe_palabra_2(palabra:str,archivo_a_leer:str)->bool:
    open(archivo_a_leer,"r")
    contenido=da_palabras(archivo_a_leer)
    res:bool=True
    if palabra not in contenido:
        res=False
    return res
#print(existe_palabra_2("valeria",("archivo_palabras.txt")))
def esta_en_archivo(palabra:str,archivo_a_leer:str)->bool: #no funciona tan bien
    #por ejemplo si una uso funcion con palabra=anana
    # y hay alguna linea asi= askdljadkjaANANAdsfskj devuelve TRUE
    archivo=open(archivo_a_leer,"r")
    archivo_leido=archivo.read()
    archivo_leido.split() 
    #print(archivo_leido)
    res:bool=True
    if palabra not in archivo_leido:
        res=False
    return res
#print(esta_en_archivo("anana",("archivo_palabras.txt")))
#3. Una funci´on cantidad apariciones(in nombre archivo : str, in palabra : str) → int 
# que devuelve la cantidad de apariciones de una palabra en un archivo de texto
def cant_apariciones(palabra:str,archivo:str,)->int:
    open(archivo,"r")
    res:int=0
    contenido=da_palabras(archivo)
    for i in range(len(contenido)):
        if contenido[i]==palabra:
            res+=1
    return res
#print(cant_apariciones("das",("archivo_palabras.txt")))
#Ejercicio 2. Dado un archivo de texto con comentarios, implementar una funci´on clonar sin comentarios(in nombre archivo : str)
#que toma un archivo de entrada y genera un nuevo archivo que tiene el contenido original sin las l´ıneas comentadas. Para este
#ejercicio vamos a considerar comentarios como aquellas l´ıneas que tienen un caracter ‘#’como primer caracter de la l´ınea, o si
#no es el primer caracter, se cumple que todos los anteriores son espacios.
#Ejemplo:
# esto es un comentario
# esto tambien
#(<-- lo puse yo)esto no es un comentario # esto tampoco
def clonar_sin_comentarios(nombre_archivo:str)->str:   #funciona
   archivo=open(nombre_archivo,"r")
   sin_comment=open("archivo_sin_comentar.txt","w")
   lineas_posibles_comentadas=archivo.readline()
   #oraciones=lineas_posibles_comentadas.split()   # al pedo esto
   #print(oraciones)
   #print(lineas_posibles_comentadas.split()[0][0])   esto re va
   while lineas_posibles_comentadas:
   #for linea in lineas:
        if  lineas_posibles_comentadas.split()[0][0] != "#":
            sin_comment.write(lineas_posibles_comentadas)
     #      sin_comment.write(linea)S
      # else:
       # sin_comment.write(lineas_posibles_comentadas)
        lineas_posibles_comentadas=archivo.readline()
   archivo.close()
   sin_comment.close()
#clonar_sin_comentarios("archivo_palabras.txt")
def probando(): #probando lo de write
 res=0
 archivo=open("archivo_palabras.txt","r")
 contenido=archivo.read()
 archivo_write=open("archivo_palabras.txt","w")
 agregar="ESTO VA AL PRINCIPIO vmo \n"
 #archivo_write.write("va al principio \n") #otra 
 #archivo_write.write(contenido)            #forma
 archivo_write.write(agregar + contenido)
 return res
#Ejercicio 4. Dado un archivo de texto y una frase, implementar una funci´on que la agregue al final del archivo original (sin
#hacer una copia).
#Ejercicio 5. idem, pero agregando la frase al comienzo del archivo original (de nuevo, sin hacer una copia del archivo)
def agrega_frase(frase:str,nombre_archivo:str)->str:
    archivo=open(nombre_archivo,"r")
    contenido=archivo.read() #se puede agregar + "\n " para q se agregue al final con salto de linea
    archivo_escribible=open(nombre_archivo,"w")
    archivo_escribible.write(contenido + frase)
#agrega_frase("1","archivo_palabras.txt")
def agrega_frase_principio(frase:str,nombre_archivo:str)->str:
    archivo=open(nombre_archivo,"r")
    contenido=archivo.read()
    archivo_escribible=open(nombre_archivo,"w")
    archivo_escribible.write(frase + "\n" + contenido )
#agrega_frase_principio("esto va al principio","archivo_palabras.txt")   
#--------------------------- ej 6 y 7 sin hacer---------- pilas y colas salteo
#2. Pilas
#Ejercicio 8. Implementar una funci´on generar nros al azar(in n : int, in desde : int, in hasta : int) → pila que genere una
#pila de n numeros enteros al azar en el rango [desde, hasta]. Pueden user la funci´on random.randint(< desde >, < hasta >) y
#la clase LifoQueue() que es un ejemplo de una implementaci´on b´asica:
#p = Pila ()
#p . put (1) # apilar
#elemento = p . get () # desapilar
#p . empty () # vacia 
def genera_al_azar(cantidad:int,desde:int,hasta:int)->pila:
    p=pila()
    #print(random.randint(desde,hasta))
    for n in range(0,cantidad,1):
     #   if n<cantidad:
      #      n+1
            p.put(random.randint(desde,hasta))
    return p
#print(genera_al_azar(3,3,15).queue)
#Ejercicio 9. Implementar una funci´on cantidad elementos(in p : pila) → int que, dada una pila, cuente y devuelva la
# cantidad de elementos que contiene. No se puede utilizar la funici´on LifoQueue.qsize(). Si se usa get() para recorrer la pila, esto
#modifica el par´ametro de entrada. Y como la especificaci´on dice que es de tipo in hay que restaurarla.
pilarda = pila()
pilarda.put(45)
pilarda.put(2)
pilarda.put(3)
pilarda.put(4)

def cuenta_pila(pila_entrada:pila)->int:  #funciona
    contador:int=0
    while pila_entrada.empty()==False:
          pila_entrada.get()
          contador+=1
    #pila_entrada.get()
    #print(pila_entrada.get())
    return contador
#print(cuenta_pila(pilarda))
#Ejercicio 10. Dada una pila de enteros, implementar una funci´on buscar el maximo(in p : pila) → int que devuelva el m´aximo
#elemento.
#print(pilarda.queue)
#print(pilarda.get())
def busca_maximo(pila_entrada:pila)->int: #funciona
    maximo:int=0
    ultimo:int
    while not pila_entrada.empty():
       # pila_entrada.get()
       # print(pila_entrada.get())
        ultimo=pila_entrada.get()
        #print(ultimo) 
        if ultimo>=maximo:
            maximo=ultimo
    return maximo
#print(busca_maximo(pilarda))
# 12 y 11 sin hacer
#3. Colas
#Ejercicio 13. Usando la funci´on generar nros al azar() definida en la secci´on anterior, implementar una funci´on que arme
#una cola de enteros con los numeros generados al azar. Pueden usar la clase Queue() que es un ejemplo de una implementacion
#b´asica:

#c = Cola ()
#c . put (1) # encolar
#elemento = c . get () # desencolar ()
#c . empty () # vacia 
def genera_al_azar_cola(cantidad:int,desde:int,hasta):
     c=Cola()
     for n in range (cantidad):
         c.put(random.randint(desde,hasta))
     return c
#print(genera_al_azar_cola(8,0,2).queue)
#Ejercicio 14. Implementar una funci´on cantidad elementos(in c : cola) → int que, dada una cola, cuente y devuelva la
#cantidad de elementos que contiene. Comparar con la versi´on usando pila. No se puede utilizar la funci´on Queue.qsize().
colarda=Cola()
colarda.put(1)
colarda.put(6)
colarda.put(12)
colarda.put(19)
colarda.put(31)
def cuenta_cola(cola_a_contar:Cola)->int: #funciona
    contador:int=0
    while cola_a_contar.empty() !=True:
        contador+=1
        cola_a_contar.get()
    return contador
#print(cuenta_cola(colarda))
#Ejercicio 15. Dada una cola de enteros, implementar una funci´on buscar el maximo(in c : cola) → int que devuelva el m´aximo
#elemento. Comparar con la versi´on usando pila.
def busca_maximo_cola(cola_a_revisar:Cola)->int: #funciona
    maximo:int=0
    while cola_a_revisar.empty() !=True:
        primero=cola_a_revisar.get()
        if primero>=maximo:
            maximo=primero
    return maximo
print(busca_maximo_cola(colarda))
#no hice 16,17 y 18
#4. Diccionarios
#Para esta secci´on vamos a usar el tipo dict que nos provee python:
#Ejercicio 19. Leer un archivo de texto y agrupar la cantidad de palabras de acuerdo a su longitud. Implementar la funci´on
#agrupar por longitud(in nombre archivo : str) → dict que devuelve un diccionario {longitud en letras : cantidad de palabras}.
#Ej el diccionario
#{
#1: 2 ,
#2: 10 ,
#5: 4
#}
#indica que se encontraron 2 palabras de longitud 1, 10 palabras de longitud 2 y 5 palabras de longitud 4. Para este ejercicio
#vamos a considerar palabras a todas aquellas secuencias de caracteres que no tengan espacios en blanco.
def agrupar_por_longitud(nombre_archivo:str)->dict: #funciona
    diccionario={}
    #archivo=open(nombre_archivo,"r")
    lista_palabras=da_palabras(nombre_archivo)
    #print(lista_palabras)
    for i in range(len(lista_palabras)):
        longitud_palabra=len(lista_palabras[i])
        #while lista_palabras[i] !="" or lista_palabras!="\n": # da palabras no me da eso
        if longitud_palabra not in diccionario:
             diccionario[longitud_palabra]=1
        else:
            diccionario[longitud_palabra]+=1        
    return diccionario
#print(agrupar_por_longitud("archivo_palabras.txt"))
#Ejercicio 21. Implementar la funci´on la palabra mas frecuente(in nombre archivo : str) → str que devuelve la palabra
#que m´as veces aparece en un archivo de texto. Se aconseja utilizar un diccionario de palabras para resolver el problema.
def cantidad_de_apariciones(nombre_archivo:str)->str:
    diccionario={}
    lista_palabra=da_palabras(nombre_archivo)
    for i in range (len(lista_palabra)):
        if lista_palabra[i] not in diccionario:
            diccionario[lista_palabra[i]]=1
        else:
            diccionario[lista_palabra[i]]+=1
    return diccionario
#print(cantidad_de_apariciones("archivo_palabras.txt"))
def palabra_mas_frecuente(nombre_archivo:str)->str:   #soy crack chavale
    diccionario=cantidad_de_apariciones(nombre_archivo)
    valor_max:int=0
    palabra_mas_frecuentada:str=""
   # print(diccionario)
    #print(diccionario["una"])
    for k in diccionario:
       # print(diccionario[k])
        if diccionario[k]>=valor_max:
            valor_max=diccionario[k]
            palabra_mas_frecuentada=k         
    return palabra_mas_frecuentada
#print(palabra_mas_frecuente("archivo_palabras.txt"))
    #  print((diccionario[k]))
    #for palabra, frecuencia in diccionario.items():
     #   frecuencia
     # if k + 1 in diccionario and diccionario[k] >= diccionario[k + 1]:
     #print(diccionario[k]) 
     #print(diccionario[1])
     # print (diccionario[k])
     #if k + 1 in diccionario and diccionario[k]>=diccionario[k+1]:
      #   palabra_mas_frecuentada=diccionario[k]
    #return palabra_mas_frecuentada
#print(palabra_mas_frecuente("archivo_palabras.txt"))
#Ejercicio 22. Nos piden desarrollar un navegador web muy simple que debe llevar un registro de los sitios web visitados por los
#usuarios del sistema. El navegador debe permitir al usuario navegar hacia atr´as y hacia adelante en la historia de navegaci´on.
#1. Crea un diccionario llamado historiales que almacenar´a el historial de navegaci´on para cada usuario. Las claves del
#diccionario ser´an los nombres de usuario y los valores ser´an pilas.
#2. Implementa una funci´on llamada visitar sitio(historiales, usuario, sitio) que reciba el diccionario de historiales,
#el nombre de usuario y el sitio web visitado. La funci´on debe agregar el sitio web al historial del usuario correspondiente.
#3. Implementa una funci´on llamada navegar atras(historiales, usuario) que permita al usuario navegar hacia atr´as en
#la historia de navegaci´on. Esto implica sacar el sitio web m´as reciente del historial del usuario.
#4. Implementa una funci´on llamada navegar adelante(historiales, usuario) que permita al usuario navegar hacia adelante en la historia de navegaci´on. Esto implica volver a agregar el sitio web previamente sacado.
#Ejemplo de uso:
#historiales = {}
#visitar_sitio(historiales, "Usuario1", "google.com")
#visitar_sitio(historiales, "Usuario1", "facebook.com")
#navegar_atras(historiales, "Usuario1")
#visitar_sitio(historiales, "Usuario2", "youtube.com")
#navegar_adelante(historiales, "Usuario1")
#no hice 22 ni 23
import math
import random
import numpy as np
from queue import LifoQueue as pila
from queue import Queue as Cola
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
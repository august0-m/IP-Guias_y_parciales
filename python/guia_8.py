import math
import random
import numpy as np
from queue import LifoQueue as pila
from queue import Queue as Cola
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
#Ejercicio16. #subieron esta resolución al campus
#Bingo:un cartón de bingo contiene 12 números al azar en el rango[0,99]. 
#1. implementar una función armar secuencia de bingo()→Cola[int] que genereuna cola con los números del 0 al 99 ordenados al azar.
#2. implementaruna función jugarcartondebingo(in carton:list[int],in bolillero:cola[int])→int que toma un cartón de Bingo y una cola de enteros 
#(que corresponden a las bolillas numeradas)y determina cual es la cantidad de jugadas de ese bolillero que se necesitan para ganar.
def armarSecuencideBingo() -> Cola:
    #armo una lista con los numeros del 0 al 9
    lista: list = list(range(0,10))
    #desordena de forma random la lista
    random.shuffle(lista)
    #creo una cola y la lleno con los elementos de la lista
    bolillero: Cola = Cola()
    for bolilla in lista:
        bolillero.put(bolilla)
    return bolillero

def jugarCartonDeBingo(carton: list, bolillero: Cola) -> int:
    cantSinMarcar: int = len(carton)
    jugadas: int = 0
    bolilleroAux: Cola = Cola()
    #mientras no marque todos los numeros del carton saco bolillas
    while cantSinMarcar > 0:
        num: int  = bolillero.get()
        bolilleroAux.put(num)
        if num in carton:
            cantSinMarcar -= 1
        jugadas += 1
    
    while not bolillero.empty():
        num: int  = bolillero.get()
        bolilleroAux.put(num)
        
    while not bolilleroAux.empty():
        num: int  = bolilleroAux.get()
        bolillero.put(num)
    
    return jugadas


#bolillero = armarSecuencideBingo()
#carton = [1,5]

#print(list(bolillero.queue))
#print(jugarCartonDeBingo(carton,bolillero))
#print(list(bolillero.queue))
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

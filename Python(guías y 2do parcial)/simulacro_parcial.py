# Ejercicio 1
#
#  problema ultima_aparicion (s: seq⟨Z⟩, e: Z) : Z {
#    requiere: {e pertenece a s }
#    asegura: {res es la posición de la última aparición de e en s}
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,100,0,100,0,-1,-1]
#   e = 0
# se debería devolver res=7

def ultima_aparicion(s: list, e: int) -> int:
    res:int=0
    for i in range(len(s)):
        if s[i] ==e:
            res=i
    return res
print(ultima_aparicion([1,2,3,4,5],1))
##########################################################################
##########################################################################

# Ejercicio 2
#
#  problema elementos_exclusivos (s: seq⟨Z⟩, t: seq⟨Z⟩) : seq⟨Z⟩ {
#    requiere: -
#    asegura: {Los elementos de res pertenecen o bien a s o bien a t, pero no a ambas }
#    asegura: {res no tiene elementos repetidos }
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,3,0,100,0,-1,-1]
#   t = [0,100,5,0,100,-1,5]
# se debería devolver res = [3,4,5] ó res = [3,5,4] ó res = [4,3,5] ó res = [4,5,3] 
# ó res = [5,3,4] ó res = [5,4,3]
def eliminar_rep(x:list)->list:
    lista_limpia:list=[]
    for i in range(len(x)):
        if x[i]not in lista_limpia:
            lista_limpia+=[x[i]]
    return lista_limpia
#print(eliminar_rep([1,2,3,1,2,3,1,2,4]))
def elementos_exclusivos_dos(s:list,t:list)->list:
    eliminar_rep(s)
    eliminar_rep(t)
    lista_exclusiva:list=[]
    for i in range (len(s)):
        if (s[i] not in t) and (s[i] not in lista_exclusiva):
            lista_exclusiva+=[s[i]]
    for j in range (len(t)):
        if (t[j] not in s) and (t[j]not in lista_exclusiva):
            lista_exclusiva+=[t[j]]
    return lista_exclusiva
#print(elementos_exclusivos_dos([-1,4,0,4,3,0,100,0,-1,-1],[0,100,5,0,100,-1,5,5,5,5,5,5,5]))
def sacar_repetidos(lista:list)->list:
    lista_sin_rep:list=[]
    for x in range (len(lista)):
      if lista[x] not in lista_sin_rep:
         lista_sin_rep=lista_sin_rep+[lista[x]]
      else:
        lista[x]=""
    return lista_sin_rep
print(sacar_repetidos([1,2,3,2,1,4,3]))
def elementos_exclusivos(s: list, t: list) -> list:
    lista_exclusiva:list=[]
    lista_sin_rep_s:list=[]
    lista_sin_rep_t:list=[]
    for i in range (len(s)):
        for j in range(len(t)):
            if s[i]!=t[j]:
                lista_sin_rep_s=eliminar_rep(lista_sin_rep_s + [s[i]])
    for j in range (len(t)):
        for i in range(len(s)):
            if s[i]!=t[j]:
                lista_sin_rep_t=eliminar_rep(lista_sin_rep_t + [t[j]])
    lista_exclusiva=lista_sin_rep_s+lista_sin_rep_t
    return (sacar_repetidos(lista_exclusiva))

#print(elementos_exclusivos([-1,4,0,4,3,0,100,0,-1,-1],[0,100,5,0,100,-1,5]))

##########################################################################
##########################################################################

# Ejercicio 3
#
# Se cuenta con un diccionario que contiene traducciones de palabras del idioma castellano (claves) a palabras
# en inglés (valores), y otro diccionario que contiene traducciones de palabras en castellano (claves) a palabras
# en alemán (valores). Se pide escribir un programa que dados estos dos diccionarios devuelva la cantidad de 
# palabras que tienen la misma traducción en inglés y en alemán.

#  problema contar_traducciones_iguales (ing: dicc⟨String,String⟩, ale: dicc⟨String,String⟩) : Z {
#    requiere: -
#    asegura: {res = cantidad de palabras que están en ambos diccionarios y además tienen igual valor en ambos}
#  }

#  Por ejemplo, dados los diccionarios
#    aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
#    inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
#  se debería devolver res=2

def contar_traducciones_iguales(ingles: dict, aleman: dict) -> int:
    res:int=0
    for k in ingles:
       if ingles.get(k)==aleman.get(k):
        res+=1
    return res
#print(contar_traducciones_iguales({"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"},{"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}))

##########################################################################
##########################################################################

# Ejercicio 4
#
# Dada una lista de enteros s, se desea devolver un diccionario cuyas claves sean los valores presentes en s, 
# y sus valores la cantidad de veces que cada uno de esos números aparece en s

#  problema convertir_a_diccionario (lista: seq⟨Z⟩) : dicc⟨Z,Z⟩) {
#    requiere: -
#    asegura: {res tiene como claves los elementos de lista y res[n] = cantidad de veces que aparece n en lista}
#  }

#  Por ejemplo, dada la lista
#  lista = [-1,0,4,100,100,-1,-1]
#  se debería devolver res={-1:3, 0:1, 4:1, 100:2}
#  
# RECORDAR QUE NO IMPORTA EL ORDEN DE LAS CLAVES EN UN DICCIONARIO

def convertir_a_diccionario(lista: list) -> dict:
    dict={}
    for i in ((eliminar_rep(lista))): # con range no funciona y con len lo asocia a cada sub i
        dict[i]=(lista.count(i))
    return dict
print(convertir_a_diccionario([-1, 0, 4, 100, 100, -1, -1]))


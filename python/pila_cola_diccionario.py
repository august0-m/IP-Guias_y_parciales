
# ejemplo de Pila

from queue import LifoQueue as Pila

p = Pila ()
p . put (1) # apilar
elemento = p . get () # desapilar
p . empty () # vacia ?


# contar elementos de una pila

def cantidadElementos(p: Pila) -> int:
    res: int = 0
    paux: Pila = Pila()

    while not p.empty():
        elem = p.get()
        paux.put(elem)
        res = res + 1
    
    while not paux.empty():
        elem = paux.get()
        p.put(elem)
        
    return res


# version con especificacion que garantiza
# que la pila no es vacia
def buscarElMaximo(p: Pila) -> int:
    res: int = p.get()
    paux: Pila = Pila()

    while not p.empty():
        elem: int = p.get()
        paux.put(elem)
        if elem > res:
            res = elem
    
    while not paux.empty():
        elem = paux.get()
        p.put(elem)

    return res

# version con especificacion que NO garantiza nada sobre la pila
# En el caso en que la lista sea vacia, devuelve None
def buscarElMaximo2(p: Pila) -> int:
    res: int = None
    paux: Pila = Pila()
    
    if not p.empty():
        res = p.get() # desapilar()
        paux.put(res)

    while not p.empty():
        elem: int = p.get()
        paux.put(elem)
        if elem > res:
            res = elem

    while not paux.empty():
        elem = paux.get()
        p.put(elem)

    return res


# posibles casos de test (NOTA: seguramente incluye repetidos. Tambien mezcla de caja negra y caja blanca)
# 1. pila vacia
# 1. pila con 1 unico elemento
# 1. pilas con >= 2 elementos
# 1. pila con n valores >= 2 todos en orden creciente
# 1. pila con n valores >= 2 todos en orden decreciente
# 1. pila con n valores >= 2 que no sean ni totalmente creciente, ni totalmente decreciente
# 1. pila con n valores >= 2 todos los valores iguales
# 1. probar con valores positivos y negativos y con cero


# ejemplo de colas
from queue import Queue as Cola

def cantidadElementos(c: Cola) -> int:
    res: int = 0
    caux: Cola = Cola()

    while not c.empty():
        elem = c.get() # desencolar()
        caux.put(elem)
        res = res + 1
    
    while not caux.empty():
        elem = caux.get()
        c.put(elem)

    return res


# diccionario
def agruparPorLongitud(nombre_archivo : str) -> dict:
    archivo = open(nombre_archivo, "r")
    d: dict = {} # inicializando/creando el diccionario

    for linea in archivo.readlines(): # ['a hola chau\n', 'otra linea\n']
        palabras = linea.split()      # ['a', 'hola', 'chau']
        for palabra in palabras:
            clave = len(palabra)
            if clave in d:
                # la clave ya existe
                # entonces incremento en 1
                # el valor
                d[clave] = d[clave] + 1
            else:
                # la clave no existe
                # la creo
                d[clave] = 1
    
    archivo.close()
    return d

#print(agruparPorLongitud("archivo_palabras.txt"))
from queue import Queue as Cola
import random

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


bolillero = armarSecuencideBingo()
carton = [1,5]

print(list(bolillero.queue))
print(jugarCartonDeBingo(carton,bolillero))
print(list(bolillero.queue))
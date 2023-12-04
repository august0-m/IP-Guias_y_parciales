def frecuencias(nombre_archivo : str) -> dict:
    archivo = open(nombre_archivo, "r",encoding='utf8')
    d: dict = {} # inicializando/creando el diccionario

    for linea in archivo.readlines(): # ['a hola agruparPorLongitud\n', 'otra linea\n']
        palabras = linea.split()      # ['a', 'hola', 'chau']
        for palabra in palabras:
            if palabra in d:
                # la palabra ya existe
                # entonces incremento en 1 la cantidad de apariciones
                d[palabra] = d[palabra] + 1
            else:
                # aparece por primera vez palabra
                # la agrego al diccionario
                d[palabra] = 1

    archivo.close()
    return d
print(frecuencias("archivo_palabras.txt"))
    

def laPalabraMasFrecuente(nombre_archivo : str) -> str:
    d = frecuencias(nombre_archivo)
    palabraMasFrecuente: str
    frecuenciaMax: int = 0
    
    for palabra, frecuencia in d.items():
        if frecuencia > frecuenciaMax:
            frecuenciaMax = frecuencia
            palabraMasFrecuente = palabra
    
    return palabraMasFrecuente

print(laPalabraMasFrecuente("archivo_palabras.txt"))

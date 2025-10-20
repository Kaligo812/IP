import numpy as np
from random import randint

def pertenece(lista: list[int], e: int) -> bool:
    res: bool = False
    for elemento in lista:
        if (elemento == e):
            res = True
            break;    
    return res


def divide_a_todos(lista: list[int], d: int) -> bool:
    res: bool = True
    for elemento in lista:
        if (elemento % d != 0):
            res = False 
            break

    return res


def suma_total(lista: list[int]) -> int:
    suma: int = 0

    for elemento in lista:
        suma += elemento

    return suma


def maximo(lista: list[int]) -> int:
    mayor: int = lista[0] # asumo que lista no esta vacia

    for i in range(1,len(lista)):
        if (lista[i] > mayor): mayor = lista[i]

    return mayor


def minimo(lista: list[int]) -> int:
    menor: int = lista[0] # asumo que lista no esta vacia

    for i in range(1,len(lista)):
        if (lista[i] < menor): menor = lista[i]
    
    return menor
    

def ordenados(lista: list[int]) -> bool:
    res: bool = True
    for i in range(1,len(lista)):
        if (lista[i-1] > lista[i]): 
            res = False
            break

    return res


def pos_maximo(lista: list[int]):
    if (len(lista) == 0):
        return -1

    lista_max: int = maximo(lista)

    for i in range(len(lista)):
        if (lista_max == lista[i]): return i



def long_mayorASiete(palabras: list[str]) -> bool:
    res: bool = False

    for palabra in palabras:
        if (len(palabra) > 7):
            res = True
            break
    
    return res


def es_palindroma(palabra: str) -> bool:
    izq: int = 0
    der: int = len(palabra) - 1

    res: bool = True

    while (izq <= der):
        if (palabra[izq] != palabra[der]):
            res = False
            break
        izq += 1
        der -= 1

    return res



def iguales_consecutivos(lista: list[int]) -> bool:
    if (len(lista) < 3): return True

    n: int = lista[0]
    apariciones_de_n: int = 1


    for num in lista:
        if (num != n):
            n = num
            apariciones_de_n = 1
        else:
            apariciones_de_n += 1
        
        if (apariciones_de_n == 3):
            return True


    return False


def quitar_letra(palabra: str, letra: str, todas: bool = False) -> str:
    palabra_final: str = ""

    for i in range(len(palabra)):
        if (palabra[i] == letra and not todas):
            i += 1
            while (i < len(palabra)):
                palabra_final += palabra[i]
                i += 1
            
            break

        if (palabra[i] != letra):
            palabra_final += palabra[i]

    return palabra_final
        

def vocales_distintas(palabra: str) -> bool:
    vocales: str = "aeiou"

    for letra in palabra:
        if (letra in vocales):
            vocales = quitar_letra(vocales, letra)
    
    return len(vocales) <= 2


def subsecuencias_ordenadas(s: list[int]) -> list[int]:
    if (len(s) == 0):
        return [0]
        
    cant_nums_ordenados: int = 1 # asumo que s no esta vacia
    i: int = 1
    
    while (i < len(s)):
        if (s[i - 1] <= s[i]):
            cant_nums_ordenados += 1
        else:
            break
        
        i += 1
            
    return [cant_nums_ordenados] + subsecuencias_ordenadas(s[i:])


def pos_secuencia_ordenada_mas_larga(s: list[int]) -> int:
    tamanio_de_secuencias_ordenadas: list[int] = subsecuencias_ordenadas(s)
    max_tamanio: int = maximo(tamanio_de_secuencias_ordenadas)
    indice: int = 0
    
    for i in range(len(tamanio_de_secuencias_ordenadas)):
        if (tamanio_de_secuencias_ordenadas[i] == max_tamanio):
            indice = suma_total(tamanio_de_secuencias_ordenadas[:i])
            break
    
    
    return indice



def cant_digitos_impares(num: int) -> int:
    cant: int = 0
    
    while num > 0:
        if ((num % 10) % 2 == 1): cant += 1
        num //= 10
        
    return cant

def cantidad_de_digitos_impares(s: list[int]) -> int:
    cant: int = 0
    
    for num in s:
        cant += cant_digitos_impares(num)
        
    return cant
    

# Ejercicio 2

def ceros_en_posiciones_pares(s: list[int]):
    for i in range(len(s)):
        if (i % 2 == 0):
            s[i] = 0


def ceros_en_posiciones_pares2(s: list[int]) -> list[int]:
    res: list[int] = []

    for i in range(len(s)):
        if (i % 2 == 0):
            res.append(0)
        else:
            res.append(s[i])

    return res


def sin_vocales(frase: str) -> str:
    vocales: str = "aeiou"
    res: str = ""

    for letra in frase:
        if (not pertenece(vocales, letra)):
            res += letra
    
    return res


def reemplaza_vocales(frase: str) -> str:
    vocales: str = "aeiou"
    res: str = ""

    for letra in frase:
        if (not pertenece(vocales, letra)):
            res += letra
        else:
            res += "_"

    return res


def da_vuelta_str(frase: str) -> str:
    str_invertida: str = ""

    i: int = len(frase) - 1

    while (i >= 0):
        str_invertida += frase[i]
        i -= 1

    return str_invertida


def copiar_str(frase: str) -> str:
    res: str = ""

    for letra in frase:
        res += letra

    return res


def eliminar_repetidos(frase: str) -> str:
    str_sin_repetidos: str = ""
    copia: str = copiar_str(frase)

    i: int = 0
    copia_len = len(copia)

    while (i < copia_len):
        letra: str = copia[i]

        if (letra in quitar_letra(copia, letra)):
            copia = quitar_letra(copia, letra, todas=True)
            copia_len = len(copia)

        else:
            str_sin_repetidos += letra
            i += 1            

    return str_sin_repetidos


## Ejercicio 3
def resultadoMateria(notas: list[int]) -> int:
    todo_mayor_a_4: bool = True
    total: int = 0

    for nota in notas:
        if nota < 4:
            todo_mayor_a_4 = False
        total += nota
    
    promedio: float = total / len(notas)

    
    if (todo_mayor_a_4 and promedio >= 7):
        return 1
    elif (todo_mayor_a_4 and promedio >= 4):
        return 2
    else:
        return 3
    

# Ejercicio 4

def saldoActual(movimientos: list[tuple[str, int]]) -> int:
    saldo: int = 0

    for tipo, cantidad in movimientos:
        if tipo == "I":
            saldo += cantidad
        elif tipo == "R":
            saldo -= cantidad

    return saldo


# Ejercicio 6

def pertenece_a_cada_uno_version1(matriz: list[list[int]], e: int, res: list[bool]):
    for i in range(len(matriz)):
        res[i] = pertenece(matriz[i], e)

# Ojala entender para que existe una version 2 😔🤚
def pertenece_a_cada_uno_version2(matriz: list[list[int]], e: int, res: list[bool]):
    res.clear()

    for fila in matriz:
        esta_en_la_fila: bool = False

        for elemento in fila:
            if (elemento == e): 
                esta_en_la_fila = True

        res.append(esta_en_la_fila)


def pertenece_a_cada_uno_version3(matriz: list[list[int]], e: int) -> list[bool]:
    res: list[bool] = []

    for fila in matriz:
        res.append(pertenece(fila, e))
    
    return res


def es_matriz(lista2d: list[list[int]]) -> bool:
    if (len(lista2d) == 0):
        return False
    
    nro_columnas: int = len(lista2d[0])

    for fila in lista2d:
        if (len(fila) != nro_columnas):
            return False
        
    return True


def filas_ordenadas(matriz: list[list[int]], res: list[bool]):
    res.clear()
    
    for fila in matriz:
        res.append(ordenados(fila))


def columna(matriz: list[list[int]], c: int) -> list[int]:
    columna: list[int] = []

    for i in range(len(matriz)):
        columna.append(matriz[i][c])

    return columna


def columnas_ordenadas(matriz: list[list[int]]) -> list[bool]:
    res: list[int] = []

    for i in range(len(matriz[0])):
        res.append(ordenados(columna(matriz, i)))

    return res


def transponer(matriz: list[list[int]]) -> list[list[int]]:
    matriz_transpuesta: list[list[int]] = []

    for i in range(len(matriz[0])):
        matriz_transpuesta.append(columna(matriz, i))

    return matriz_transpuesta


def obtener_ganador(lista: list[str]) -> int:
    resultado: dict[str, int] = {
        "O":0,
        "X":1,
        " ":2
    }
    target: str = lista[0]

    for i in range(1, len(lista)):
        if lista[i] != target:
            return 2
        
    return resultado[target]


def obtener_diagonales(matriz: list[list[any]]) -> list[list[any]]:
    diagonales: list[list[any]] = []

    i: int = 0
    j: int = 0
    diagonal: list[any] = []

    # diagonal izq-der
    while (i < len(matriz) and j < len(matriz[0])):
        diagonal.append(matriz[i][j])
        i += 1
        j += 1

    diagonales.append(diagonal.copy())
    diagonal.clear()

    # diagonal der-izq
    i = 0
    j = len(matriz[0]) - 1

    while (i < len(matriz) and j >= 0):
        diagonal.append(matriz[i][j])
        i += 1
        j -= 1

    diagonales.append(diagonal.copy())
    diagonal.clear()

    return diagonales

def quien_gana_tateti(matriz3x3: list[list[str]]) -> int:
    ganador: int = 2

    for fila in matriz3x3:
        ganador = obtener_ganador(fila)
        if (ganador != 2):
            return ganador

    for columna in transponer(matriz3x3):
        ganador = obtener_ganador(columna)
        if (ganador != 2):
            return ganador

    # chequeoando diagnolaes
    diagonales: list[list[str]] = obtener_diagonales(matriz3x3)

    for diagonal in diagonales:
        ganador = obtener_ganador(diagonal)
        if (ganador != 2):
            return ganador

    return ganador


# Ejercicio 7
"""
problema multiplicar_matrices(in A: seq(seq(Z)), in B: seq(seq(Z))) : seq(seq(Z)) {
    requiere: {es_matriz(A) y es_matriz(B)}
    requiere: {|A[0]| = |B|}
    asegura: {|res| = |A| y |res[0]| = |B[0]|}
    asegura: {par todo i entero, 0<=i<|res| y para todo j entero 0<=j<|res[0]|,
        res[i][j] es la suma de multiplicar cada elemento de A[i] por el respectivo
        elemento de columna(B, j)    
    }
}
"""
def multiplicar_matrices(A: list[list[int]], B: list[list[int]]):
    res: list[list[int]] = []

    for fila in A:
        fila_multiplicada: list[int] = []

        for columna in transponer(B):
            suma: int = 0
            
            for i in range(len(fila)):
                suma += fila[i] * columna[i]

            fila_multiplicada.append(suma)
        
        res.append(fila_multiplicada)

    return res


def generar_matriz_cuadrada(d: int) -> list[list[int]]:
    m: list[list[int]] = []
    
    for i in range(d):
        fila: list[int] = []
        for j in range(d):
            fila.append(randint(0,9))
        
        m.append(fila)

    return m


def exponenciacion_matriz(d: int, p: int) -> list[list[int]]:
    m: list[list[int]] = generar_matriz_cuadrada(d)

    # copio la matriz m
    res: list[list[int]] = [] + m

    for _ in range(1,p):
        res = multiplicar_matrices(res, m)

    return res


# 4 programas interactivos sobre secuencias
def ingresar_estudiantes() -> list[str]:
    lista_de_estudiantes: list[str] = []

    print("\"listo\" o ENTER para terminar")

    estudiante: str = input("Estudiante: ")

    while (estudiante != "listo" and estudiante):
        lista_de_estudiantes.append(estudiante)
        estudiante = input("Estudiante: ")

    return lista_de_estudiantes

# La creo para acostumbrarme a no usar funciones no permitidas
def es_entero(texto: str) -> bool: 
    digitos: str = "0123456789"

    i: int = 0

    if (str[0] == '-'):
        i = 1

    while (i < len(texto)):
        if (not str[i] in digitos):
            return False

    return True

def obtener_monto() -> int:
    monto: str = input("monto: ")

    if (not es_entero(monto)):
        return obtener_monto()
  

    if (int(monto) < 0):
        return obtener_monto()

    return int(monto)

def monedero_electronico() -> list[tuple[str, int]]:
    historial: list[tuple[str, int]] = []

    print("C - cargar creditos\nD - descontar creditso\nX - Finalizar el programa")

    modo: str = input("modo: ")

    while (modo != "X"):
        if (modo == "C" or modo == "D"):
            historial.append((modo, obtener_monto()))
        else:
            print("Ingrese un modo valido")
        
        modo = input("modo: ")

    return historial
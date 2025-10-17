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


# Ejercicio 5
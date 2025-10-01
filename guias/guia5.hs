-- Ejercicio 1
longitud :: [t] -> Integer
longitud [] = 0
longitud xs = 1 + longitud (tail xs)

ultimo :: [t] -> t
ultimo [x]  = x
ultimo xs   = ultimo (tail xs)

principio :: [t] -> [t]
principio [x]       = []
principio (x:xs)    = x:principio xs

reverso :: [t] -> [t]
reverso []      = []
reverso (x:xs)  = reverso xs ++ [x]

-- Ejercicio 2
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs)
    | e == x = True
    | otherwise = pertenece e xs

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:xs)
    | x == (head xs) && todosIguales xs = True
    | otherwise = False

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:xs)
    | cantDeApariciones x xs /= 0 = False
    | otherwise = todosDistintos xs

cantDeApariciones :: (Eq t) => t -> [t] -> Integer
cantDeApariciones _ [] = 0
cantDeApariciones e (x:xs)
    | e == x = 1 + cantDeApariciones e xs
    | otherwise = cantDeApariciones e xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos xs = not (todosDistintos xs)

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x:xs)
    | e /= x = x:quitar e xs
    | otherwise = xs

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x:xs)
    | e /= x = x:quitarTodos e xs
    | otherwise = quitarTodos e xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = [x] ++ eliminarRepetidos (quitarTodos x xs)

esSubconjunto :: (Eq t) => [t] -> [t] -> Bool
esSubconjunto [] _ = True
esSubconjunto (x:xs) ys
    | pertenece x ys == True = esSubconjunto xs ys
    | otherwise = False

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = esSubconjunto xs ys && esSubconjunto ys xs

esCapicua :: (Eq t) => [t] -> Bool
esCapicua []    = True
esCapicua [x]   = True
esCapicua (x:xs)
    | x == ultimo xs = esCapicua (principio xs)
    | otherwise = False

-- Ejercicio 3
sumatoria :: (Num t) => [t] -> t
-- Defino para [] porque asi esta en la especificacion
-- pero esto que sentido tiene(???
sumatoria []        = 0
sumatoria (x:xs)    = x + sumatoria xs

productoria :: (Num t) => [t] -> t
-- Y ahora que?
productoria []      = 1
productoria (x:xs)  = x * productoria xs

maximo :: (Ord t) => [t] -> t
maximo [x] = x
maximo (x:xs)
    | x >= maximo xs = x
    | otherwise = maximo xs


sumarN :: (Num t) => t -> [t] -> [t]
sumarN _ []     = []
sumarN n (x:xs) = (x+n):sumarN n xs

sumarElPrimero :: (Num t) => [t] -> [t]
sumarElPrimero []  = []
sumarElPrimero xs   = sumarElPrimero (principio xs) ++ [head xs + ultimo xs]

sumarElUltimo :: (Num t) => [t] -> [t]
sumarElUltimo []        = []
sumarElUltimo [x]       = [x+x]
sumarElUltimo (x:xs)    = (x + ultimo xs):sumarElUltimo xs


pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)
    | mod x 2 == 0 = x:pares xs
    | otherwise = pares xs

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs)
    | mod x n == 0 = x:(multiplosDeN n xs)
    | otherwise = multiplosDeN n xs


ordenar :: (Eq t, Ord t) => [t] -> [t]
ordenar [] = []
ordernar xs = ordenar (quitar (maximo xs) xs) ++ [maximo xs]

ordenarDecreciente :: (Eq t, Ord t) => [t] -> [t]
ordenarDecreciente [] = []
ordenarDecreciente xs = [maximo xs] ++ ordenarDecreciente (quitar (maximo xs) xs)


-- Ejercicio 4
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:xs)
    | x == ' ' && (head xs) == ' ' = sacarBlancosRepetidos xs
    | otherwise = x:sacarBlancosRepetidos xs

sacarBlancosEnLosExtremos :: [Char] -> [Char]
sacarBlancosEnLosExtremos [] = []
sacarBlancosEnLosExtremos [' '] = []
sacarBlancosEnLosExtremos [x] = [x]
sacarBlancosEnLosExtremos xs
    | head xs == ' ' && ultimo xs == ' ' = principio (tail xs)
    | head xs == ' ' = tail xs
    | ultimo xs == ' ' = principio xs
    | otherwise = xs

contarPalabras :: [Char] -> Integer
contarPalabras xs = cantDeApariciones ' ' (sacarBlancosEnLosExtremos (sacarBlancosRepetidos xs)) + 1

sacarBlancos :: [Char] -> [Char]
sacarBlancos [] = []
sacarBlancos [x] = [x]
sacarBlancos (x:xs)
    | x == head xs && x == ' ' = sacarBlancos xs
    | otherwise = x:sacarBlancos xs


primeraPalabra :: [Char] -> [Char]
primeraPalabra [] = []
primeraPalabra [x] = [x]
primeraPalabra (x:xs)
    | x /= ' ' = x:primeraPalabra xs
    | otherwise = []

quitarPrimeraPalabra :: [Char] -> [Char]
quitarPrimeraPalabra [] = []
quitarPrimeraPalabra [x] = []
quitarPrimeraPalabra (x:xs)
    | x == ' ' = xs
    | otherwise = quitarPrimeraPalabra xs

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras xs
    | head texto /= ' ' = [primeraPalabra texto] ++ palabras (quitarPrimeraPalabra texto)
    | otherwise = palabras texto
    where texto = sacarBlancosEnLosExtremos (sacarBlancosRepetidos xs)

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga xs
    | longitud (primeraPalabra texto) >= longitud (palabraMasLarga (quitarPrimeraPalabra texto)) = primeraPalabra texto
    | otherwise = palabraMasLarga (quitarPrimeraPalabra texto)
    where texto = sacarBlancosEnLosExtremos (sacarBlancosRepetidos xs)


aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (xs:xss) = xs ++ aplanar xss

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos [xs] = xs
aplanarConBlancos (xs:xss) = xs ++ [' '] ++ aplanarConBlancos xss


nBlancos :: Integer -> [Char]
nBlancos 0 = []
nBlancos n = ' ':nBlancos (n-1)

aplanarConNBlancos :: Integer -> [[Char]] -> [Char]
aplanarConNBlancos _ [] = []
aplanarConNBlancos _ [xs] = xs
aplanarConNBlancos n (xs:xss) = xs ++ nBlancos n ++ aplanarConNBlancos n xss

-- Ejercicio 4.b: En serio?

-- Ejercicio 5
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x]
sumaAcumulada xs = sumaAcumulada (principio xs) ++ [sumatoria xs]




-- 5.b
menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n i
    | mod n i == 0 = i
    | otherwise = menorDivisorDesde n (i+1)

menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorDesde n 2

esPrimo :: Integer -> Bool
esPrimo n = menorDivisor n == n

{-problema primerPrimoDesde(n: N, i: N) : N{
    requiere: {n, i >= 2}
    asegura: {res es el primo mas chico >= i tal que n % res = 0}
}-}
primerPrimoDesde :: Integer -> Integer -> Integer
primerPrimoDesde n i
    | esPrimo i && mod n i == 0 = i
    | otherwise = primerPrimoDesde n (i+1)

primerPrimo :: Integer -> Integer
primerPrimo n = primerPrimoDesde n 2

{-problema factoresPrimos(n: N) : seq(N) {
    requiere: {n >= 2}
    asegura: {res_i es un numero primo}
    asegura: {productorio desde i = 0 hasta |res|-1 de res_i es igual a n}
}-}
factoresPrimos :: Integer -> [Integer]
factoresPrimos 1 = []
factoresPrimos 2 = [2]
factoresPrimos n = [primerPrimo n] ++ factoresPrimos (div n (primerPrimo n))

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos xs = [factoresPrimos (head xs)] ++ descomponerEnPrimos (tail xs)


-- Ejercicio 6
type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos _ [] = False
enLosContactos nombre (contacto:contactos)
    | nombre == fst contacto = True
    | otherwise = enLosContactos nombre contactos

agregarContacto :: Contacto -> ContactosTel -> ContactosTel
agregarContacto persona [] = [persona]
agregarContacto persona (contacto:contactos)
    | fst persona /= fst contacto = contacto:agregarContacto persona contactos
    | otherwise = persona:contactos

eliminarContacto :: Nombre -> ContactosTel -> ContactosTel
eliminarContacto _ [] = []
eliminarContacto nombre (contacto:contactos)
    | nombre == fst contacto = contactos
    | otherwise = contacto:eliminarContacto nombre contactos


-- Ejercicio 7 
type Identificacion = Integer
type Ubicacion = Texto
type Disponibilidad = Bool
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]


existeElLocker :: Identificacion -> MapaDeLockers -> Bool
existeElLocker _ [] = False
existeElLocker id (locker:lockers)
    | id == fst locker = True
    | otherwise = existeElLocker id lockers


ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion
ubicacionDelLocker target ((id, (_, ubicacion)):lockers)
    | target == id = ubicacion
    | otherwise = ubicacionDelLocker target lockers


estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Bool
estaDisponibleElLocker target ((id, (disponible, _)):lockers)
    | target == id = disponible
    | otherwise = estaDisponibleElLocker target lockers


ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers
ocuparLocker target ((id, (disponible, ubicacion)):lockers)
    | target == id = (id, (False, ubicacion)):lockers
    | otherwise = (id, (disponible, ubicacion)):ocuparLocker target lockers

-- Ejercicio 8
filtrar :: (t -> Bool) -> [t] -> [t]
filtrar _ [] = []
filtrar func (x:xs)
    | func x = x:filtrar func xs
    | otherwise = filtrar func xs

-- No se me ocurre como traducirlo xd
mapear :: (t -> t) -> [t] -> [t]
mapear _ [] = []
mapear func (x:xs) = (func x):mapear func xs


sumaTotal :: (Num t) => [[t]] -> t
sumaTotal [] = 0
sumaTotal xss = sumatoria (head xss) + sumaTotal (tail xss)


cantidadDeApariciones :: (Num t, Eq t) => t -> [[t]] -> t
cantidadDeApariciones _ [] = 0
cantidadDeApariciones e (xs:xss) = sumatoria (filtrar (\x -> x == e) xs) + cantidadDeApariciones e xss


estaAlPrincipio :: String -> String -> Bool
estaAlPrincipio [] _ = True
estaAlPrincipio _ [] = False
estaAlPrincipio (l1:str1) (l2:str2)
    | l1 == l2 = estaAlPrincipio str1 str2
    | otherwise = False

-- "ss" -> "sss" -> 2
estaEn :: String -> String -> Int
estaEn _ [] = 0
estaEn target (l:str)
    | head target == l && estaAlPrincipio target (l:str) = 1 + estaEn target str
    | otherwise = estaEn target str

contarPalabrasEnFila :: String -> [String] -> Int
contarPalabrasEnFila _ [] = 0
contarPalabrasEnFila target (xs:xss) = estaEn target xs + contarPalabrasEnFila target xss

contarPalabras2 :: String -> [[String]] -> Int
contarPalabras2 _ [] = 0
contarPalabras2 target (fila:matriz) = contarPalabrasEnFila target fila + contarPalabras2 target matriz



cantidadDeAparicionesEnFila :: (Eq a) => a -> [a] -> Integer
cantidadDeAparicionesEnFila e [] = 0
cantidadDeAparicionesEnFila e (x:xs)
    | e == x = 1 + cantidadDeAparicionesEnFila e xs
    | otherwise = cantidadDeAparicionesEnFila e xs

cantidadDeApariciones2 :: (Eq a) => a -> [[a]] -> Integer
cantidadDeApariciones2 _ [] = 0
cantidadDeApariciones2 e (xs:xss) = cantidadDeAparicionesEnFila e xs + cantidadDeApariciones2 e xss


multiplicarPorEscalar :: Integer -> [[Integer]] -> [[Integer]]
multiplicarPorEscalar _ [] = []
multiplicarPorEscalar k (fila:matriz) = (mapear (\x -> x * k) fila):multiplicarPorEscalar k matriz


concatenarFilasAux :: [String] -> String
concatenarFilasAux [] = ""
concatenarFilasAux xs = head xs ++ concatenarFilasAux (tail xs)

concatenarFilas :: [[String]] -> [String]
concatenarFilas [] = []
concatenarFilas (xs:xss) = concatenarFilasAux xs:concatenarFilas xss


iEsimoElemento :: Integer -> [t] -> t
iEsimoElemento 0 xs = head xs
iEsimoElemento n xs = iEsimoElemento (n - 1) (tail xs)

iEsimaFila :: Integer -> [[a]] -> [a]
iEsimaFila 0 xss = head xss
iEsimaFila n xss = iEsimaFila (n - 1) (tail xss)

iEsimaColumna :: Integer -> [[a]] -> [a]
iEsimaColumna _ [] = []
iEsimaColumna n (xs:xss) = (iEsimoElemento n xs):iEsimaColumna n xss


crearFilaDeMatrizIdentidad :: Integer -> Integer -> [Integer]
crearFilaDeMatrizIdentidad 0 0 = [1]
crearFilaDeMatrizIdentidad i n
    | i == 0 = 1:crearFilaDeMatrizIdentidad (i - 1) (n - 1)
    | n == 0 = [0]
    | otherwise = 0:crearFilaDeMatrizIdentidad (i - 1) (n - 1)

construirMatrizIdentidad :: Integer -> Integer -> [[Integer]]
construirMatrizIdentidad n i
    | i > n = []
    | otherwise = (crearFilaDeMatrizIdentidad i n):construirMatrizIdentidad n (i + 1)


matrizIdentidad :: Integer -> [[Integer]]
matrizIdentidad n = construirMatrizIdentidad n 0


cantidadParesColumnas :: Integer -> [[Integer]] -> Integer
cantidadParesColumnas i matriz = longitud matriz - sumatoria(mapear (\x -> mod x 2) (iEsimaColumna i matriz))
type Fila = [Int]
type Tablero = [Fila]
type Posicion = (Int, Int)
type Camino = [Posicion]


-- Ejercicio 5
maximoEnFila :: Fila -> Int
maximoEnFila [x] = x
maximoEnFila (x:xs)
    | x > maximoEnFila xs = x
    | otherwise = maximoEnFila xs


maximo :: Tablero -> Int
maximo [xs] = maximoEnFila xs
maximo (xs:xss)
    | maximoEnFila xs > maximo xss = maximoEnFila xs
    | otherwise = maximo xss


-- Ejercicio 6
cantDeApariciones :: (Eq a) => [a] -> a -> Int
cantDeApariciones [] _ = 0
cantDeApariciones (x:xs) e
    | x == e = 1 + cantDeApariciones xs e
    | otherwise = cantDeApariciones xs e


cantDeAparicionesEnMatriz :: (Eq a) => [[a]] -> a -> Int
cantDeAparicionesEnMatriz [] _ = 0
cantDeAparicionesEnMatriz (xs:xss) e = cantDeApariciones xs e + cantDeAparicionesEnMatriz xss e


masRepetidoEnFila :: Fila -> Int
masRepetidoEnFila (x:xs)
    | (cantDeApariciones (x:xs) x) > cantDeApariciones xs (masRepetidoEnFila xs) = x
    | otherwise = masRepetidoEnFila xs


masRepetido :: Tablero -> Int
masRepetido (xs:xss)
    | cantDeAparicionesEnMatriz (xs:xss) (masRepetidoEnFila xs) > cantDeAparicionesEnMatriz xss (masRepetido xss) = masRepetidoEnFila xs
    | otherwise = masRepetido xss



-- Ejercicio 7
iEsimoElementoEnFila :: [t] -> Int -> t
iEsimoElementoEnFila (x:xs) 0 = x
iEsimoElementoEnFila (x:xs) i = iEsimoElementoEnFila xs (i-1)

obtenerElementoDeTablero :: Tablero -> Posicion -> Int
obtenerElementoDeTablero (xs:xss) (0, j) = iEsimoElementoEnFila xs j
obtenerElementoDeTablero (xs:xss) (i, j) = obtenerElementoDeTablero xss (i-1, j)

valoresDeCamino :: Tablero -> Camino -> [Int]
valoresDeCamino _ [] = []
valoresDeCamino tablero (posicion:camino) = (obtenerElementoDeTablero tablero (fst posicion - 1, snd posicion - 1)):valoresDeCamino tablero camino


-- Ejercicio 8
fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)


esCaminoFibo :: [Int] -> Int -> Bool
esCaminoFibo [x] n = x == fibonacci n
esCaminoFibo (x:xs) n
    | x == fibonacci n = esCaminoFibo xs (n + 1)
    | otherwise = False
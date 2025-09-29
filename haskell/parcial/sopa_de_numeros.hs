type Fila = [Int]
type Tablero = [Fila]
type Posicion = (Int, Int)
type Camino = [Posicion]


-- Ejercicio 1
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


-- Ejercicio 2
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



-- Ejercicio 3

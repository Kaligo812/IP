{-
Ejercicio 1
probelma cantidadNumerosAbundantes(d, h: Z) : Z {
    requiere: {0 < d <= h}
    asegura: {res es la cantidad de numeros abundantes en el rango [d..h]}
}

problema sumaDivisoresDesde(i, n: N) : N {
    requiere: {i < n}
    asegura: {res es la suma de los divisores de n en [i..n-1]}
}

-}

sumaDivisoresDesde :: Integer -> Integer -> Integer
sumaDivisoresDesde i n
    | i >= n = 0
    | mod n i == 0 = i + sumaDivisoresDesde (i + 1) n
    | otherwise = sumaDivisoresDesde (i + 1) n

esNumeroAbundante :: Integer -> Bool
esNumeroAbundante n = sumaDivisoresDesde 1 n > n

cantidadNumerosAbundantes :: Integer -> Integer -> Integer
cantidadNumerosAbundantes d h
    | d > h = 0
    | esNumeroAbundante d = 1 + cantidadNumerosAbundantes (d + 1) h
    | otherwise = cantidadNumerosAbundantes (d + 1) h



-- Ejercicio 2
cursadasVencidasAux :: [(String, Integer, Integer)] -> [String]
cursadasVencidasAux [] = []
cursadasVencidasAux ((nombre, anio, cuatri):cursadas)
    | anio < 2021 || (anio == 2021 && cuatri <= 1) = nombre:cursadasVencidasAux cursadas
    | otherwise = cursadasVencidasAux cursadas


pertenece :: (Eq a) => a -> [a] -> Bool
pertenece _ [] = False
pertenece e (x:xs)
    | e == x = True
    | otherwise = pertenece e xs

deduplicar :: (Eq a) => [a] -> [a]
deduplicar [] = []
deduplicar (x:xs)
    | pertenece x xs = deduplicar xs
    | otherwise = x:deduplicar xs

cursadasVencidas :: [(String, Integer, Integer)] -> [String]
cursadasVencidas xs = deduplicar (cursadasVencidasAux xs)

-- Ejercicio 3
saturarEnUmbralHastaNegativo :: [Integer] -> Integer -> [Integer]
saturarEnUmbralHastaNegativo [] _ = []
saturarEnUmbralHastaNegativo (x:xs) u
    | x < 0 = []
    | x <= u = x:saturarEnUmbralHastaNegativo xs u
    | x > u = u:saturarEnUmbralHastaNegativo xs u


-- Ejercicio 4
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

filtrar :: (t -> Bool) -> [t] -> [t]
filtrar _ [] = []
filtrar func (x:xs)
    | func x = x:filtrar func xs
    | otherwise = filtrar func xs

iEsimoElemento :: [t] -> Integer -> t
iEsimoElemento (x:xs) 0 = x
iEsimoElemento (x:xs) i = iEsimoElemento xs (i - 1)

iEsimaColumna :: [[t]] -> Integer -> [t]
iEsimaColumna [] _ = []
iEsimaColumna (xs:xss) i = (iEsimoElemento xs i):iEsimaColumna xss i

cantidadParesColumna :: [[Integer]] -> Integer -> Integer
cantidadParesColumna xss i = longitud (filtrar (\x -> mod x 2 == 0) (iEsimaColumna xss (i - 1)))
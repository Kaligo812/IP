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


cursadasVencidas :: [(String, Integer, Integer)] -> [String]
cursadasVencidas [] = []
cursadasVencidas ((nombre, anio, cuatri):cursadas)
    | anio < 2021 || (anio == 2021 && cuatri <= 1) = nombre:cursadasVencidas cursadas
    | otherwise = cursadasVencidas cursadas
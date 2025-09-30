-- Ejercicio 9
divisoresDesde :: Int -> Int -> [Int]
divisoresDesde _ 1 = [1]
divisoresDesde i n
    | n == i = []
    | mod n i == 0 = i:divisoresDesde (i + 1) n
    | otherwise = divisoresDesde (i + 1) n

divisoresPropios :: Int -> [Int]
divisoresPropios n = divisoresDesde 1 n


-- Ejercicio 10
sumatoria :: (Num t) => [t] -> t
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs


sonAmigos :: Int -> Int -> Bool
sonAmigos n m = sumatoria (divisoresPropios n) == m && sumatoria (divisoresPropios m) == n


-- Ejercicio 11
nPerfectoDesde :: Int -> Int
nPerfectoDesde n
    | sumatoria (divisoresPropios n) == n = n
    | otherwise = nPerfectoDesde (n + 1)


nEsimoPerfecto :: Int -> Int
nEsimoPerfecto 1 = 1
nEsimoPerfecto n = nPerfectoDesde (nEsimoPerfecto (n - 1) + 1)

losPrimerosNPerfectos :: Int -> [Int]
losPrimerosNPerfectos 0 = []
losPrimerosNPerfectos n = losPrimerosNPerfectos (n - 1) ++ [nEsimoPerfecto n] 


-- Ejercicio 12
amigosDe :: Int -> [Int] -> [(Int, Int)]
amigosDe _ [] = []
amigosDe n (x:xs)
    | sumatoria (divisoresPropios n) == x && sumatoria (divisoresPropios x) == n = (n,x):amigosDe n xs
    | otherwise = amigosDe n xs

listaDeAmigos :: [Int] -> [(Int, Int)]
listaDeAmigos [] = []
listaDeAmigos (x:xs) = (amigosDe x xs) ++ listaDeAmigos xs
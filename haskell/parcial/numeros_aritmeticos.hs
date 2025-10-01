divisoresPropiosAux :: Integer -> Integer -> [Integer]
divisoresPropiosAux 1 _ = [1]
divisoresPropiosAux n i
    | mod n i == 0 = i:divisoresPropiosAux (div n i) i
    | otherwise = divisoresPropiosAux n (i+1)


divisoresPropios :: Integer -> [Integer]
divisoresPropios n = divisoresPropiosAux n 2


sumatoria :: (Num a) => [a] -> a
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs


longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

esNumeroAritmetico :: Integer -> Bool
esNumeroAritmetico n = mod (sumatoria (divisoresPropios n)) (longitud (divisoresPropios n)) == 0


numeroAritmeticoDesde :: Integer -> Integer
numeroAritmeticoDesde i
    | esNumeroAritmetico i = i
    | otherwise = numeroAritmeticoDesde (i + 1)

nEsimoNumeroAritmetico :: Integer -> Integer
nEsimoNumeroAritmetico 1 = 1
nEsimoNumeroAritmetico n = numeroAritmeticoDesde (nEsimoNumeroAritmetico (n - 1) + 1)


primerosKNumerosAritmeticos :: Integer -> [Integer]
primerosKNumerosAritmeticos 1 = [nEsimoNumeroAritmetico 1]
primerosKNumerosAritmeticos n = primerosKNumerosAritmeticos (n - 1) ++ [nEsimoNumeroAritmetico n]
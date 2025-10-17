module SistemaDeStock where




type Producto = String
type Mercaderia = [Producto]
type Stock = [(Producto, Integer)]
type Dinero = Float
type Precios = [(Producto, Dinero)]


-- Ejercicio 1
cantDeApariciones :: (Eq a) => a -> [a] -> Integer
cantDeApariciones _ [] = 0
cantDeApariciones e (x:xs)
    | e == x = 1 + cantDeApariciones e xs
    | otherwise = cantDeApariciones e xs

removerElemento :: (Eq a) => a -> [a] -> [a]
removerElemento _ [] = []
removerElemento e (x:xs)
    | e == x = removerElemento e xs
    | otherwise = x:removerElemento e xs

generarStock :: Mercaderia -> Stock
generarStock [] = []
generarStock (producto:productos) = (producto, 1 + cantDeApariciones producto productos):generarStock (removerElemento producto productos)


-- Ejercicio 2
stockDeProducto :: Stock -> Producto -> Integer
stockDeProducto [] _ = 0
stockDeProducto ((producto, cantidad):stock) target
    | target == producto = cantidad
    | otherwise = stockDeProducto stock target



-- Ejercicio 3
obtenerPrecio :: Producto -> Precios -> Dinero
obtenerPrecio target ((producto, precio):lista_de_precios)
    | target == producto = precio
    | otherwise = obtenerPrecio target lista_de_precios

dineroEnStock :: Stock -> Precios -> Dinero
dineroEnStock [] _ = 0
dineroEnStock ((producto, cantidad):stock) precios = obtenerPrecio producto precios * fromIntegral cantidad + dineroEnStock stock precios


-- Ejercicio 4
aplicarOferta :: Stock -> Precios -> Precios
aplicarOferta _ [] = []
aplicarOferta stock ((producto, precio):lista_de_precios)
    | stockDeProducto stock producto > 10 = (producto, precio * 0.8):aplicarOferta stock lista_de_precios
    | stockDeProducto stock producto <= 10 = (producto, precio):aplicarOferta stock lista_de_precios
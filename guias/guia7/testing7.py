import unittest
import guia7


class test_igualesConsecutivos(unittest.TestCase):
    def test_lista_vacia(self):
        self.assertTrue(guia7.iguales_consecutivos([]))

    def test_len_menor_a_3(self):
        self.assertTrue(guia7.iguales_consecutivos([1]))
    

    def test_solo_3_iguales(self):
        self.assertTrue(guia7.iguales_consecutivos([1,1,1]))
    
    def test_solo_3_diferentes(self):
        self.assertFalse(guia7.iguales_consecutivos([1,2,1]))

    
    def test_3iguales_y_mas(self):
        lista: list[int] = [1,21,3,1,1,1,412,2,4]
        self.assertTrue(guia7.iguales_consecutivos(lista))

    
    def test_lista_larga_false(self):
        lista: list[int] = [1,21,3,1,1,2,412,2,4]
        self.assertFalse(guia7.iguales_consecutivos(lista))
    

class test_vocalesDistintas(unittest.TestCase):
    def test_str_vacia(self):
        self.assertFalse(guia7.vocales_distintas(""))

    def test_str_len_menor_3(self):
        self.assertFalse(guia7.vocales_distintas("ab"))

    def test_3vocales_disntinas(self):
        self.assertTrue(guia7.vocales_distintas("aei"))
    
    def test_3vocales_distintas_y_mas(self):
        palabra: str = "abecedario"
        self.assertTrue(guia7.vocales_distintas(palabra))
    
    def test_palabra_larga_falso(self):
        palabra: str = "qwertypasdfjgkl"
        self.assertFalse(guia7.vocales_distintas(palabra))


class test_posSecuenciaOrdenadaMasLarga(unittest.TestCase):
    def test_un_elemento(self):
        lista: list[int] = [1]
        indice: int = 0
        
        self.assertEqual(guia7.pos_secuencia_ordenada_mas_larga(lista), indice)
        
    def test_lista_decreciente(self):
        lista: list[int] = [5,4,3,2,1]
        indice: int = 0
        
        self.assertEqual(guia7.pos_secuencia_ordenada_mas_larga(lista), indice)
        
    def test_maximo_en_el_medio(self):
        lista: list[int] = [1,2,0,4,7,9,1]
        indice: int = 2
        
        self.assertEqual(guia7.pos_secuencia_ordenada_mas_larga(lista), indice)
        
    
    def test_dos_maximos(self):
        lista: list[int] = [1,2,0,4,7,9,1,9,0,4,7,9,-1]
        indice: int = 2
        
        self.assertEqual(guia7.pos_secuencia_ordenada_mas_larga(lista), indice)



# Ej 3
class test_resultadoMateria(unittest.TestCase):
    def test_todoMayorA4YPromedio7(self):
        notas: list[int] = [10,4]

        self.assertEqual(guia7.resultadoMateria(notas), 1)

    def test_soloMayorA4(self):
        notas: list[int] = [4,4,4]
        
        self.assertEqual(guia7.resultadoMateria(notas), 2)

    def test_desaprobado(self):
        notas: list[int] = [1,10,10,10]

        self.assertEqual(guia7.resultadoMateria(notas), 3)
    

#Ej 6

class test_esMatriz(unittest.TestCase):
    def test_lista2d_vacia(self):
        self.assertFalse(guia7.es_matriz([]))

    def test_lista2d_cuadrada(self):
        self.assertTrue(guia7.es_matriz([[1]]))

    def test_lista2d_cuadrada2(self):
        matriz: list[list[int]] = [
            [1,2,3],
            [4,5,6],
            [7,8,9]
        ]
        self.assertTrue(guia7.es_matriz(matriz))

    def test_lista2d_rectangular(self):
        matriz: list[list[int]] = [
            [1,2,3,4],
            [5,6,7,8],
            [9,10,11,12]
        ]

        self.assertTrue(guia7.es_matriz(matriz))

    def test_distintos_largos_de_fila(self):
        lista2d: list[list[int]] = [
            [1,2,3],
            [1,2],
            [1,2,3,4,5],
            [1]
        ]

        self.assertFalse(guia7.es_matriz(lista2d))


class test_quienGanaTateti(unittest.TestCase):
    def test_tablero_vacio(self):
        tablero: list[list[str]] = [
            [" "," "," "],
            [" "," "," "],
            [" "," "," "]
        ]

        self.assertEqual(guia7.quien_gana_tateti(tablero), 2)

    def test_gana_horizontalmente(self):
        tablero: list[list[str]] = [
            ["O","X","O"],
            ["X","X","X"],
            ["O","O"," "]
        ]

        self.assertEqual(guia7.quien_gana_tateti(tablero), 1)

    def test_gana_horizontalmente2(self):
        tablero: list[list[str]] = [
            ["X","O","X"],
            ["O","O","O"],
            ["X","X",""]
        ]

        self.assertEqual(guia7.quien_gana_tateti(tablero), 0)
    
    def test_gana_verticalmente(self):
        tablero: list[list[str]] = [
            ["O","X","X"],
            ["O","X","X"],
            ["O"," ","O"]
        ]

        self.assertEqual(guia7.quien_gana_tateti(tablero), 0)
    
    def test_gana_verticalmente2(self):
        tablero: list[list[str]] = [
            ["X","O","O"],
            ["X","O","O"],
            ["X"," ","X"]
        ]
        
        self.assertEqual(guia7.quien_gana_tateti(tablero), 1)
    
    def test_gana_diagonalmente(self):
        tablero: list[list[str]] = [
            ["X"," ","O"],
            [" ","X","O"],
            [" "," ","X"]
        ]

        self.assertEqual(guia7.quien_gana_tateti(tablero), 1)

    def test_gana_diagonalmente2(self):
        tablero: list[list[str]] = [
            ["O"," ","X"],
            [" ","O","X"],
            [" "," ","O"]
        ]

        self.assertEqual(guia7.quien_gana_tateti(tablero), 0)

    def test_empate(self):
        tablero: list[list[str]] = [
            ["O","X","O"],
            ["O","X","X"],
            ["X","O","X"]
        ]        

        self.assertEqual(guia7.quien_gana_tateti(tablero), 2)


if __name__ == "__main__":
    unittest.main(verbosity=3)
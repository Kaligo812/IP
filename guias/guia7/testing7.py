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



if __name__ == "__main__":
    unittest.main(verbosity=3)
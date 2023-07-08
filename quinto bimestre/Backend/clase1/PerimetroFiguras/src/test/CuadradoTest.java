package test;

import main.Cuadrado;
import main.Figura;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;


    public class CuadradoTest {
        @Test
        public void deberíaDarOkAlTenerUnNumero(){ //Escenario A
            //DADAS
            double n1 = 10.0;
            double respuestaEsperada = 40.0;
            Figura sujetoDePrueba = new Cuadrado();

            //CUANDO
            double respuesta = ((Cuadrado) sujetoDePrueba).CalcularPerimetro(n1);
            double roundRespuesta = Math.round(respuesta*100.0)/100.0;

            //ENTONCES
            Assertions.assertEquals(respuestaEsperada, roundRespuesta);
            //Assertions.assertTrue(respuesta == respuestaEsperada);
        }
}

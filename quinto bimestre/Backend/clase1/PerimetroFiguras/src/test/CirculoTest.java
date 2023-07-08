package test;

import main.Circulo;
import main.Figura;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class CirculoTest {
    @Test
    public void deberíaDarOkAlTenerUnNumero(){ //Escenario A
        //DADAS
        double n1 = 10;
        double respuestaEsperada = 62.83;
        Figura sujetoDePrueba = new Circulo();

        //CUANDO
        double respuesta = (((Circulo) sujetoDePrueba).CalcularPerimetro(n1));
        double roundRespuesta = Math.round(respuesta*100.0)/100.0;
        //ENTONCES
        Assertions.assertEquals(respuestaEsperada, roundRespuesta);
        //Assertions.assertTrue(respuesta == respuestaEsperada);
    }
}

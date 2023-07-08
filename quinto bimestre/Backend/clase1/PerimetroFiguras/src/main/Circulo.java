package main;

public class Circulo extends Figura{
    private final double PI = 3.1415;
    private double perimetro;
    public double CalcularPerimetro(double radio){
        if (radio > 0) {
            perimetro = 2*PI*radio;
            return perimetro;
        }
        else{
            return -1;
        }

    }
}

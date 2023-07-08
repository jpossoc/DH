package main;

public class Cuadrado extends Figura{
    private double perimetro;

    public double CalcularPerimetro(double lado){
        perimetro = 4*lado;
        return perimetro;
    }
}


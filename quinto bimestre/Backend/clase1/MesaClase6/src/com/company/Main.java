package com.company;

public class Main {
    public void main (String Args[]){
        ISeries serie =new ProxySerie();
        serie.getPelicula("hola");
        ((ProxySerie)serie).getPelicula("Hola");
    }
}

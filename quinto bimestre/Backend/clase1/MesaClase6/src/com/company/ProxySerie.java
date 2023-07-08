package com.company;

public class ProxySerie implements ISeries{
    private int CantVistas= 0;
    @Override
    public String getPelicula(String nombre) {
        if (CantVistas <= 5){
            CantVistas ++;
            return "www."+nombre+".com";
        }
        else {
            return "Serie no habilitada";
        }
    }
}

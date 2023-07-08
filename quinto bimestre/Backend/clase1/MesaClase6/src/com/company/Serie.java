package com.company;

public class Serie implements ISeries {
    @Override
    public String getPelicula(String nombre){
        return "www."+nombre+".com";
    }
}

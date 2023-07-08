package com.company;

public interface ISeries {
    public default String getPelicula(String nombre){
        return "";
    };
}

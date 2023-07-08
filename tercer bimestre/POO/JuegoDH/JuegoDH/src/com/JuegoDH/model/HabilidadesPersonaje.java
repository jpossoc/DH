package com.JuegoDH.model;

public abstract class HabilidadesPersonaje {
    public static String nombre;
    protected static String descripcion;


    public HabilidadesPersonaje(String nombre, String descripcion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
    }
    public abstract double CalcularHabilidad ();
}

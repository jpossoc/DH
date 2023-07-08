package com.JuegoDH.model;

public class HabilidadSimple extends HabilidadesPersonaje {
    private double puntaje;

    public HabilidadSimple(String nombre, String descripcion, double puntaje) {
        super(nombre, descripcion);
        this.puntaje = puntaje;
    }

    @Override
    public double CalcularHabilidad() {
        if (puntaje == 10.0) {
            return puntaje * 1.1;
        } else {
            return puntaje;
        }
    }

    @Override
    public String toString() {
        return "\n\t habilidad simple " + nombre + " {" +
                "puntaje=" + puntaje +
                '}' + "\n" + "\t";

    }
}

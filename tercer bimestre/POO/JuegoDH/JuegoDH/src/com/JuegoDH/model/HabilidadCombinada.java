package com.JuegoDH.model;

import java.util.ArrayList;
import java.util.List;

public class HabilidadCombinada extends HabilidadesPersonaje {
    private List<HabilidadesPersonaje> habilidadesPersonaje;
    private int multiplicador;

    public HabilidadCombinada(String nombre, String descripcion, int multiplicador) {
        super(nombre, descripcion);
        habilidadesPersonaje = new ArrayList<HabilidadesPersonaje>();
        this.multiplicador = multiplicador;
    }

    public void agregarHabilidad(HabilidadesPersonaje habilidadPersonaje) {
        habilidadesPersonaje.add(habilidadPersonaje);
    }


    @Override
    public double CalcularHabilidad() {
        double puntajeSumado = 0.0;
        double puntajeTotal = 0.0;
        for (HabilidadesPersonaje hp : habilidadesPersonaje) {
            puntajeSumado += hp.CalcularHabilidad();
        }
        puntajeTotal = puntajeSumado * multiplicador;
        return puntajeTotal;
    }

    @Override
    public String toString() {
        return "\n\t habilidad combinada saltar y disparar {" +
                "puntaje=" + CalcularHabilidad() +
                '}' + "\n" + "\t";
    }
}

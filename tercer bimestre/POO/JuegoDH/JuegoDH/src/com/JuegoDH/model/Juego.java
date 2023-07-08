package com.JuegoDH.model;

import com.JuegoDH.Exception.HabilidadesPersonajeException;
import com.JuegoDH.factory.FactoryHabilidadesPersonaje;

import java.util.ArrayList;
import java.util.List;

public class Juego {
    private List<HabilidadesPersonaje> habilidadesPersonajes;

    public Juego(){
        habilidadesPersonajes = new ArrayList<HabilidadesPersonaje>();
    }

    public void agregarHabilidad(String codigo ){
        try {
            habilidadesPersonajes.add(FactoryHabilidadesPersonaje.getInstance().generarHabilidadesPeronaje(codigo));
        } catch (HabilidadesPersonajeException e) {
            throw new RuntimeException(e);
        }
    }
    public String generarInforme(){
        String informe = "";
        for (HabilidadesPersonaje habilidadesPersonaje: habilidadesPersonajes){
            informe += habilidadesPersonaje.toString() + "\n";
        }
        return  informe;
    }
}

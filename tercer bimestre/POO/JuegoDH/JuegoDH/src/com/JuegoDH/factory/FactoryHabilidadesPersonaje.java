package com.JuegoDH.factory;

import com.JuegoDH.Exception.HabilidadesPersonajeException;
import com.JuegoDH.model.HabilidadCombinada;
import com.JuegoDH.model.HabilidadSimple;
import com.JuegoDH.model.HabilidadesPersonaje;

public class FactoryHabilidadesPersonaje {

    private static FactoryHabilidadesPersonaje instance;
    public static final String CODIGO_DISPARAR = "disparar";
    public static final String CODIGO_SALTAR = "saltar";
    public static final String CODIGO_SALTAR_Y_DISPARAR = "saltar y disparar";

    private FactoryHabilidadesPersonaje() {

    }

    public static FactoryHabilidadesPersonaje getInstance() {
        if (instance == null)
            instance = new FactoryHabilidadesPersonaje();
        return instance;
    }

    public HabilidadesPersonaje generarHabilidadesPeronaje(String codigo) throws HabilidadesPersonajeException {
        switch (codigo) {
            case CODIGO_DISPARAR:
                return new HabilidadSimple("disparar", "dispara al objetivo", 10.0);
            case CODIGO_SALTAR:
                return new HabilidadSimple("Saltar", "Salta al lugar deseado", 7.5);
            case CODIGO_SALTAR_Y_DISPARAR:
                HabilidadCombinada habilidadCombinada = new HabilidadCombinada("Saltar y Disparar", "Salta hacia el lugar deseado mientras dispara", 3);
                habilidadCombinada.agregarHabilidad(generarHabilidadesPeronaje(CODIGO_DISPARAR));
                habilidadCombinada.agregarHabilidad(generarHabilidadesPeronaje(CODIGO_SALTAR));
                return habilidadCombinada;
            default:
                throw new HabilidadesPersonajeException("codigo invalido: " + codigo);

        }
    }
}


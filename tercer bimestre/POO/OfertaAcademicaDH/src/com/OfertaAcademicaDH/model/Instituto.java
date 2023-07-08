package com.OfertaAcademicaDH.model;

import com.OfertaAcademicaDH.exception.OfertaAcademicaException;
import com.OfertaAcademicaDH.factory.FactoryOfertaAcademica;

import java.util.ArrayList;
import java.util.List;

public class Instituto {
    private List<OfertaAcademica> ofertaAcademicas;

    public Instituto() {
        ofertaAcademicas = new ArrayList<OfertaAcademica>();
    }

    public void agregarOfertaAcademica(String codigo){
        try {
            ofertaAcademicas.add(FactoryOfertaAcademica.getInstance().generarOfertaAcademica(codigo));
        } catch (OfertaAcademicaException e) {
            throw new RuntimeException(e);
        }
    }

    public String generarInforme(){
        String informe = "";
        for (OfertaAcademica ofertaAcademica : ofertaAcademicas) {
            informe += ofertaAcademica.toString() + "\n";
        }
        return informe;
    }

    public Double sumaPrecioCursos(){
        Double suma = 0.0;
        for (OfertaAcademica ofertaAcademica : ofertaAcademicas) {
            suma += ofertaAcademica.calcularPrecio();
        }
        return suma;
    }
}

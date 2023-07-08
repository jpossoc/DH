package com.OfertaAcademicaDH.model;

import java.util.ArrayList;
import java.util.List;

public class ProgramaIntensivo extends OfertaAcademica{
    private List<OfertaAcademica> ofertaAcademicas;
    private Double descuento; // descuento en %

    public ProgramaIntensivo(String nombre, String descripcion, Double descuento) {
        super(nombre, descripcion);
        this.descuento = descuento;
        ofertaAcademicas = new ArrayList<OfertaAcademica>();
    }

    public void agregarOfertaAcademica(OfertaAcademica ofertaAcademica){
        ofertaAcademicas.add(ofertaAcademica);
    }

    @Override
    public Double calcularPrecio() {
        Double sumarPrecio = 0.0;
        for (OfertaAcademica oa : ofertaAcademicas) {
            sumarPrecio += oa.calcularPrecio();
        }
        return sumarPrecio*descuento;
    }

    @Override
    public String toString() {
        return "ProgramaIntensivo{" +
                "ofertaAcademicas=" + ofertaAcademicas +
                ", descuento=" + descuento +
                '}';
    }

}

package com.OfertaAcademicaDH.model;

public class Curso extends OfertaAcademica{
    private Double horasMensuales;
    private Double duracionMeses;
    private Double precioHora;

    public Curso(String nombre, String descripcion, Double horasMensuales, Double duracionMeses, Double precioHora) {
        super(nombre, descripcion);
        this.horasMensuales = horasMensuales;
        this.duracionMeses = duracionMeses;
        this.precioHora = precioHora;
    }

    @Override
    public Double calcularPrecio() {
        return horasMensuales*duracionMeses*precioHora;
    }

    @Override
    public String toString() {
        return "\n\t Curso{" +
                "horasMensuales=" + horasMensuales +
                ", duracionMeses=" + duracionMeses +
                ", precioHora=" + precioHora +
                '}' + "\n" + "\t";
    }
}

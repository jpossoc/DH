package com.OfertaAcademicaDH.factory;

import com.OfertaAcademicaDH.exception.OfertaAcademicaException;
import com.OfertaAcademicaDH.model.Curso;
import com.OfertaAcademicaDH.model.OfertaAcademica;
import com.OfertaAcademicaDH.model.ProgramaIntensivo;

public class FactoryOfertaAcademica {
    private static FactoryOfertaAcademica instance;
    public static final String CODIGO_FULL_STACK = "Full-Stack";
    public static final String CODIGO_FRONT_END = "front-end";
    public static final String CODIGO_BACK_END = "back-end";
    private FactoryOfertaAcademica(){

    }

    public static FactoryOfertaAcademica getInstance(){
        if(instance == null)
            instance = new FactoryOfertaAcademica();
        return instance;
    }

    public OfertaAcademica generarOfertaAcademica(String codigo) throws OfertaAcademicaException {
        switch (codigo){
            case CODIGO_FRONT_END:
                return new Curso("Front-End", "Curso basico de front-end web", 16.0, 2.0, 1000.0);
            case CODIGO_BACK_END:
                return new Curso("Back-End", "Curso basico de back-end web y api rest", 20.0, 2.0, 900.0);
            case CODIGO_FULL_STACK:
                ProgramaIntensivo programaIntensivo = new ProgramaIntensivo("Full-Stack-Developer", "Curso de Full-Stack Developer Web", 0.2);
                programaIntensivo.agregarOfertaAcademica(generarOfertaAcademica(CODIGO_FRONT_END));
                programaIntensivo.agregarOfertaAcademica(generarOfertaAcademica(CODIGO_BACK_END));
                return programaIntensivo;
            default:
                throw new OfertaAcademicaException("codigo invalido: " + codigo);
        }
    }

}

package com.OfertaAcademicaDH;

import com.OfertaAcademicaDH.factory.FactoryOfertaAcademica;
import com.OfertaAcademicaDH.model.Instituto;

public class Main {
    public static void main(String[] args) {

        Instituto instituto = new Instituto();
        instituto.agregarOfertaAcademica(FactoryOfertaAcademica.CODIGO_FRONT_END);
        instituto.agregarOfertaAcademica(FactoryOfertaAcademica.CODIGO_BACK_END);
        instituto.agregarOfertaAcademica(FactoryOfertaAcademica.CODIGO_FULL_STACK);

        System.out.println("---------------");
        System.out.println(instituto.generarInforme());
        System.out.println("---------------");

        System.out.println(instituto.sumaPrecioCursos());

    }
}

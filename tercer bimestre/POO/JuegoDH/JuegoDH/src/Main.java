import com.JuegoDH.factory.FactoryHabilidadesPersonaje;
import com.JuegoDH.model.Juego;

public class Main {
    public static void main(String[] args){
        Juego juego = new Juego();
        juego.agregarHabilidad(FactoryHabilidadesPersonaje.CODIGO_DISPARAR);
        juego.agregarHabilidad(FactoryHabilidadesPersonaje.CODIGO_SALTAR);
        juego.agregarHabilidad(FactoryHabilidadesPersonaje.CODIGO_SALTAR_Y_DISPARAR);

        System.out.println("---------------");
        System.out.println(juego.generarInforme());
        System.out.println("---------------");
    }
}

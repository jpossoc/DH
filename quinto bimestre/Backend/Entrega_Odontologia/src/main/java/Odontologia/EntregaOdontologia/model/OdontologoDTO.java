package Odontologia.EntregaOdontologia.model;

import java.io.Serializable;


public class OdontologoDTO implements  DTO {

    private int id;
    private int numero_matricula;
    private String nombre;
    private String apellido;

    public OdontologoDTO() {
    }

    public OdontologoDTO(Integer id, int numero_matricula, String nombre, String apellido) {
        this.setId(id);
        this.setNumero_matricula(numero_matricula);
        this.setNombre(nombre);
        this.setApellido(apellido);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumero_matricula() {
        return numero_matricula;
    }

    public void setNumero_matricula(int numero_matricula) {
        this.numero_matricula = numero_matricula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    @Override
    public String toString() {
        return "Odontologo{" +
                "id=" + this.id +
                ", numero_matricula=" + numero_matricula +
                ", nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                '}';
    }
}



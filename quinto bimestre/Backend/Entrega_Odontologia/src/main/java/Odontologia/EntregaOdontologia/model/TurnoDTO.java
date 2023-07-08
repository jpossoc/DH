package Odontologia.EntregaOdontologia.model;

import java.io.Serializable;
import java.time.LocalDate;

public class TurnoDTO implements Serializable, DTO {
    private int id;

    private PacienteDTO Paciente;

    private String NombrePaciente;

    private OdontologoDTO Odontologo;
    private String NombreOdontologo;

    private LocalDate fechaTurno;

    public TurnoDTO() {
    }

    public TurnoDTO(int id, PacienteDTO Paciente, OdontologoDTO Odontologo, LocalDate fechaIngreso) {
        this.id = id;
        this.Paciente = Paciente;
        this.NombrePaciente = Paciente.getNombre();
        this.Odontologo = Odontologo;
        this.NombreOdontologo = Odontologo.getNombre();
        this.fechaTurno = fechaIngreso;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public LocalDate getFechaTurno() {
        return fechaTurno;
    }

    public void setFechaTurno(LocalDate fechaTurno) {
        this.fechaTurno = fechaTurno;
    }

    @Override
    public String toString() {
        return "TurnoDTO{" +
                "id=" + id +
                ", nombrePaciente=" + NombrePaciente +
                ", nombreOdontologo=" + NombreOdontologo +
                ", fechaIngreso=" + fechaTurno +
                '}';
    }

    public PacienteDTO getPaciente() {
        return Paciente;
    }

    public OdontologoDTO getOdontologo() {
        return Odontologo;
    }
}

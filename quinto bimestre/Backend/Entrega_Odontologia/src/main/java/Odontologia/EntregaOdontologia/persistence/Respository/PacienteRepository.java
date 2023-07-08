package Odontologia.EntregaOdontologia.persistence.Respository;

import Odontologia.EntregaOdontologia.persistence.entities.Paciente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PacienteRepository extends JpaRepository<Paciente, Integer> {
}

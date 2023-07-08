package Odontologia.EntregaOdontologia.persistence.Respository;


import Odontologia.EntregaOdontologia.persistence.entities.Odontologo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OdontologoRepository extends JpaRepository<Odontologo, Long> {
}

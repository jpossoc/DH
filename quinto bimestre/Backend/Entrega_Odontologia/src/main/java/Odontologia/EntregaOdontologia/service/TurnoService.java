package Odontologia.EntregaOdontologia.service;

import Odontologia.EntregaOdontologia.config.MapperConfig;
import Odontologia.EntregaOdontologia.model.OdontologoDTO;
import Odontologia.EntregaOdontologia.model.PacienteDTO;
import Odontologia.EntregaOdontologia.model.TurnoDTO;
import Odontologia.EntregaOdontologia.persistence.Respository.TurnoRepository;
import Odontologia.EntregaOdontologia.persistence.entities.Turno;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TurnoService implements ApiService<TurnoDTO>{

    @Autowired
    private MapperConfig mapper;

    @Autowired
    ObjectMapper oMapper;

    @Autowired
    private TurnoRepository repository;

    @Autowired
    private PacienteService pacienteService;

    @Autowired
    private OdontologoService odontologoService;

    @Override
    public TurnoDTO createNew(TurnoDTO dto) throws ServiceException {
        if(existenPacienteYOdontologo(dto)){
            Turno respuesta = repository.save(oMapper.convertValue(dto, Turno.class));
            return mapper.getModelMapper().map(respuesta, TurnoDTO.class);
        }else{
            throw new ServiceException("El paciente y/o Odontólogo no están registados en el sistema");
        }
    }

    @Override
    public List<TurnoDTO> getAll() {
        return null;
    }

    private boolean existenPacienteYOdontologo(TurnoDTO dto) {
        PacienteDTO paciente = pacienteService.getById(dto.getPaciente().getId());
        OdontologoDTO odontologo = odontologoService.getById(dto.getOdontologo().getId());

        return paciente != null && odontologo != null;
    }
}

package Odontologia.EntregaOdontologia.service;

import Odontologia.EntregaOdontologia.config.MapperConfig;

import Odontologia.EntregaOdontologia.model.PacienteDTO;
import Odontologia.EntregaOdontologia.persistence.Respository.PacienteRepository;
import Odontologia.EntregaOdontologia.persistence.entities.Paciente;
import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.util.List;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class PacienteService implements ApiService<PacienteDTO>{
    @Autowired
    private MapperConfig mapper;

    @Autowired
    private PacienteRepository repository;

    @Override
    public PacienteDTO createNew(PacienteDTO dto) throws ServiceException {
        Paciente entidad = null;

        if(dto.getDni() == Integer.parseInt(null)) {
            entidad = repository.save(mapper.getModelMapper().map(dto, Paciente.class));
        }else{
            throw new ServiceException("El paciente debe tener un número de dni/cc.");
        }

        return mapper.getModelMapper().map(entidad, PacienteDTO.class);
    }

    @Override
    public List<PacienteDTO> getAll() {
        List<PacienteDTO> resultado = new ArrayList<>();

        List<Paciente> entidades = repository.findAll();

        entidades.forEach(e -> resultado.add(mapper.getModelMapper().map(e, PacienteDTO.class)));

        return resultado;
    }

    public PacienteDTO getById(Integer id){
        Optional<Paciente> p = repository.findById(id);

        return p.isPresent() ? mapper.getModelMapper().map(p.get(), PacienteDTO.class) : null;
    }
}

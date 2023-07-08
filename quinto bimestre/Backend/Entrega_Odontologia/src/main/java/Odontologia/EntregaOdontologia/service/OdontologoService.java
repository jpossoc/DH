package Odontologia.EntregaOdontologia.service;


import Odontologia.EntregaOdontologia.config.MapperConfig;
import Odontologia.EntregaOdontologia.model.OdontologoDTO;
import Odontologia.EntregaOdontologia.persistence.Respository.OdontologoRepository;
import Odontologia.EntregaOdontologia.persistence.entities.Odontologo;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class OdontologoService implements ApiService<OdontologoDTO> {

    @Autowired
    private MapperConfig mapper;

    @Autowired
    private ObjectMapper oMapper;

    @Autowired
    private OdontologoRepository repository;

    @Override
    public OdontologoDTO createNew(OdontologoDTO dto) throws ServiceException {
        Odontologo entidad = null;


        if(dto.getNumero_matricula() == Integer.parseInt(null)) {
            entidad = repository.save(mapper.getModelMapper().map(dto, Odontologo.class));
        }else{
            throw new ServiceException("El odontólogo debe tener un número de matrícula.");
        }

        return mapper.getModelMapper().map(entidad, OdontologoDTO.class);
    }

    

    @Override
    public List<OdontologoDTO> getAll() {
        List<OdontologoDTO> resultado = new ArrayList<>();

        List<Odontologo> entidades = repository.findAll();

        entidades.forEach(e -> resultado.add(mapper.getModelMapper().map(e, OdontologoDTO.class)));

        return resultado;
    }

    public OdontologoDTO getById(Integer id){
        Optional<Odontologo> p = repository.findById(Long.valueOf(id));

        return p.isPresent() ? mapper.getModelMapper().map(p.get(), OdontologoDTO.class) : null;
    }
}

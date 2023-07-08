package Odontologia.EntregaOdontologia.service;



import Odontologia.EntregaOdontologia.model.DTO;
import org.hibernate.service.spi.ServiceException;

import java.util.List;

public interface ApiService<D extends DTO> {
    D createNew(D dto) throws ServiceException;

    List<D> getAll();
}

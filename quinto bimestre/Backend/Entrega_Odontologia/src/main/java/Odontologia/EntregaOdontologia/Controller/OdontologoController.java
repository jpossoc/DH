package Odontologia.EntregaOdontologia.Controller;

import Odontologia.EntregaOdontologia.model.OdontologoDTO;
import Odontologia.EntregaOdontologia.service.OdontologoService;
import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("odontologo")
public class OdontologoController {

    @Autowired
    private OdontologoService service;

    @PostMapping("/nuevo")
    public ResponseEntity<Object> addNew(@RequestBody OdontologoDTO odontologo){
        ResponseEntity<Object> respuesta = null;

        try {
            odontologo = service.createNew(odontologo);
            respuesta = ResponseEntity.ok(odontologo);
        } catch (ServiceException ex) {
            respuesta = ResponseEntity.badRequest().body(ex.getMessage());
        }

        return respuesta;
    }

    @GetMapping("/todos")
    public ResponseEntity<List<OdontologoDTO>> listarTodos(){
        List<OdontologoDTO> resultado = service.getAll();

        return ResponseEntity.ok(resultado);
    }
}

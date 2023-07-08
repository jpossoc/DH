package Odontologia.EntregaOdontologia.Controller;


import Odontologia.EntregaOdontologia.model.TurnoDTO;
import Odontologia.EntregaOdontologia.service.TurnoService;
import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("turno")
public class TurnoController {
    @Autowired
    private TurnoService service;

    @PostMapping("/nuevo")
    public ResponseEntity<Object> addNew(@RequestBody TurnoDTO turno){
        ResponseEntity<Object> respuesta = null;

        try {
            turno = service.createNew(turno);
            respuesta = ResponseEntity.ok(turno);
        } catch (ServiceException ex) {
            respuesta = ResponseEntity.badRequest().body(ex.getMessage());
        }

        return respuesta;
    }

    @GetMapping("/todos")
    public ResponseEntity<List<TurnoDTO>> listarTodos(){
        List<TurnoDTO> resultado = service.getAll();

        return ResponseEntity.ok(resultado);
    }
}

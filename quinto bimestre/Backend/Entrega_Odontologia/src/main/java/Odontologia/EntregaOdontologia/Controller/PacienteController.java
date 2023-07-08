package Odontologia.EntregaOdontologia.Controller;


import Odontologia.EntregaOdontologia.model.PacienteDTO;

import Odontologia.EntregaOdontologia.service.PacienteService;

import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("paciente")
public class PacienteController {

    @Autowired
    private PacienteService service;

    @PostMapping("/nuevo")
    public ResponseEntity<Object> addNew(@RequestBody PacienteDTO paciente){
        ResponseEntity<Object> respuesta = null;

        try {
            paciente = service.createNew(paciente);
            respuesta = ResponseEntity.ok(paciente);
        } catch (ServiceException ex) {
            respuesta = ResponseEntity.badRequest().body(ex.getMessage());
        }

        return respuesta;
    }

    @GetMapping("/todos")
    public ResponseEntity<List<PacienteDTO>> listarTodos(){
        List<PacienteDTO> resultado = service.getAll();

        return ResponseEntity.ok(resultado);
    }
}


/*Ejercicio 1*/ 
/*parte 1*/

let estudiante = {
    apellido: "Posso Castanio",
    nombre: "Johan Sebastian",
    camada: 2,
    esParcial: true
}
/*parte 2*/
function situacionAlumno (nota) {
    if (nota>0){
        if (nota < 4) {
            return "desaprobado"
        }
        else if (nota >= 4 && nota < 7){
            return "debe rendir el examen final"
        }
        else {
            return "aprobado"
        }
    }
}
let notaAlumno = 10
console.log("El alumno obtuvo una nota igual a " + notaAlumno + " por lo tanto su condición es " + situacionAlumno(notaAlumno))  

/*Ejercicio 2*/

let clase = [
    {
        nombres: "Esteban",
        apellidos: "Piazza",
        bimestre: 1
    },
    {
        nombres: "Leandro",
        apellidos: "Borrelli",
        bimestre: 1
    },
    {
        nombres: "Martin",
        apellidos: "Cejas",
        bimestre: 3
    }
]
console.log(clase)

function siguienteCursada(array) {
    for (let i = 0; i < array.length; i++) {
        array[i].bimestre = array[i].bimestre + 1
    }
    console.log(array)
}

siguienteCursada(clase)


/*Ejercicio 3*/ 

const asistenciaMinima = 23

function aprobar (cantidadAsistencia,playgroundCompleto){
    if (cantidadAsistencia >= asistenciaMinima && playgroundCompleto == true){
        return "aprobado"
    }
    else {
        return "desaprobado"
    }
}


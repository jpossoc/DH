const prompt = require("prompt-sync")({ sigint : true });

//programando un paseo de olla (paseo a un rio al que se lleva una olla para hacer sancocho)

//como esta el clima
let clima = prompt("como esta el clima?: ");
//escoger el rio
let rio = prompt("escoja un rio cercano:");
//hora de salida
let hora = prompt("a que hora planea salir?:")
//implementos para el paseo
const olla = "olla";
const ropa = "ropa de baño";
// cuantas personas van
let personas = prompt("cuantas personas iran?")
//implementos para la comida
const platos = personas + " platos";
const cuchara = personas + " cucharas";
const vasos = personas + " vasos";

// definir hora de regreso 
let horaR = parseInt(hora) + 4;

console.log(clima, "para ir al rio", rio, "a las", hora, "y regresar a las", horaR, "no olvidar la", olla, "y la", ropa, "somos", personas, "asi que necesitamos", platos, vasos, cuchara)
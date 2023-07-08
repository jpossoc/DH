const prompt = require("prompt-sync")({ sigint : true });

//programando una ida a cine 

//como esta el clima 
const clima = 'lluvia';
//escoger pelicula
let pelicula = prompt("nombre de pelicula:");
// esta la pelicula en cartelera
let cartelera = true;
//precio boletas
const preferencial = 20000;
const general = 15000;
let localidad = prompt("escoger boleta (general o preferencial):");
//horario pelicula
const temprano = "6:00pm";
const tarde = "10:00pm";
let horario = prompt("escoger hora (temprano o tarde):");
// escoger comida 
const combo1 = "palomitas pequeñas y gaseosa";
const combo2 = "palomitas pequeñas, gaseosa, hot-dog";
const combo3 = "palomitas grandes y gaseosa";
let comida = prompt("escoger combo (combo1, combo2 o combo3):");

console.log("esta haciendo ", clima, "vamos a ver la", pelicula, "se encuentra en cartelera?", cartelera, "compre boletas para ", localidad," en el horario ", horario, "y compre el", comida)

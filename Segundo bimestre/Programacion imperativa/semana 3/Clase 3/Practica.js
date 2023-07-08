const prompt = require("prompt-sync")({ sigint : true });
/*
function imprimirFrase (frase) {
    console.log(frase)
}

imprimirFrase(prompt("ingrese una frase "))


function Hola(nombre) {
    console.log("Hola " + nombre + "!")
}

Hola(prompt("ingrese su nombre "))


function suma(a,b){
    console.log(a+b)
}

suma(parseInt(prompt("ingrese un numero ")),parseInt(prompt("ingrese otro numero ")))


function edad(numero){
    console.log(2022-numero)
}

edad(parseInt(prompt("ingrese su año de nacimiento ")))


function adivina(numero) {
    let max = 10
    let min = 5
    let random = (Math.floor(Math.random() * (max - min ))) + min
    while ( random !== numero) { 
        numero=parseInt(prompt("ingrese un numero"))
        console.log("lo siento, intenta nuevamente!")
    }
    console.log("felicitaciones lo adivino")
}

adivina(parseInt(prompt("ingrese un numero ")))


function pares(){
    for (let i=0 ; i <= 100 ; i += 2) {
        console.log(i)
    }
}

pares()



function nombre(){
    const nombres= ["Pedro","Pablo","Maria","Juan","Diana"]
    for (let index = 0; index < nombres.length; index++) {
        console.log(nombres[index])
    }
}

nombre()
*/

function CalcularPorcentajeMayor500(numero){
    if (numero<= 500){
        console.log("numero menor que 500")
    }
    else{
        console.log (numero*18/100)
    }
}

CalcularPorcentajeMayor500(parseInt(prompt("ingrese un numero ")))
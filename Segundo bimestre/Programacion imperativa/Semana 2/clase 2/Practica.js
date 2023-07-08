console.log(Math.random())

const prompt = require("prompt-sync")({ sigint : true });

function saludar(){
    let inputNombre= prompt(" ingrese su nombre: ");
    console.log(`Hola ${inputNombre}, tanto tiempo sin verte`)
}

saludar();

function saludarA(nombre){
    const mensaje = `Hola ${nombre}, tanto tiempo sin verte `;
    console.log(mensaje);
}

saludarA(`Ezequiel`)
saludarA(`diego`)

function multiplicarPorDosYSumarleCinco (x) {
    return 2 * x + 5
}

multiplicarPorDosYSumarleCinco(1)
multiplicarPorDosYSumarleCinco(5)
multiplicarPorDosYSumarleCinco("pepe")
const pepe = 5;
multiplicarPorDosYSumarleCinco(pepe)
console.log(multiplicarPorDosYSumarleCinco(pepe))

let valor = multiplicarPorDosYSumarleCinco(pepe)
console.log(valor);

// expresada suma
let multiplicarPorDosYSumarleCinco1 = function (x) {
    return 2 * x + 5
}
console.log(multiplicarPorDosYSumarleCinco1(2));

// expresada que concatena
let multiplicarPorDosYSumarleCinco2 = function (x) {
    return 2 + x 
}
console.log(multiplicarPorDosYSumarleCinco2(`hola`));

// arrow
let multiplicarPorDosYSumarleCinco3 = x => 2 * x + 5
console.log(multiplicarPorDosYSumarleCinco3(Math.random()));
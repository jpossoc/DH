/*ejercicio 1*/

const alumnos = [
  {
    id: 0,
    nombre: "Leandro",
    apellido: "Borrelli",
    legajo: 20210308,
    notas: [],
  },
  {
    id: 1,
    nombre: "Esteban",
    apellido: "Piazza",
    legajo: 20210211,
    notas: [],
  },
  {
    id: 2,
    nombre: "Martin",
    apellido: "Cejas",
    legajo: 20210218,
    notas: [],
  },
  {
    id: 3,
    nombre: "Karina",
    apellido: "Borgna",
    legajo: 20210516,
    notas: [],
  },
  {
    id: 5,
    nombre: "Javier",
    apellido: "Riera",
    legajo: 20220125,
    notas: [],
  },
];

/*1.1.a*/
/*objeto*/

/*1.1.b*/
/*id,nombre,apellido,legajo,notas*/

/*1.2*/
function ordenAsc (array) {
  for (let i = 0; i < array.length-1; i++) {
    for (let j = i; j < array.length-1; j++) {
      if (array[i].legajo > array[i+1].legajo) {
        let element = array[i];
        array[i] = array[i+1]
        array[i+1] = element
      }     
    }
  }
  return array
}

console.log(ordenAsc(alumnos))


/*ejercicio 2*/
/*2.a*/
let alumno = {
  id: 5,
  nombre: "Lucas",
  apellido: "Astrada",
  legajo: 20220125,
  notas: [10,6,8,7,9]
  }
function promedio(objeto){
  sumaNotas=0
  for (let i = 0; i < objeto.notas.length; i++) {
    sumaNotas = sumaNotas + objeto.notas[i]
  }
  let promedio = sumaNotas/objeto.notas.length
  return promedio
}
console.log("el promedio el alumno "+ alumno.nombre +" es: " + promedio(alumno))

/*2.b*/
function notasDesc(objeto) {
  for (let i = 0; i < objeto.notas.length; i++) {
    for (let j = objeto.notas.length-1 ; j > 0; j--) {
      if (objeto.notas[j] < objeto.notas[j+1]) {
        let element = objeto.notas[j];
        objeto.notas[j] = objeto.notas[j+1]
        objeto.notas[j+1] = element
      }     
    }
  }
  return objeto
}
console.log(notasDesc(alumno))

/*ejercicio 3*/
/*3.a*/
let matriz = [
  [ 1, 2, 3],
  [ 4, 5, 6],
  [ 7, 8, 9]
]

/*3.b*/
function SumaMultiplos5 (matrix){
  let sum = 0
  for (let i = 0; i < matrix.length; i++) {
    for (let j = 0; j < matrix[i].length; j++) {
      if (matrix[i][j] % 5 == 0) {
        sum = sum + matrix[i][j]
      }
    }
  }
  return sum
}

console.log("la suma de los multiplos de 5  en la matriz es: " + SumaMultiplos5(matriz))

/*3.c*/
function esPar (matrix){
  let suma = 0
  for (let i = 0; i < matrix.length; i++) {
    for (let j = 0; j < matrix[i].length; j++) {
      suma += matrix[i][j]
    }
  }
  if (suma % 2 == 0){
    return true;
  }
  else {
    return false
  }
}

console.log("la matriz es par? " + esPar(matriz))

/*3.d*/
function multiplicacionDiagonales (matrix){
  let mult = 1
  for (let i = 0; i < matrix.length; i++) {
    for (let j = 0; j < matrix[i].length; j++) {
      if (i == j){
        mult = mult * matrix[i][j] * matrix[i][matrix[i].length-j-1]
      }
    }
  }
  return mult
}
console.log("la multiplicacion de los numeros de las diagonales de la matriz es: " + multiplicacionDiagonales(matriz))

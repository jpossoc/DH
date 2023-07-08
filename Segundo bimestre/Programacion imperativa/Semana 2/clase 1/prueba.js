
let matriz = [
    [ 1, 2, 3],
    [ 4, 5, 6],
    [ 7, 8, 9]
]

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

console.log()
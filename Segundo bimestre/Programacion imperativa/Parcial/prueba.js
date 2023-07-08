
function piramide (numero) {
    let arrayfila = []
    let arraycolumna= []
    for (let i = 0; i <= numero; i++) {
        for (let j = i; j < numero; j++) {
            arraycolumna.push(numero-i)
        }
        arrayfila.push(arraycolumna)
        arraycolumna = []
    }
    
    return arrayfila
}

console.table(piramide(5))
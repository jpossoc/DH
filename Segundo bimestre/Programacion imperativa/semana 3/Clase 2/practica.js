function LosSiguientes(number) {
    for (let i = number+1; i <= number+10; i++) {
        console.log(i);     
    }
}

function Cont(){
    for (let i = 5; i <= 20; i+=3) {
        console.log(i);
    }
}

function Sum() {
    let j=0
    for (let i= 0; i<=100; i++) {
        j+=i;
        console.log(j);
    }
}

function NumPos(number){
    let j=1
    for (var i = 1; i <= number; i++){
        j*=i;
    }
    console.log(j);
}

function Fibonacci(number){
    let a = 0
    let b = 1
    for (let i = 0; i < number; i++) {
        console.log(a)
        i=a+b;
        a=b;
        b=i;
    }
}

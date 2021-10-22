function sum(){
    let args = Array.from(arguments)
    let result = 0;
    args.forEach(element => {
        result+= element;
    });
    return result;
}

function sum(...arguments) {
    let result = 0;
    arguments.forEach(element => {
        result += element;
    });
    return result;
}

// console.log(sum(1, 2, 3, 4));
// console.log(sum(1, 2, 3, 4, 5));




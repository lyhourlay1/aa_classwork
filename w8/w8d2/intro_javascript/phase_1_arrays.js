Array.prototype.uniq = function() {
    let new_array = [];
    for (let i=0; i<this.length; i++) {
        if (new_array.includes(this[i])) {
            continue;
        }
        else {
            new_array.push(this[i]);
        }
    }
    return new_array;
}

console.log([1, 2, 2, 3, 3, 3].uniq());

Array.prototype.twoSum = function() {
    let posPair = [];
    for (let i=0; i<this.length; i++){
        let num1 = this[i];
        for (let j=i+1; j<this.length; j++){
            let num2 = this[j];
            // if (num1+num2 === 0 && !posPair.includes([j,i])) {
            if (num1 + num2 === 0) {
                posPair.push([i,j]); 
            }
        }
    }
    return posPair;
}

console.log([1,-1,2,-2,3,3].twoSum());





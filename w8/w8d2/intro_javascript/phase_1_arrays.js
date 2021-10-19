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

Array.prototype.transpose = function(){
  let result = [];
  for (let i =0; i <this[0].length; i +=1){
    let tempResult=[];
    for (let j = 0; j <this.length; j ++){
      tempResult.push(this[j][i]);
    }
    result.push(tempResult);
  }
  return result;
}

console.log(([[1, -1], [2, 3], [3, 3]]).transpose())


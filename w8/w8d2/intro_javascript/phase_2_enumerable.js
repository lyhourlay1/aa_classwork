let cb = function (num) {
  return num * 2;
}

Array.prototype.myEach= function(cb){
  let el;
  for(let i=0; i < this.length; i++){
    el = this[i];
    console.log(cb(el))
  }
}

console.log([1,2,3,4].myEach(cb));

Array.prototype.myMap = function(cb){
  let result=[];
  this.myEach(function(el){
    result.push(cb(el))
  })
  return result;
}


console.log([1, 2, 3, 4].myMap(cb));


Array.prototype.myReduce = function(cb,initialValue){
  if (initialValue == null){
    
    let result=this[0];

    this.slice(1).myEach(function (el) {
      result = cb(result, el);
    })
    return result;
  } else{
    let result=initialValue;
    this.myEach(function (el) {
      result = cb(result, el);
    })
    return result;
  }
 
}
console.log([1, 2, 3].myReduce(function (acc, el) {
  return acc + el;
})); // => 6

// with initialValue
console.log([1, 2, 3].myReduce(function (acc, el) {
  return acc + el;
}, 25));
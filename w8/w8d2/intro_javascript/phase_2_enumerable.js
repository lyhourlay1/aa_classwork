let cb = function (num) {
  return num * 2;
}

Array.prototype.myEach= function(cb){
  let el;
  for(let i=0; i < this.length; i++){
    el = this[i]
    console.log(cb(el))
  }
}

console.log([1,2,3,4].myEach(cb));

Array.prototype.myMap = function(cb){
  let result=[];
  this.myEach(function(el){
    result.push(cb(el))
  })
  return result
  // this.myEach(el => {
  //   result.push(cb(el))
  // })

  // this.myEach(el => result.push(cb(el)))
}


console.log([1, 2, 3, 4].myMap(cb));
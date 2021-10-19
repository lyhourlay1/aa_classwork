let cb = function (num) {
  return num * 2;
}

Array.prototype.myEach= function(cb){

   this.forEach(el=> console.log(cb(el)));
}

console.log([1,2,3,4].myEach(cb));
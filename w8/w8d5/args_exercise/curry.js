Function.prototype.curry = function(numArgs){
   let collection = [];
   let func = this
   return function _curry(arg){
    if (collection.length < numArgs) {
      collection.push(arg);
      console.log(collection);
      return _curry;
    }
    else{
      //console.log(collection)
      // console.log(func(collection)); //this.apply(func, collection)
      console.log(Function.prototype.apply(func, collection));
    }
  }
}


function combineString(...args){
  let result = ""
  args.forEach(element => result += element)
  return result
}

let a = combineString.curry(5);
// let b = a('dog');
// let c = b('cat')('rat')('rabbit')('lee');
// console.log(c);
a('dog');
a('rat');
a('rabbit');
a('lee');
a('snake');
a('horse');
// let c = b()()()
// console.log(a);
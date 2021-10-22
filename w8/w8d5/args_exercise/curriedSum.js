function curriedSum(numArgs){
    debugger
    let numbers = [];
    return function _curriedSum(arg){
        numbers.push(arg);
        if (numbers.length === numArgs){
            let result = 0;
            numbers.forEach(ele => {
                result +=ele;
            });
            return result;
        }
        else{
            return _curriedSum;
        }
    }
}
const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1));
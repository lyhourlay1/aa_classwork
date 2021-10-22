function curriedSum(numArgs){
    let numbers = [];
    function _curriedSum(arg){
        console.log(arg);
        numbers.push(arg);
        if (numbers.length === numArgs){
            let result = 0;
            numbers.forEach(ele => {
                result +=ele;
            });
            return result
        }
        else{
            return _curriedSum;
        }
    }
}
const sum = curriedSum(4);
sum(5)(30)(20)(1);
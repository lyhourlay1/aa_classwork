const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0){
        reader.question("Input numbers: ", answer => {
            console.log(sum + parseInt(answer));
            addNumbers(sum+ parseInt(answer), numsLeft-1, completionCallback);
        } )
    }
    if( numsLeft === 0){
        reader.close();
        completionCallback(sum)
    }
}
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

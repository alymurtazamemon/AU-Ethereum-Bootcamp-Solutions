class Transaction {
    constructor(inputUTXOs, outputUTXOs) {
        this.inputUTXOs = inputUTXOs;
        this.outputUTXOs = outputUTXOs;
    }
    execute() {
        let inputTotalValue = 0;
        let outputTotalValue = 0;

        this.inputUTXOs.forEach((input) => {
            // * get the spent and amount properties from input object.
            const { spent, amount } = input;
            inputTotalValue += amount;
            // * check whether it is true or not, if it is true then throw error.
            if (spent) {
                throw "already spent";
            }
        });

        this.outputUTXOs.forEach((output) => {
            const { amount } = output;
            outputTotalValue += amount;
        });

        if (inputTotalValue < outputTotalValue) {
            throw "is less than";
        }
    }
}

module.exports = Transaction;

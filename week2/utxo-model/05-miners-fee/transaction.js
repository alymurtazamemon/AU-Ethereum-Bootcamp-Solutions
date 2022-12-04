class Transaction {
    constructor(inputUTXOs, outputUTXOs) {
        this.inputUTXOs = inputUTXOs;
        this.outputUTXOs = outputUTXOs;
        this.fee = 0;
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

        this.inputUTXOs.forEach((input) => {
            input.spend();
        });

        this.outputUTXOs.forEach((output) => {
            output.spend();
        });

        const fee = inputTotalValue - outputTotalValue;
        if (fee > 0) {
            this.fee = fee;
        }
    }
}

module.exports = Transaction;

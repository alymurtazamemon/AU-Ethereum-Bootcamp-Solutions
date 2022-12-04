class Transaction {
    constructor(inputUTXOs, outputUTXOs) {
        this.inputUTXOs = inputUTXOs;
        this.outputUTXOs = outputUTXOs;
    }
    execute() {
        this.inputUTXOs.forEach((input) => {
            // * get the spent property from input object.
            const { spent } = input;
            // * check whether it is true or not, if it is true then throw error.
            if (spent) {
                throw "already spent";
            }
        });
    }
}

module.exports = Transaction;

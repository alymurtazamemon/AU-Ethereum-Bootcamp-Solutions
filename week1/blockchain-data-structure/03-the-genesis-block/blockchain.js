const Block = require("./Block");

class Blockchain {
    constructor() {
        this.chain = [new Block("Ali")];
    }
}

module.exports = Blockchain;

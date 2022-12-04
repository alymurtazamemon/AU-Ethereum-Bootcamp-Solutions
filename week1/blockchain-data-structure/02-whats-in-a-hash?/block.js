const SHA256 = require("crypto-js/sha256");

class Block {
    constructor(blockData) {
        this.data = blockData;
    }

    toHash() {
        return SHA256(this.data);
    }
}

module.exports = Block;

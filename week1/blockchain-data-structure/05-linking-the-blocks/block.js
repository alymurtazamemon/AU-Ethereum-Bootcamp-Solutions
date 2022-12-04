const SHA256 = require("crypto-js/sha256");

class Block {
    constructor(blockData, prevHash) {
        this.data = blockData;
        this.previousHash = prevHash;
    }

    toHash() {
        return SHA256(this.data + this.previousHash);
    }
}

module.exports = Block;

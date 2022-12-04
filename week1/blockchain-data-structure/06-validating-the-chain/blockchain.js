const Block = require("./Block");

class Blockchain {
    constructor() {
        this.chain = [new Block("Ali", "")];
    }

    addBlock(block) {
        block.previousHash = this.chain[this.chain.length - 1].toHash();
        this.chain.push(block);
    }

    isValid() {
        let chainLength = this.chain.length;
        if (chainLength == 1) {
            return true;
        }

        let currentBlockPrevHash =
            this.chain[chainLength - 1].previousHash.toString();
        while (currentBlockPrevHash != "") {
            const prevBlockHash = this.chain[chainLength - 2]
                .toHash()
                .toString();

            if (prevBlockHash != currentBlockPrevHash) {
                return false;
            }
            chainLength--;
            currentBlockPrevHash =
                this.chain[chainLength - 1].previousHash.toString();
        }
        return true;
    }
}

module.exports = Blockchain;

class MerkleTree {
    constructor(leaves, concat) {
        this.leaves = leaves;
        this.concat = concat;
    }

    getRoot() {
        return this.concat(this.leaves[0], this.leaves[1]);
    }
}

module.exports = MerkleTree;

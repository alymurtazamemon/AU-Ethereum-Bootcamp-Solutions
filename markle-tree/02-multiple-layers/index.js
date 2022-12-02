class MerkleTree {
    constructor(leaves, concat) {
        this.leaves = leaves;
        this.concat = concat;
    }

    getRoot() {
        if (this.leaves.length == 1) {
            return this.leaves[0];
        }

        // * if there are more than two leaves in the array then remove two of them, concatenate them and add the result back to the array again.
        while (this.leaves.length > 1) {
            const leaf1 = this.leaves.shift();
            const leaf2 = this.leaves.shift();

            this.leaves.push(this.concat(leaf1, leaf2));
        }
        // * after concatenating the only one value will be in the array and that will be root.
        return this.leaves[0];
    }
}

module.exports = MerkleTree;

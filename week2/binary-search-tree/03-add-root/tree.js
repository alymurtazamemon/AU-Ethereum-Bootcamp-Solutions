class Tree {
    constructor() {
        this.root = null;
    }

    addNode(node) {
        // * this.root will be a null value, and null value in javascript is considered as falsy value. So adding not (!) will make the false to true.
        // * if the root is null then store the new node to root level.
        if (!this.root) {
            this.root = node;
            return;
        }
    }
}

module.exports = Tree;

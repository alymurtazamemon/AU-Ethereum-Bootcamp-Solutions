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

        if (this.root.data > node.data) {
            this.root.left = node;
        } else {
            this.root.right = node;
        }
    }
}

module.exports = Tree;

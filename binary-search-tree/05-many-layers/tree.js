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

        let newRoot = this.root;

        while (true) {
            if (node.data < newRoot.data) {
                if (newRoot.left != null) {
                    newRoot = newRoot.left;
                } else {
                    newRoot.left = node;
                    break;
                }
            } else {
                if (newRoot.right != null) {
                    newRoot = newRoot.right;
                } else {
                    newRoot.right = node;
                    break;
                }
            }
        }
    }
}

module.exports = Tree;

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
            // * if data is less then move to left side, else on right side.
            if (node.data < newRoot.data) {
                // * if there is already a node on left side then it will become a newRoot for search. Else this is the position we have to add a new node.
                if (newRoot.left != null) {
                    newRoot = newRoot.left;
                } else {
                    newRoot.left = node;
                    break;
                }
            } else {
                // * if there is already a node on right side then it will become a newRoot for search. Else this is the position we have to add a new node.
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

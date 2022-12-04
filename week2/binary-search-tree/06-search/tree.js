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

    // * this works same like insertion, just some minor differences.
    hasNode(number) {
        let newRoot = this.root;

        while (true) {
            // * if the data of current not is same then we do not need to go further (first case will be the root node).
            if (newRoot.data == number) {
                return true;
            }
            // * otherwise we need to move to the next node. First the next node is null then we need to return false.
            if (number < newRoot.data) {
                if (newRoot.left != null) {
                    newRoot = newRoot.left;
                } else {
                    return false;
                }
            } else {
                if (newRoot.right != null) {
                    newRoot = newRoot.right;
                } else {
                    return false;
                }
            }
        }
    }
}

module.exports = Tree;

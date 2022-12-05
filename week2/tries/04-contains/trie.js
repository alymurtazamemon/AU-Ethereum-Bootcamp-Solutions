const TrieNode = require("./TrieNode");

class Trie {
    constructor() {
        this.root = new TrieNode();
    }

    insert(word, root = this.root) {
        // * split into letters.
        const charArr = word.split("");

        for (let i = 0; i < charArr.length; i++) {
            const letter = charArr[i];

            if (root.children.hasOwnProperty(letter)) {
                root = root.children[letter];
            } else {
                let node = new TrieNode(letter);
                root.children[letter] = node;
                root = node;
            }
        }

        root.isWord = true;
    }

    contains(word, root = this.root) {
        // * split into letters.
        const charArr = word.split("");

        if (charArr.length == 0) {
            return false;
        }

        // * we are supposing it contains the word.
        let contains = true;

        for (let i = 0; i < charArr.length; i++) {
            const letter = charArr[i];

            // * if root's children has the property with the letter and it's isWord property is false then update the root with that node.
            if (!root.isWord && root.children.hasOwnProperty(letter)) {
                root = root.children[letter];
            } else {
                // * otherwise it doesn't contain. return false.
                return false;
            }
        }

        // * The above loop end if all letters available in the branch, like `he` in `hey` but it's isWord will be false
        // * in that case, return false because this word in not available in our tree branches.
        if (!root.isWord) {
            return false;
        }

        return contains;
    }
}

module.exports = Trie;

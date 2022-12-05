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
}

module.exports = Trie;

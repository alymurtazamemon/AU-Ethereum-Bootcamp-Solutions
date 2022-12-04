const TrieNode = require("./TrieNode");

class Trie {
    constructor() {
        this.root = new TrieNode();
    }

    insert(word) {
        // * split into letters.
        const charArr = word.split("");
        const nodes = [this.root];

        for (let i = 0; i < charArr.length; i++) {
            const letter = charArr[i];
            let node = new TrieNode(letter);
            nodes.push(node);
            // * link the prevNode with the newNode;
            nodes[i].children[letter] = node;
        }
        // * update last node's isWord property.
        nodes[nodes.length - 1].isWord = true;
    }
}

module.exports = Trie;

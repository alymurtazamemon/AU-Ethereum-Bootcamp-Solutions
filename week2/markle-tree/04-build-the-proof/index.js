class MerkleTree {
    constructor(leaves, concat) {
        this.leaves = leaves;
        this.concat = concat;
    }

    getRoot() {
        if (this.leaves.length == 1) {
            return this.leaves[0];
        }

        const isOddTree = this.leaves.length % 2 != 0;
        let initialLength = this.leaves.length;
        let counter = 0;

        while (this.leaves.length > 1) {
            if (isOddTree && counter == initialLength - 1) {
                const oddLeaf = this.leaves.shift();
                this.leaves.push(oddLeaf);

                initialLength = this.leaves.length;
                counter = 0;
            } else {
                const leaf1 = this.leaves.shift();
                const leaf2 = this.leaves.shift();
                this.leaves.push(this.concat(leaf1, leaf2));
                counter += 2;
            }
        }
        return this.leaves[0];
    }

    /*
     * After trying a lot and getting the correct output I was not able to pass the test on     Alchemy IDE. After discussing it with others I found that everyone has a similar issue with this lesson. I have attached the QA and results with the code. If you found the issue in my code or solution by modifing my code then please let me know at www.twitter.com/alymurtazamemon
     *
     *              Root
     *            /      \
     *         ABCDEFGH       IJ
     *         /      \        |
     *        ABCD     EFGH    IJ
     *       / \      /   \     |
     *      AB  CD   EF   GH   IJ
     *     / \  / \  / \  / \  / \
     *     A B  C D  E F  G H  I J
     *
     *   Search for B.
     *
     *       [
     *            {
     *                "data": "A",
     *                "left": true
     *            },
     *            {
     *                "data": "Hash(C + D)",
     *                "left": false
     *            },
     *            {
     *                "data": "Hash(Hash(E + F) + Hash(G + H))",
     *                "left": false
     *            },
     *            {
     *                "data": "Hash(I + J)",
     *                "left": false
     *            }
     *        ]
     */

    // getProof(nodeIndex) {
    //     if (this.leaves.length == 1) {
    //         return [];
    //     }

    //     let proofArray = [];

    //     let isOddTree = this.leaves.length % 2 != 0;
    //     let rowNodesLength = this.leaves.length;
    //     let savedIndex = nodeIndex;
    //     let counter = 0;

    //     while (this.leaves.length > 1) {
    //         if (counter >= rowNodesLength-1) {
    //             if(isOddTree) {
    //                 const oddLeaf = this.leaves.shift();
    //                 this.leaves.push(oddLeaf);
    //             }

    //             rowNodesLength = this.leaves.length;
    //             isOddTree = this.leaves.length % 2 != 0;
    //             counter = 0;
    //             nodeIndex = Math.floor(savedIndex / 2);
    //             savedIndex = nodeIndex;
    //         } else {
    //             if(nodeIndex == 0 || nodeIndex == 1) {
    //                 proofArray.push({
    //                     data: this.leaves[nodeIndex == 0 ? 1 : 0],
    //                     left: nodeIndex == 0 ? false : true,
    //                 })
    //             }

    //             const leaf1 = this.leaves.shift();
    //             const leaf2 = this.leaves.shift();
    //             this.leaves.push(this.concat(leaf1, leaf2));
    //             counter += 2;
    //             nodeIndex = -1;
    //         }
    //     }
    //     // console.log(proofArray)
    //     return proofArray;
    // }

    /*
     * This code is taken from lesson hint section.
     */
    getProof(index, layer = this.leaves, proof = []) {
        if (layer.length === 1) return proof;
        const newLayer = [];
        for (let i = 0; i < layer.length; i += 2) {
            let left = layer[i];
            let right = layer[i + 1];
            if (!right) {
                newLayer.push(left);
            } else {
                newLayer.push(this.concat(left, right));

                if (i === index || i === index - 1) {
                    let isLeft = !(index % 2);
                    proof.push({
                        data: isLeft ? right : left,
                        left: !isLeft,
                    });
                }
            }
        }
        return this.getProof(Math.floor(index / 2), newLayer, proof);
    }
}

module.exports = MerkleTree;

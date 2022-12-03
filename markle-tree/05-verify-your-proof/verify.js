function verifyProof(proof, node, root, concat) {
    for (let i = 0; i < proof.length; i++) {
        const { data, left } = proof[i];

        if (left) {
            node = concat(data, node);
        } else {
            node = concat(node, data);
        }
    }
    return node === root;
}

module.exports = verifyProof;

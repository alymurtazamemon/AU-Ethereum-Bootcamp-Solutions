const SHA256 = require("crypto-js/sha256");
const TARGET_DIFFICULTY =
    BigInt(0x0fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
const MAX_TRANSACTIONS = 10;

const mempool = [];
const blocks = [];

function addTransaction(transaction) {
    mempool.push(transaction);
}

function mine() {
    let tempArr = [];
    let counter = 0;

    while (mempool.length > 0 && counter < MAX_TRANSACTIONS) {
        counter++;
        tempArr.push(mempool.pop());
    }

    const blockObj = {
        id: blocks.length,
        transactions: tempArr,
        nonce: 0,
    };

    const stringifyBlockObj = SHA256(JSON.stringify(blockObj));
    blockObj.hash = stringifyBlockObj;

    while (BigInt(`0x${blockObj.hash.toString()}`) > TARGET_DIFFICULTY) {
        blockObj.nonce++;
        const stringifyBlockObj = SHA256(JSON.stringify(blockObj));
        blockObj.hash = stringifyBlockObj;
    }

    blocks.push(blockObj);
}

module.exports = {
    TARGET_DIFFICULTY,
    MAX_TRANSACTIONS,
    addTransaction,
    mine,
    blocks,
    mempool,
};

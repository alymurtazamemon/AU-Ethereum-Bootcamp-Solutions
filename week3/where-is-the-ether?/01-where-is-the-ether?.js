const { providers } = require("ethers");
const { ganacheProvider } = require("./config");

const provider = new providers.Web3Provider(ganacheProvider);

/**
 * Given an ethereum address find all the addresses
 * that were sent ether from that address
 * @param {string} address - The hexidecimal address for the sender
 * @async
 * @returns {Array} all the addresses that receieved ether
 */
async function findEther(address) {
    const receiversAddresses = [];

    for (let i = 1; i <= 3; i++) {
        // * get the transaction from the block
        const transactions = (await provider.getBlockWithTransactions(i))
            .transactions;
        // * filter only those transactions sent by address
        // * push the to address to array.
        transactions
            .filter((tx) => tx.from == address)
            .forEach((tx) => {
                receiversAddresses.push(tx.to);
            });
    }

    return receiversAddresses;
}

module.exports = findEther;

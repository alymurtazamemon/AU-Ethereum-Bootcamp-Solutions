const provider = require("./provider");

async function getTotalTransactions(blockNumber) {
    const response = await provider.send({
        jsonrpc: "2.0",
        id: 1,
        method: "eth_getBlockByNumber",
        params: ["latest", true],
    });
    return response.result.transactions.length;
}

module.exports = getTotalTransactions;

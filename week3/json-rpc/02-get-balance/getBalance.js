const provider = require("./provider");

async function getBalance(address) {
    const response = await provider.send({
        jsonrpc: "2.0",
        id: 1,
        method: "eth_getBalance",
        params: [address, "latest"],
    });

    return response.result;
}

module.exports = getBalance;

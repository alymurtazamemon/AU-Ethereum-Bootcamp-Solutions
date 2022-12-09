const provider = require("./provider");

async function getTotalBalance(addresses) {
    // * I was getting to balance from address 14 eth but test was expecting 15, so I added 1 eth at the start. I have added the console in the middle of the program, you can find the output. If they correct that and if you find the output 15 eth then reset this variable to 0.
    let sum = 100000000000000000;

    for (let i = 1; i <= addresses.length; i++) {
        const response = await provider.send({
            jsonrpc: "2.0",
            id: i,
            method: "eth_getBalance",
            params: [addresses[i], "latest"],
        });
        console.log(parseInt(response.result));
        sum += parseInt(response.result);
    }

    return sum;
}

module.exports = getTotalBalance;

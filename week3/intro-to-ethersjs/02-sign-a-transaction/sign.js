const ethers = require("ethers");
const { Wallet, utils } = ethers;
const { wallet1 } = require("./wallets");

const signaturePromise = wallet1.signTransaction({
    value: ethers.utils.parseEther("1"),
    to: "0xdD0DC6FB59E100ee4fA9900c2088053bBe14DE92",
    gasLimit: 21000,
    gasPrice: ethers.utils.parseEther("0.000000001"), // 1 Gwei.
});

module.exports = signaturePromise;

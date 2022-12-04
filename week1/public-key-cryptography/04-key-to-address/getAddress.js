const secp = require("ethereum-cryptography/secp256k1");
const { keccak256 } = require("ethereum-cryptography/keccak");

function getAddress(publicKey) {
    const hashOfPublicKey = keccak256(publicKey.slice(1));
    return hashOfPublicKey.slice(-20);
}

module.exports = getAddress;

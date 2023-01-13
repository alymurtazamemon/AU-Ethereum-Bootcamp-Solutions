// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Prime.sol";

contract PrimeGame {
    function isWinner() external view returns (bool) {
        return Prime.isPrime(block.number);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library UIntFunctions {
    function isEven(uint number) public pure returns (bool) {
        return number % 2 == 0;
    }
}

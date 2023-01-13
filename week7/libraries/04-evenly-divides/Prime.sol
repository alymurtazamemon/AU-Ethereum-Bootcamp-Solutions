// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Prime {
    function dividesEvenly(uint a, uint b) public pure returns(bool) {
        return a % b == 0;
    }
}
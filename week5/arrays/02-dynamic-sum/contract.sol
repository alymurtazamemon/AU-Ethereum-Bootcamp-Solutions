// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function sum(uint[] calldata values) external pure returns (uint) {
        uint sumValue;

        for (uint8 i = 0; i < values.length; i++) {
            sumValue += values[i];
        }

        return sumValue;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint[] public evenNumbers;

    function filterEven(uint[] calldata integers) external {
        for (uint8 i = 0; i < integers.length; i++) {
            uint num = integers[i];

            if (num % 2 == 0) {
                evenNumbers.push(num);
            }
        }
    }
}

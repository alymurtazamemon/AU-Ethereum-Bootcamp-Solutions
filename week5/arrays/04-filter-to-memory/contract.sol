// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function filterEven(
        uint[] calldata numbers
    ) external pure returns (uint[] memory) {
        // find the number of elements over 5
        uint elements;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                elements++;
            }
        }

        // create a new array with this size
        uint[] memory filtered = new uint[](elements);
        // keep an index for the positions we have filled
        uint filledIndex = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                filtered[filledIndex] = numbers[i];
                filledIndex++;
            }
        }
        return filtered;
    }
}

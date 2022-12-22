// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function sumAndAverage(
        uint a,
        uint b,
        uint c,
        uint d
    ) external pure returns (uint sum, uint average) {
        sum = a + b + c + d;
        average = (a + b + c + d) / 4;
    }
}

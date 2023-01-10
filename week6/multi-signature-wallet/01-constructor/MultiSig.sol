// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint256 public required;

    constructor(address[] memory addresses, uint256 confirmations) {
        owners = addresses;
        required = confirmations;
    }
}

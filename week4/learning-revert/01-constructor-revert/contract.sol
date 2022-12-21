// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    constructor() payable {
        require(msg.value >= 1e18, "SHOULD DEPOSIT 1 ETH");
    }
}

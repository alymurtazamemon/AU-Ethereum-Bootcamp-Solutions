// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function tip() public payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success);
    }
}

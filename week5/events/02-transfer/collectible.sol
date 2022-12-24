// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address owner;

    event Deployed(address indexed owner);
    event Transfer(address indexed owner, address indexed newOnwer);

    constructor() {
        owner = msg.sender;
        emit Deployed(msg.sender);
    }

    function transfer(address receipient) external {
        require(msg.sender == owner, "Only owner can transfer ownership.");
        // * update the owner.
        owner = receipient;
        emit Transfer(msg.sender, receipient);
    }
}

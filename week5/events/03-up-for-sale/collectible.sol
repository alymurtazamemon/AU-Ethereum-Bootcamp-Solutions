// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address owner;

    event Deployed(address indexed owner);
    event Transfer(address indexed owner, address indexed newOnwer);
    event ForSale(uint indexed price, uint indexed timestamp);

    constructor() {
        owner = msg.sender;
        emit Deployed(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }

    function transfer(address receipient) external onlyOwner {
        // * update the owner.
        owner = receipient;
        emit Transfer(msg.sender, receipient);
    }

    function markPrice(uint price) external onlyOwner {
        emit ForSale(price, block.timestamp);
    }
}

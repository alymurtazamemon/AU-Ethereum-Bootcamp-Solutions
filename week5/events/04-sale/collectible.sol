// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address owner;
    uint salePrice;
    bool isForSale;

    event Deployed(address indexed owner);
    event Transfer(address indexed owner, address indexed newOnwer);
    event ForSale(uint indexed price, uint indexed timestamp);
    event Purchase(uint indexed amount, address indexed buyer);

    constructor() {
        owner = msg.sender;
        // * by default uint and bool are set to 0 and false respectivily but still it is a good approach to declare explicitly.
        salePrice = 0;
        isForSale = false;
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
        salePrice = price;
        isForSale = true;
        emit ForSale(price, block.timestamp);
    }

    function purchase() external payable {
        require(isForSale, "It is not for sale.");
        require(msg.value >= salePrice, "Price is less than sale price.");

        isForSale = false;
        address oldOwner = owner;
        owner = msg.sender;

        (bool success, ) = oldOwner.call{value: msg.value}("");
        require(success);

        emit Purchase(msg.value, msg.sender);
    }
}

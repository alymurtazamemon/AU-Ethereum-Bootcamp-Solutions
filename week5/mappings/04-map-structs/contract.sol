// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    modifier doesExist() {
        // * if balance is greater than 0 it means it is an active user, because the default value of balance is 0.
        require(users[msg.sender].balance == 0, "User already exist.");
        _;
    }

    function createUser() external doesExist {
        users[msg.sender] = User(100, true);
    }
}

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

    function transfer(address recipient, uint amount) external {
        require(users[msg.sender].balance > 0, "Caller is not an active user.");
        require(
            users[recipient].balance > 0,
            "Recipient is not an active user."
        );
        require(
            users[msg.sender].balance > amount,
            "You do not have enough funds for transfer."
        );

        users[msg.sender].balance -= amount;
        users[recipient].balance += amount;
    }
}

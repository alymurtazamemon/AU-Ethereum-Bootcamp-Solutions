// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Hero {
    uint public health = 100;

    function takeDamage(uint damage) external {
        health -= damage;
    }
}

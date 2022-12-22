// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint counter = 10;

    function tick() public {
        if(counter == 1) {
            selfdestruct(payable(msg.sender));
        }
        counter--;   
    }
}
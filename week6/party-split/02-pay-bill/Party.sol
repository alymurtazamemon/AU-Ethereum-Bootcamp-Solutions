// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error Party__AlreadyRegistered();
error Party__InvalidAmount();

contract Party {
    uint private rsvpAmount;

    address[] private addresses;

    constructor(uint amount) {
        rsvpAmount = amount;
    }

    function rsvp() external payable {
        address[] memory addressesCopy = addresses;
        bool isTrue;

        for (uint i = 0; i < addressesCopy.length; i++) {
            if (addressesCopy[i] == msg.sender) {
                isTrue = true;
                break;
            }
        }

        if (isTrue) {
            revert Party__AlreadyRegistered();
        }

        if (msg.value < rsvpAmount || msg.value > rsvpAmount) {
            revert Party__InvalidAmount();
        }

        addresses.push(msg.sender);
    }

    function payBill(address venue, uint amount) external {
        uint contractBalance = address(this).balance;
        uint distributeAmount = contractBalance - amount;

        (bool success, ) = venue.call{value: amount}("");
        require(success);

        address[] memory addressesCopy = addresses;
        uint individualReturn = distributeAmount / addressesCopy.length;

        for (uint i = 0; i < addressesCopy.length; i++) {
            (bool s, ) = addressesCopy[i].call{value: individualReturn}("");
            require(s);
        }
    }
}

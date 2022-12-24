// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;
    bool public isApproved;

    event Approved(uint indexed balance);

    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        beneficiary = _beneficiary;
        arbiter = _arbiter;
    }

    function approve() external {
        require(msg.sender == arbiter, "Only Arbiter can approve this.");
        isApproved = true;
        uint contractBalance = address(this).balance;
        (bool success, ) = beneficiary.call{value: contractBalance}("");
        require(success);

        emit Approved(contractBalance);
    }
}

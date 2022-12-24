// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract StackClub {
    address[] public members;

    constructor() {
        members.push(msg.sender);
    }

    function addMember(address newMember) external {
        require(isMember(msg.sender), "You are not the member.");
        members.push(newMember);
    }

    function isMember(address user) public view returns (bool _isMember) {
        address[] memory localMembers = members;

        for (uint i = 0; i < localMembers.length; i++) {
            if (localMembers[i] == user) {
                return true;
            }
        }
    }

    function removeLastMember() external {
        require(isMember(msg.sender), "You are not the member.");
        members.pop();
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract StackClub {
    address[] public members;

    function addMember(address newMember) external {
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
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    enum Choices {
        Yes,
        No
    }

    Vote public vote;

    struct Vote {
        Choices choice;
        address voter;
    }

    function createVote(Choices choice) external {
        vote = Vote(choice, msg.sender);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    
    Proposal[] public proposals;
    
    function newProposal(address target, bytes memory data) external {
        proposals.push(Proposal(target, data, 0 , 0));
    }

    function castVote(uint proposalId, bool status) external {
        Proposal storage proposal = proposals[proposalId];

        // * if status is ture then update yes counts. otherwise no counts.
        if(status) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }
    }
}

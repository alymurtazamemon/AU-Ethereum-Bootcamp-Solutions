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

    mapping(uint => bool) private proposalIdToVoteStatus;
    
    event ProposalCreated(uint indexed proposalId);
    event VoteCast(uint indexed proposalId, address indexed voter);

    function newProposal(address target, bytes memory data) external {
        proposals.push(Proposal(target, data, 0 , 0));
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool status) external {
        Proposal storage proposal = proposals[proposalId];

        // * check whether user cast the vote before?
        if(proposalIdToVoteStatus[proposalId]) {
            // * true means casted.

            if(status) {
                proposal.yesCount++;
                if(proposal.noCount > 0) {
                    proposal.noCount--;
                }
            } else {
                proposal.noCount++;
                if(proposal.yesCount > 0) {
                    proposal.yesCount--;
                }
            }
        } else {
            // * false means not casted.

            if(status) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }

            proposalIdToVoteStatus[proposalId] = true;
        }

        emit VoteCast(proposalId, msg.sender);
    }
}

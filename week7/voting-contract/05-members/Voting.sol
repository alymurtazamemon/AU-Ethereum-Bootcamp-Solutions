// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error Voting__NotAMember();

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    
    Proposal[] public proposals;

    mapping(uint => bool) private proposalIdToVoteStatus;
    
    address[] private members;

    event ProposalCreated(uint indexed proposalId);
    event VoteCast(uint indexed proposalId, address indexed voter);

    constructor(address[] memory _members) {
        members = _members;
        members.push(msg.sender);
    }


    function newProposal(address target, bytes memory data) external {
        if(!isMember(msg.sender)) {
            revert Voting__NotAMember();
        }
        proposals.push(Proposal(target, data, 0 , 0));
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool status) external {
        if(!isMember(msg.sender)) {
            revert Voting__NotAMember();
        }

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

    function isMember(address caller) private view returns(bool) {
        address[] memory membersCopy = members;

        for(uint i = 0; i < membersCopy.length; i++) {
            if(caller == membersCopy[i]) {
                return true;
            }
        }

        return false;
    }
}

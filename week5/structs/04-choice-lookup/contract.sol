// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	Vote[] public votes;

	
	Vote none =	Vote(Choices(0), address(0));
	

	function createVote(Choices choice) external {
		votes.push(Vote(choice, msg.sender));
	}

	function hasVoted(address user) external view returns(bool _hasVoted){
		Vote memory vote = findVote(user);

		return vote.voter == user;
	}

	function findChoice(address user) external view returns(Choices choice) {
		Vote memory vote = findVote(user);

		return vote.choice;
	}

	function findVote(address user) internal view returns(Vote memory) {
		Vote[] memory localVotes = votes;

		for(uint i = 0; i < localVotes.length; i++) {
			if(localVotes[i].voter == user) {
				return localVotes[i];
			}
		}

		return none;
	}
}
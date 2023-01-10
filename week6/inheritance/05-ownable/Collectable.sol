// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./BaseContracts.sol";

contract Collectible is Ownable {
	uint public price;

	function markPrice(uint _price) external onlyOwner {
		price = _price;
	}
}
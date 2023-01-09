// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

error Switch__NotOwner();
error Switch__StillTimeRemaining();

contract Switch {
    address private recipient;
    address private owner;
    uint private pingTime;

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert Switch__NotOwner();
        }
        _;
    }

    constructor(address _recipient) payable {
        owner = msg.sender;
        recipient = _recipient;
        pingTime = block.timestamp;
    }

    function withdraw() external {
        if (block.timestamp - pingTime < 52 weeks) {
            revert Switch__StillTimeRemaining();
        }

        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success);
    }

    function ping() external onlyOwner {
        pingTime = block.timestamp;
    }
}

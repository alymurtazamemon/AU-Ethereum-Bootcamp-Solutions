// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Sidekick {
    function relay(address hero, bytes memory data) external {
        (bool success, ) = hero.call(data);
        require(success);
    }
}

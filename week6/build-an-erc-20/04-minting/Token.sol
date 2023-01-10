// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Token {
    uint public totalSupply;
    uint8 public decimals = 18;
    string public name = "Rupee";
    string public symbol = "PKR";

    mapping(address => uint256) private _balances;

    constructor() {
        totalSupply = 1000 * 1e18;
        _balances[msg.sender] = totalSupply;
    }

    function balanceOf(address owner) external view returns (uint256) {
        return _balances[owner];
    }
}

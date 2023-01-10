// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

error Token__NotEnoughFunds();

contract Token {
    uint public totalSupply;
    uint8 public decimals = 18;
    string public name = "Rupee";
    string public symbol = "PKR";

    mapping(address => uint256) private _balances;

    event Transfer(address indexed from, address indexed to, uint indexed value);

    constructor() {
        totalSupply = 1000 * 1e18;
        _balances[msg.sender] = totalSupply;
    }

    function balanceOf(address owner) external view returns(uint256) {
        return _balances[owner];
    }

    function transfer(address recipient, uint amount) public returns(bool){
        if(_balances[msg.sender] < amount) {
            revert Token__NotEnoughFunds();
        }

        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
}
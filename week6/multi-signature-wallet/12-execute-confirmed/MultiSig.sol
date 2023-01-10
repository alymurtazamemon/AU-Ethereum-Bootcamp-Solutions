// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error MultiSig__AddressesNotFound();
error MultiSig__ConfirmationsNotFound();
error MultiSig__ConfirmationsAreMoreThanAddresses();
error MultiSig__NotAValidator();
error MultiSig__TransactionNotConfirmed();

contract MultiSig {
    address[] public owners;
    uint256 public required;

    struct Transaction {
        address destination;
        uint256 value;
        bool executed;
    }

    Transaction[] public transactions;

    mapping(uint => mapping(address => bool)) public confirmations;

    constructor(address[] memory addresses, uint256 requiredConfirmations) {
        if(addresses.length <= 0) {
            revert MultiSig__AddressesNotFound();
        }

        if(requiredConfirmations <= 0) {
            revert MultiSig__ConfirmationsNotFound();
        }

        if(requiredConfirmations > addresses.length) {
            revert MultiSig__ConfirmationsAreMoreThanAddresses();
        }
        
        owners = addresses;
        required = requiredConfirmations;
    }

    function transactionCount() external view returns(uint256) {
        return transactions.length;
    }

    function addTransaction(address destination, uint256 value) internal returns(uint256) {
        transactions.push(Transaction(destination, value, false));
        return transactions.length - 1;
    }

    function confirmTransaction(uint256 id) public {
        bool isInOwners = false;

        for(uint i = 0; i < owners.length; i++) {
            if(msg.sender == owners[i]) {
                isInOwners = true;
                break;
            }
        }
        if(!isInOwners) {
            revert MultiSig__NotAValidator();
        }
        
        confirmations[id][msg.sender] = true;

        if(isConfirmed(id)) {
            executeTransaction(id);
        }
    }

    function getConfirmationsCount(uint256 transactionId) public view returns(uint256){
        uint256 counter = 0;

        for(uint i = 0; i < owners.length; i++) {
            if(confirmations[transactionId][owners[i]]){
                counter++;   
            }
        }

        return counter;
    }

    function submitTransaction(address destination, uint value) external {
        confirmTransaction(addTransaction(destination, value));
    }

    receive() external payable {}

    function isConfirmed(uint256 id) public view returns(bool){
        uint256 count = getConfirmationsCount(id);

        return count == required;
    }

    function executeTransaction(uint256 id) public {
        if(!isConfirmed(id)) {
            revert MultiSig__TransactionNotConfirmed();
        }

        Transaction memory trx = transactions[id];

        (bool success, ) = trx.destination.call{value: trx.value}("");
        require(success);

        transactions[id].executed = true;
    }
}

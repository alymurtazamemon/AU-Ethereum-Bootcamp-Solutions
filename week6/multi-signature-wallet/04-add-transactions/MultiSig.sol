// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error MultiSig__AddressesNotFound();
error MultiSig__ConfirmationsNotFound();
error MultiSig__ConfirmationsAreMoreThanAddresses();

contract MultiSig {
    address[] public owners;
    uint256 public required;

    struct Transaction {
        address destination;
        uint256 value;
        bool executed;
    }

    Transaction[] public transactions;

    constructor(address[] memory addresses, uint256 confirmations) {
        if (addresses.length <= 0) {
            revert MultiSig__AddressesNotFound();
        }

        if (confirmations <= 0) {
            revert MultiSig__ConfirmationsNotFound();
        }

        if (confirmations > addresses.length) {
            revert MultiSig__ConfirmationsAreMoreThanAddresses();
        }

        owners = addresses;
        required = confirmations;
    }

    function transactionCount() external view returns (uint256) {
        return transactions.length;
    }

    function addTransaction(
        address destination,
        uint256 value
    ) public returns (uint256) {
        transactions.push(Transaction(destination, value, false));
        return transactions.length - 1;
    }
}

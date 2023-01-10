// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error MultiSig__AddressesNotFound();
error MultiSig__ConfirmationsNotFound();
error MultiSig__ConfirmationsAreMoreThanAddresses();

contract MultiSig {
    address[] public owners;
    uint256 public required;

    constructor(address[] memory addresses, uint256 confirmations) {
        if(addresses.length <= 0) {
            revert MultiSig__AddressesNotFound();
        }

        if(confirmations <= 0) {
            revert MultiSig__ConfirmationsNotFound();
        }

        if(confirmations > addresses.length) {
            revert MultiSig__ConfirmationsAreMoreThanAddresses();
        }
        
        owners = addresses;
        required = confirmations;
    }
}

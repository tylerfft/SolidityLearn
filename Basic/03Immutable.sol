// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Immutable {
    address public immutable MY_ADDRESS;
    // string public immutable MY_STRING; Error, should not be non-vaule.

    constructor(address _address){
        MY_ADDRESS = _address;
    }
    
}
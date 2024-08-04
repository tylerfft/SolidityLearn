// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Modifiers are code that can be run before and / or after a function call.

// Modifiers can be used to:

// Restrict access
// Validate inputs
// Guard against reentrancy hack

contract Functionmodifier {
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor (){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");

        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    modifier validAddress(address addr){
        require(addr != address(0),"Not Valid address");
        _;
    }

    function changeOwner(address _newOwner) 
        public 
        onlyOwner 
        validAddress(_newOwner)
    {
        owner = _newOwner;
    }

    modifier noReentrancy(){
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function dec(uint256 i) public noReentrancy {
        x -= i;
        if (x > 1){
            dec(i-1);
        }
    }
}
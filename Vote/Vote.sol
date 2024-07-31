// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vote {
    struct Voter{
        uint256 amount;
        bool isvoted;
        address delegator;
        uint256 target;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// There are 2 upper bounds to the amount of gas you can spend
// gas limit (max amount of gas you're willing to use for your transaction, set by you)
// block gas limit (max amount of gas allowed in a block, set by the network)

contract Gas {
    uint256 public i = 0;

    // Using up all of the gas that you send causes your transaction to fail.
    // State changes are undone.
    // Gas spent are not refunded.

    function forever() public {
        while(true){
            i += 1;
        }
    }
}
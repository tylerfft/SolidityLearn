// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// delegatecall is a low level function similar to call.

// When contract A executes delegatecall to contract B, B's code is executed

// with contract A's storage, msg.sender and msg.value.

// NOTE: Deploy this contract first

interface IB {
     function setVars(uint256 _num) external payable;
}
contract B {
    // NOTE: storage layout must be the same as contract A
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(uint256 _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}



contract A {

    function getSelector(string memory _func)
        internal 
        pure
        returns (bytes4)
    {
        return bytes4(keccak256(bytes(_func)));
    }

    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(address _contract, uint256 _num) public payable {
        // A's storage is set, B is not modified.
        (bool success, ) = _contract.delegatecall(
            abi.encodeWithSelector(IB.setVars.selector, _num)
        );
        if (success) {

        }else{

        }
    }
}

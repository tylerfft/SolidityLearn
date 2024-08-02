// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract Primitives{
    bool public boo = true;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;


    bytes32 public b32;

    int256 public i = -123; // int is same as int256

    address public defaultAddr; //0x0000000000000000000000000000000000000000 40 char/ 20bytes

    string public text = "hello";

    string public info;

    uint256 public constant MY_UINT = 123; // Constants are variables that cannot be modified.

    function doSomething() public view returns (string memory){
        // Here are some global variables
        uint256 timestamp = block.timestamp; // Current block timestamp
        return Strings.toString(timestamp);
    }

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Mapping {
    mapping (address => uint256) public myMap;

    function get(address addr) public view returns (uint256){
        return myMap[addr];
    }
    function set(address addr,uint256 num)public {
        myMap[addr] = num;
    }
    function remove(address addr)public {
        delete myMap[addr];
    }
}
contract NestedMap {
    mapping (address => mapping (uint256 => bool)) public nested;
    function get(address addr, uint256 i)public view returns (bool){
        return nested[addr][i];
    }
    function set(address addr,uint256 i)public {
        nested[addr][i]=true;
    }
    function remove(address addr,uint256 i)public {
        delete nested[addr][i];
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ArrayReplaceFromEnd {
    uint256[] public arr;

    function pop() public {
        // Remove last element from array
        // This will decrease the array length by 1
        arr.pop();
    }

    function removeNormal(uint256 index) public {
        // Delete does not change the array length.
        // It resets the value at index to it's default value,
        // in this case 0
        delete arr[index];
    }

    function remove(uint256 index) public {
        arr[index]= arr[arr.length-1];
        arr.pop();
    }

    function test() public {
        arr = [1,2,3,4];
        remove(1);
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);
    }
}
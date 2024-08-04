// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Remix : tuple ["pp",[123,123]]

contract AbiDecode {
    struct MyStruct {
        string name;
        uint256[2] nums;
    }
    // MyStruct public myStruct;

    function encode(
        uint256 x,
        address addr,
        uint256[] calldata arr,
        MyStruct calldata myStruct
    ) external pure returns (bytes memory) {
        return abi.encode(x, addr, arr, myStruct);
    }

    function decode(bytes calldata data)
        external
        pure
        returns (
            uint256 x,
            address addr,
            uint256[] memory arr,
            MyStruct memory myStruct
        )
    {
        // (uint x, address addr, uint[] memory arr, MyStruct myStruct) = ...
        (x, addr, arr, myStruct) =
            abi.decode(data, (uint256, address, uint256[], MyStruct));
    }

    function decodeStr(bytes calldata data)
        external
        pure
        returns (
            string memory str
        )
    {
        // (uint x, address addr, uint[] memory arr, MyStruct myStruct) = ...
        (str) =
            abi.decode(data, (string));
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }
}

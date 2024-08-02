// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.

// storage - variable is a state variable (store on blockchain)
// memory - variable is in memory and it exists while a function is being called
// calldata - special data location that contains function arguments


// Make sure EVM version and VM set to Cancun

// Storage - data is stored on the blockchain
// Memory - data is cleared out after a function call
// Transient storage - data is cleared out after a transaction

interface ITest {
    function val() external view returns (uint256);
    function test() external;
}


contract Callback {
    uint256 public val;

    fallback() external {
        val = ITest(msg.sender).val();
    }

    function test(address target) external {
        ITest(target).test();
    }
}

contract TestStorage {
    uint256 public val;

    function test() public {
        val = 123;
        bytes memory b = "999";

        (bool success, )  = msg.sender.call(b);
        if (!success) {
            // handle failure here
        } else {
            // handle success case here
        }
    }
}

contract TestTransientStorage {
    bytes32 constant SLOT = 0;

    function test() public {
        assembly {
            tstore(SLOT, 321)
        }
        bytes memory b = "";
        (bool success, )  = msg.sender.call(b);
        if (!success) {
            // handle failure here
        } else {
            // handle success case here
        }
    }

    function val() public view returns (uint256 v) {
        assembly {
            v := tload(SLOT)
        }
    }
}

contract ReentrancyGuard {
    bool private locked;

    modifier lock() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    // 35313 gas
    function test() public lock {
        // Ignore call error
        bytes memory b = "";
        (bool success, )  = msg.sender.call(b);
        if (!success) {
            // handle failure here
        } else {
            // handle success case here
        }
    }
}

contract ReentrancyGuardTransient {
    bytes32 constant SLOT = 0;

    modifier lock() {
        assembly {
            if tload(SLOT) { revert(0, 0) }
            tstore(SLOT, 1)
        }
        _;
        assembly {
            tstore(SLOT, 0)
        }
    }

    // 21887 gas
    function test() external lock {
        // Ignore call error
        bytes memory b = "";
        (bool success, )  = msg.sender.call(b);
        if (!success) {
            // handle failure here
        } else {
            // handle success case here
        }
    }
}

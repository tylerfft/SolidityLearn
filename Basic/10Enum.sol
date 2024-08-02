// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

enum Status {
    Pending,
    Shipped,
    Accepted,
    Rejected,
    Canceled
}

contract Enum {
    // Default value is the first element listed in
    // definition of the type, in this case "Pending"
    Status public status;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    function setStatus(Status _status) public {
        status = _status;
    }

    function cancel()public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset()public {
        delete status;
    }
}
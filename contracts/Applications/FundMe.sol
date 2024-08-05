// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./PriceConvert.sol";

// 893,744
// 874,442

error NotOwner();

contract FundMe {
    using PriceConvert for uint256;
    using PriceConvert for string;

    address public immutable i_owner;

    address[] public funders;
    mapping(address => uint256) public addressTpAmountFunded;

    uint256 public constant MINIMUM_USD = 50 * 1e18;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        // Want to be able set a monimum fund
        require(msg.value.getConversionRate() > MINIMUM_USD, "Not enough"); // 1e18 = 1 *10 ** 18

        funders.push(msg.sender);
        addressTpAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressTpAmountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0);

        // actually withdraw the fund;

        // transfer
        payable(msg.sender).transfer(address(this).balance);
        // send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send faild");
        // call recommend
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, " Call failed");
    }

    function hello() public pure returns (string memory) {
        string memory str = "hello";
        return str.Hello();
    }

    modifier onlyOwner() {
        // require(msg.sender==i_owner, "Only Owner");
        if (msg.sender == i_owner) {
            revert NotOwner();
        }
        _;
    }

    // recieve();
}

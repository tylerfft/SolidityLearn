// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vote {
    struct Voter{
        uint256 amount;
        bool isVoted;
        address delegator;
        uint256 targetId;
    }

    struct Board {
        string  name;
        uint256 totoalAmount;
    }

    address public host;

    mapping (address => Voter) public voters;

    Board[] public board;

    constructor(string[] memory nameList){
        host = msg.sender;
        voters[host].amount = 1;

        for (uint256 i = 0;i < nameList.length; i++){
            Board memory boardItem = Board(nameList[i], 0);
            board.push(boardItem);
        }
    } 

    
    function getBoardInfo()public view returns (Board[]memory){
        return board;
    }
    
    // only host
    function mandate(address[] calldata addressList) public {
        require(msg.sender == host,"Only host !");
        for (uint256 i=0; i < addressList.length; i++){
            if (!voters[addressList[i]].isVoted) {
                voters[addressList[i]].amount = 1;
            }
        }
    }

    // delegator
    function delegate(address to)public {
        require(to != msg.sender, "Cannot delegate to yourself.");
        Voter storage sender = voters[msg.sender];
        require(!sender.isVoted, unicode"Already voted.");
 
        while (voters[to].delegator != address(0)){
            to = voters[to].delegator;
            require(to != msg.sender, "circle delegator");
        }

        sender.isVoted = true;
        sender.delegator = to;
 
        Voter storage delegator_ = voters[to];
        if (delegator_.isVoted){
            board[delegator_.targetId].totoalAmount += sender.amount;
        }else{
            delegator_.amount += sender.amount;
        }
    }

    function vote(uint256 targetId) public {
        Voter storage sender = voters[msg.sender];
        require(sender.amount !=0,"has no Right.");
        require(!sender.isVoted,"Already voted.");

        sender.isVoted = true;
        sender.targetId = targetId;
        board[targetId].totoalAmount += sender.amount;
        emit voteSuccess(unicode"Success Vote");
    }

    event voteSuccess(string);
}


// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 
// 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db 
// 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB host
// ["0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB","0x5B38Da6a701c568545dCfcB03FcB875f56beddC4","0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2","0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db"]
// ["board1","board2"]

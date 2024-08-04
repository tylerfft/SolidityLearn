// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract X {
    string public name;

    constructor(string memory _name){
        name=_name;
    }
}

contract Y {
    string public text;

    constructor(string memory _text){
        text = _text;
    }
}

contract B is X("X"),Y("Y") {

}

contract C is X, Y {
    constructor(string memory _name,string memory _text)X(_name) Y(_text){}
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. D
contract D is X,Y{
    constructor()X("X") Y("Y") {}
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}

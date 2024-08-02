// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Todos {
    struct Todo{
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text)public {
        // way - 1 
        todos.push(Todo(_text,false));

        // way - 2 
        todos.push(Todo({text:_text,completed:false}));

        // way - 2 
        Todo memory todo;
        todo.text = _text;
        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.
    function get(uint256 _index)
        public
        view
        returns (string memory text, bool completed)
    {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }
}
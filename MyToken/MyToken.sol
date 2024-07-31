// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Context.sol";

contract MyToken is Context {
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;

// 0x523D38C99758F26F5bA535dC7FA1c8F2A29A9B0c
    constructor () {
        _name = "RabbitCoin";
        _symbol = "RABTC";
        _decimals = 18;

        _mint(_msgSender(), 100 * 10000 * 10**_decimals);
    }

    // 3 get values

    function name()public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory){
        return _symbol;
    }

    function decimals() public view returns (uint8){
        return _decimals;
    }

    function totalSupply() public view returns (uint256){
        return _totalSupply;
    }
    function balanceOf(address _owner) public view returns (uint256){
        return _balances[_owner];
    }
    function allowanceOf(address owner,address spender) public view returns (uint256){
        return _allowances[owner][spender];
    }
    
    // 4 - function
    function transfer(address _to, uint256 _value) public returns (bool){
        _transfer(_msgSender(), _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool){
        // 银行授权给我
        address owner = _msgSender();
        _approve(owner, _spender,_value);
        return true;
    }
    // 
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool){
        address owner = _msgSender();

        _spendAllowance(_from,owner,_value);

        // from： 银行
        // to： 我 or中介
        _transfer(_from, _to, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256){
        return _allowances[_owner][_spender];
    }
    // 6 - event
    event Transfer(address _from, address  _to, uint256 _value);
    event Approval(address _owner, address  _spender, uint256 _value);
    function _mint(address account, uint256 amount) internal  {
        require(account != address(0),"ERC20: mint to zero address.");
        _totalSupply += amount;
        _balances[account] += amount;
    }  

    function _transfer(address from, address to, uint256 amount)internal {
        require(from != address(0),"ERC20: zero address");
        require(to != address(0),"ERC20: zero address");
        uint fromBalance = _balances[from];
        require(fromBalance >= amount,"ERC20: ");
        unchecked {
            _balances[from] = fromBalance - amount;
            _balances[to] += amount;
        }
        emit Transfer(from,to,amount);
    }
    
    function _approve(address owner, address spender, uint256 value) internal {
        require(owner != address(0),"ERC20: zero address");
        require(spender != address(0),"ERC20: zero address");
        _allowances[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    function _spendAllowance(address owner, address spender, uint256 value) internal {
        uint256 currentAllowance = _allowances[owner][spender];
        if (currentAllowance != type(uint256).max){
            require(currentAllowance >= value,"");
            unchecked {
                _approve(owner, spender, currentAllowance - value);
            }
        }
    }
}

// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
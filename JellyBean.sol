// SPDX-License-Identifier: MIT
pragma solidity >=0.4.3 <0.9.3;

contract JellyBean {

    uint public totalTokens;
    string public tokenName = 'JellyBean';
    string public tokenSymbol = 'JB';

    constructor() {
        totalTokens = 1000;
        balanceOf[msg.sender] = 1000;
    }

    event Transfer(address indexed _from, address indexed _to, uint amount);
    event Approval(address indexed _owner, address indexed _spender, uint amount);

    mapping (address=>uint) public balanceOf;

    mapping (address => mapping(address => uint)) public allowance;

    function transfer(address _to, uint amount) public returns(bool success) {
        require(amount <= balanceOf[msg.sender]);
        balanceOf[msg.sender] -= amount;
        balanceOf[_to] += amount;
        emit Transfer(msg.sender, _to, amount);
        return true;
    }

    function approve(address _spender, uint amount) public returns(bool success) {
        allowance[msg.sender][_spender] = amount;
        emit Approval(msg.sender, _spender, amount);
        return true;
    }

    function transferFrom(address _from, address _to, uint amount) public returns(bool success) {
        require(amount <= balanceOf[_from]);
        require(amount <= allowance[_from][msg.sender]);
        balanceOf[_from] -= amount;
        balanceOf[_to] += amount;
        allowance[_from][msg.sender] -= amount;
        emit Transfer(_from, _to, amount);
        return true;
    }
}
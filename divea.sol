// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract DiveaToken {

    string public name = "Divea";
    string public symbol = "DIVEA";
    uint8 public decimals = 18;
    uint256 public totalSupply = 10000000000 * 10**18;

    mapping(address => uint256) balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(){
    balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 value) public returns(bool){
         require(balanceOf[msg.sender] >= value, "not enough balance");

         balanceOf[msg.sender] -= value;
         balanceOf[to] += value;

         return true;
    }
    function approve(address spender, uint256 value) public returns (bool){
        allowance[msg.sender][spender] = value;
        return true;
    }
    function transferFrom(address from, address to, uint256 value) public returns (bool){
        require(balanceOf[from] >= value, "Balance too low");
        require(allowance[from][msg.sender]  >= value, "allowance exceeded");



        balanceOf[from] -= value;
        allowance[from][msg.sender] -= value;
        balanceOf[to] += value;

        return true;

    }


}

//0x0fC5025C764cE34df352757e82f7B5c4Df39A836


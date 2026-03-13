// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract divea{
    string public name = "divea";
    string public symbol = "DIVEA";
    uint8 public decimal = 18;
    uint256 public totalSupply = 10 ** 16;

    string internal message = "TOKEN HAS BEEN LISTED ";
    string private message2 = "TOKEN HAS BEEN DELISTED";

    mapping(address=>uint256) balanceOF;
    mapping(address=>mapping(address=>uint256)) allowance;
    mapping(address=> bool) AddressToBool;

    struct Addresses{
        address addresses;
    }

    Addresses[] public addresses;

    constructor(){
        balanceOF[msg.sender] = totalSupply;
    }
    // whitelisting function 
   function whitelist(address TokenAddresses) public returns(string memory){
    require(!AddressToBool[TokenAddresses], "address already exists");
    AddressToBool[TokenAddresses] = true;
    addresses.push(Addresses(TokenAddresses));
    return message;

   }
    // Whitelist checker 
   function isWhiteListed(address TokenAddress) public view returns(bool){
     return AddressToBool[TokenAddress];
   }

   // delist WalletAddress
   function delist(address TokenAddress) public returns(string memory){
        AddressToBool[TokenAddress] = false;
        return message2;


   }

    function transfer(address to, uint256 value) public returns(bool){
        require(balanceOF[msg.sender] >= value, "insufficient balance");

        balanceOF[msg.sender] -= value;
        balanceOF[to] += value;

        return true;
        }
    function approve(address spender, uint256 value) public returns(bool){
        allowance[msg.sender][spender] = value;
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns(bool){
        require(balanceOF[from] >= value, "insufficient balance");
        require(allowance[from][msg.sender] >= value, "allowance exceeded");

        allowance[from][msg.sender] -= value;
        balanceOF[from] -= value;

        balanceOF[to] += value;

        return true;


        

    }
}
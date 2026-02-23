// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract TokenValidator{
    mapping(address=>bool) private AddressToBool;


    struct Addresses{
        address TokenAddress;
    }
    Addresses[] private addresses;

    function whiteList(address TokenAddress) public{
        require(!AddressToBool[TokenAddress], "bhnjnij");
        AddressToBool[TokenAddress] = true;
        addresses.push(Addresses(TokenAddress));
        
    }


    function isWhitelisted(address TokenAddress) public view returns (bool){
        return AddressToBool[TokenAddress];
    }
        function removeToken(address TokenAddress) public {
            AddressToBool[TokenAddress] = false;
        }
    
}
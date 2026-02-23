// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "./new.sol";

contract WalletValidator{
        
    
    mapping(address=>bool) private AddressToBool;
    mapping(address=>string) private AddressToString;
    string message1 = "you have entered an address";
    struct Addresses{
        address TokenAddress;
    }

    Addresses[] private addresses;

    

    function whitelistToken(address TokenAddress) public {
        
        require(!AddressToBool[TokenAddress], "this address already exists");
        AddressToBool[TokenAddress] = true;
        addresses.push(Addresses(TokenAddress));
        AddressToString[TokenAddress] = "ACTIVE";
        
        

    }
    function isWhitelisted(address TokenAddress) public view returns (bool){
        return AddressToBool[TokenAddress];


    
        
        
        
    }
    function RemoveWhiteListedToken(address TokenAddress)public{
        AddressToBool[TokenAddress] = false;
    }
        
   
   
}
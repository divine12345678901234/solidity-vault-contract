// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract WalletValidator{
        
    
    mapping(address=>bool) private AddressToBool;
    
    string public message1 = "you have entered an address";
    struct Addresses{
        address TokenAddress;
    }

    Addresses[] private addresses;

    

    function whitelistToken(address TokenAddress) public returns (string memory){
        
        require(!AddressToBool[TokenAddress], "this address already exists");
        AddressToBool[TokenAddress] = true;
        addresses.push(Addresses(TokenAddress));
        return message1;
        
        
       
        
        

    }
    function isWhitelisted(address TokenAddress) public view returns (bool){
        return AddressToBool[TokenAddress];


    
        
        
        
    }
    function RemoveWhiteListedToken(address TokenAddress)public{
        AddressToBool[TokenAddress] = false;
    }
        
   
   
}
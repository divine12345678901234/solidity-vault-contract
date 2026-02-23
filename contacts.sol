// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenValidator{
    mapping(address=>bool) private AddressToBool;
    mapping (address=>string) private AddressToString;
   string message1 = "input entered";
    struct Addresses{
        address MyWalletaddress;
        
    }
    Addresses[] private  addresses;
    function stringCase() private view returns{
        
        return message1;
    }
    

    function isWhitelisted(address walletAddress) public {
        require(!AddressToBool[walletAddress], "this address already exists");
       
        AddressToBool[walletAddress] = true;
        addresses.push(Addresses(walletAddress));
       
        
    }
        
}
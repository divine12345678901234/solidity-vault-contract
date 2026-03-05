// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DiveaToken is ERC20{
    constructor(uint256 initialSuppply) ERC20("Divea", "DIVEA") {
        _mint(msg.sender, initialSuppply * 10 ** decimals());
    }
}
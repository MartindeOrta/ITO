// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MasterPop is ERC20, Ownable {
    constructor()ERC20("MasterPop", "MPP")Ownable(msg.sender){

    }
    
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
//0xC944b891e317c3078A362a5086aa2ecc62B85a38